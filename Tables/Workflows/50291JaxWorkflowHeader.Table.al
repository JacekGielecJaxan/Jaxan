table 50291 "Workflow Header"
{
    Caption = 'Workflow Header';
    DataCaptionFields = "No.", "Buy-from Vendor Name";
    LookupPageID = "Workflow List";
    DataClassification = CustomerContent;

    fields
    {
        field(2; "Document Type"; Enum "Purchase Document Type")
        {
            Caption = 'Document Type';
        }
        field(3; "Buy-from Vendor No."; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            TableRelation = Vendor;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateBuyFromVendorNo(Rec, xRec, CurrFieldNo, SkipBuyFromContact, IsHandled);
                if IsHandled then
                    exit;

                if "No." = '' then
                    InitRecord();
                TestStatusOpen();



                GetVend("Buy-from Vendor No.");
                CheckBlockedVendOnDocs(Vend);
                OnAfterCheckBuyFromVendor(Rec, xRec, Vend);

                "Buy-from Vendor Name" := Vend.Name;
                "Buy-from Vendor Name 2" := Vend."Name 2";
                CopyBuyFromVendorAddressFieldsFromVendor(Vend, false);
                if not SkipBuyFromContact then
                    "Buy-from Contact" := Vend.Contact;
                "VAT Registration No." := Vend."VAT Registration No.";
                OnAfterCopyBuyFromVendorFieldsFromVendor(Rec, Vend, xRec);

                if not SkipBuyFromContact then
                    UpdateBuyFromCont("Buy-from Vendor No.");

                OnValidateBuyFromVendorNoOnAfterUpdateBuyFromCont(Rec, xRec, CurrFieldNo, SkipBuyFromContact);

            end;
        }
        field(4; "No."; code[50])
        {
            Caption = 'No.';
        }
        //rodzaj dokumentu
        field(5; "Kind of Document"; code[20])
        {
            Caption = 'Kind of Document';
            TableRelation = "Workflow Kind of Document";

            trigger OnValidate()
            var
                kindofdocument: Record "Workflow Kind of Document";
            begin
                if kindofdocument.Get("Kind of Document") then
                    Important := kindofdocument.Important;
            end;
        }
        field(6; Important; Boolean)
        {
            Caption = 'Important';
        }
        field(11; "Your Reference"; Text[35])
        {
            Caption = 'Your Reference';
        }

        field(19; "Receipt Date"; Date)
        {
            Caption = 'Receipt Date';
        }
        field(22; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(24; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(32; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(46; Comment; Boolean)
        {
            CalcFormula = exist("Workflow Comment Line" where("No." = field("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; "On Hold"; Code[3])
        {
            Caption = 'On Hold';
        }
        field(52; "Comment Exists"; Boolean)
        {
            Caption = 'Comment Exists';
            FieldClass = FlowField;
            CalcFormula = Exist("Workflow Comment Line" where("No." = field("No.")));

        }
        //Kwota zero
        field(59; "Amount Zero"; Boolean)
        {
            Caption = 'Amount Zero';

            trigger OnValidate()
            begin
                if "Amount Zero" then begin
                    Amount := 0;
                    "Amount Including VAT" := 0;
                end;
            end;
        }
        field(60; Amount; Decimal)
        {
            AutoFormatExpression = Rec."Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';

            trigger OnValidate()
            begin
                if Amount <> 0 then
                    "Amount Zero" := false;
            end;
        }
        field(61; "Amount Including VAT"; Decimal)
        {
            AutoFormatExpression = Rec."Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount Including VAT';

            trigger OnValidate()
            begin
                if "Amount Including VAT" <> 0 then
                    "Amount Zero" := false;
            end;
        }
        field(68; "Vendor Document No."; Code[35])
        {
            Caption = 'Vendor Document No.';

            trigger OnValidate()
            var
                WorkflowHeader: record "Workflow Header";
            begin
                //TODO: Dodac sprawdzenie czy juz jest rekord z podanym numerem dokumentu ale w obszarze workflow
                //if "Vendor Document No." <> '' then
                //    if FindPostedDocumentWithSameExternalDocNo(WorkflowHeader) then
                //        ShowExternalDocAlreadyExistNotification(WorkflowHeader)
                //    else
                //        RecallExternalDocAlreadyExistsNotification();
            end;
        }
        field(70; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(73; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(79; "Buy-from Vendor Name"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                VendorName: Text;
            begin
                VendorName := "Buy-from Vendor Name";
                LookupBuyFromVendorName(VendorName);
                "Buy-from Vendor Name" := CopyStr(VendorName, 1, MaxStrLen("Buy-from Vendor Name"));
            end;

            trigger OnValidate()
            var
                Vendor: Record Vendor;
                LookupStateManager: Codeunit "Lookup State Manager";
                StandardCodesMgt: Codeunit "Standard Codes Mgt.";
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateBuyFromVendorName(Rec, Vendor, IsHandled);
                if IsHandled then begin
                    if LookupStateManager.IsRecordSaved() then
                        LookupStateManager.ClearSavedRecord();
                    exit;
                end;

                if LookupStateManager.IsRecordSaved() then begin
                    Vendor := LookupStateManager.GetSavedRecord();
                    if Vendor."No." <> '' then begin
                        LookupStateManager.ClearSavedRecord();
                        Validate("Buy-from Vendor No.", Vendor."No.");
                        OnLookupBuyfromVendorNameOnAfterSuccessfulLookup(Rec);
                        exit;
                    end;
                end;

                if ShouldSearchForVendorByName("Buy-from Vendor No.") then
                    Validate("Buy-from Vendor No.", Vendor.GetVendorNo("Buy-from Vendor Name"));
            end;
        }
        field(80; "Buy-from Vendor Name 2"; Text[50])
        {
            Caption = 'Buy-from Vendor Name 2';
        }
        field(81; "Buy-from Address"; Text[100])
        {
            Caption = 'Buy-from Address';
        }
        field(82; "Buy-from Address 2"; Text[50])
        {
            Caption = 'Buy-from Address 2';
        }
        field(83; "Buy-from City"; Text[30])
        {
            Caption = 'Buy-from City';
        }
        field(84; "Buy-from Contact"; Text[100])
        {
            Caption = 'Buy-from Contact';

            trigger OnLookup()
            begin
                LookupBuyFromContact();
            end;

            trigger OnValidate()
            begin
            end;
        }
        field(99; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(104; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(120; Status; Enum "Workflow Document Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(151; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(5052; "Buy-from Contact No."; Code[20])
        {
            Caption = 'Buy-from Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            begin
                BuyfromContactLookup();
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
            begin
                TestStatusOpen();

                if "Buy-from Contact No." <> '' then
                    if Cont.Get("Buy-from Contact No.") then
                        Cont.CheckIfPrivacyBlockedGeneric();

                if ("Buy-from Contact No." <> xRec."Buy-from Contact No.") and
                   (xRec."Buy-from Contact No." <> '')
                then
                    if ("Buy-from Vendor No." <> '') and ("Buy-from Contact No." <> '') then
                        CheckContactRelatedToVendorCompany("Buy-from Contact No.", "Buy-from Vendor No.", FieldNo("Buy-from Contact No."));

                if ("Buy-from Contact No." <> xRec."Buy-from Contact No.") then
                    UpdateBuyFromVend("Buy-from Contact No.");
            end;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                TestStatusOpen();

            end;
        }
        field(9000; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(9001; "Pending Approvals"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Table ID" = const(50291),
                                                        "Document No." = field("No."),
                                                        Status = filter(Open | Created)));
            Caption = 'Pending Approvals';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key4; "Document Type")
        {
        }
        key(Key3; "Document Type", "Buy-from Vendor No.")
        {
        }
        key(Key5; "Buy-from Vendor No.")
        {
        }
        key(Key7; "Document Date")
        {
        }
        key(Key9; "Assigned User ID")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Buy-from Vendor Name", "Amount Including VAT")
        {
        }
    }

    trigger OnDelete()
    var
        CommentLine: Record "Workflow Comment Line";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnDelete(Rec, IsHandled);
        if IsHandled then
            exit;

        CommentLine.SetRange("No.", "No.");
        CommentLine.DeleteAll();

    end;

    trigger OnInsert()
    var
        IsHandled: Boolean;
    begin
        OnBeforeOnInsert(Rec, IsHandled);
        if IsHandled then
            exit;

        InitInsert();

    end;

    trigger OnRename()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnRename(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        Error(Text003, TableCaption);
    end;

    var
        Text003: Label 'You cannot rename a %1.';
        ConfirmChangeQst: Label 'Do you want to change %1?', Comment = '%1 = a Field Caption like Currency Code';
        GLSetup: Record "General Ledger Setup";
        WorkflowSetup: record "Workflow Setup";
        Vend: Record Vendor;
        SkipBuyFromContact: Boolean;
        NoSeries: Codeunit "No. Series";
        UserSetupMgt: Codeunit "User Setup Management";
        Confirmed: Boolean;
        Text037: Label 'Contact %1 %2 is not related to vendor %3.';
        Text038: Label 'Contact %1 %2 is related to a different company than vendor %3.';
        Text039: Label 'Contact %1 %2 is not related to a vendor.';
        BuyFromVendorTxt: Label 'Buy-from Vendor';
        SelectNoSeriesAllowed: Boolean;

        HideValidationDialog: Boolean;
        StatusCheckSuspended: Boolean;

    procedure InitInsert()
    var
        WorkflowHeader2: Record "Workflow Header";
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInitInsert(Rec, xRec, IsHandled);
        if not IsHandled then
            if "No." = '' then begin
                TestNoSeries();
                NoSeriesCode := GetNoSeriesCode();
                "No. Series" := NoSeriesCode;
                if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeries.GetNextNo("No. Series", workdate());
                WorkflowHeader2.ReadIsolation(IsolationLevel::ReadUncommitted);
                WorkflowHeader2.SetLoadFields("No.");
                while WorkflowHeader2.Get("No.") do
                    "No." := NoSeries.GetNextNo("No. Series", workdate());
            end;

        OnInitInsertOnBeforeInitRecord(Rec, xRec);
        InitRecord();
    end;

    procedure InitRecord()
    var
        IsHandled, SkipInitialization : Boolean;
    begin
        GetWorkflowSetup();
        IsHandled := false;
        OnBeforeInitRecord(Rec, IsHandled, xRec, WorkflowSetup, GLSetup, SkipInitialization);
        if SkipInitialization then
            exit;

        "Document Date" := WorkDate();

        OnInitRecordOnAfterAssignDates(Rec);

        OnAfterInitRecord(Rec);
    end;

    local procedure InitNoSeries()
    begin

        OnAfterInitNoSeries(Rec, xRec);
    end;

    procedure AssistEdit(OldHeader: Record "Workflow Header"): Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, OldHeader, IsHandled);
        if IsHandled then
            exit;

        GetWorkflowSetup();
        TestNoSeries();
        if NoSeries.LookupRelatedNoSeries(GetNoSeriesCode(), OldHeader."No. Series", "No. Series") then begin
            "No." := NoSeries.GetNextNo("No. Series");
            exit(true);
        end;
    end;

    procedure TestNoSeries()
    var
        IsHandled: Boolean;
    begin
        GetWorkflowSetup();
        IsHandled := false;
        OnBeforeTestNoSeries(Rec, IsHandled);
        if not IsHandled then
            WorkflowSetup.TestField("Workflow Nos.");

        OnAfterTestNoSeries(Rec, WorkflowSetup);
    end;

    procedure GetNoSeriesCode(): Code[20]
    var
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
    begin
        GetWorkflowSetup();
        IsHandled := false;
        OnBeforeGetNoSeriesCode(WorkflowSetup, NoSeriesCode, IsHandled, Rec);
        if IsHandled then
            exit(NoSeriesCode);

        NoSeriesCode := WorkflowSetup."Workflow Nos.";

        OnAfterGetNoSeriesCode(Rec, WorkflowSetup, NoSeriesCode);

        if not SelectNoSeriesAllowed then
            exit(NoSeriesCode);

        exit(NoSeriesCode);
    end;

    local procedure GetWorkflowSetup()
    begin
        WorkflowSetup.Get();
        OnAfterGetWorkflowSetup(Rec, WorkflowSetup, CurrFieldNo);
    end;

    procedure GetVend(VendNo: Code[20])
    begin
        if VendNo <> Vend."No." then
            Vend.Get(VendNo);
    end;

    procedure GetStatusStyleText() StatusStyleText: Text
    begin
        if Status = Status::Open then
            StatusStyleText := 'Favorable'
        else
            StatusStyleText := 'Strong';

        OnAfterGetStatusStyleText(Rec, StatusStyleText);
    end;

    internal procedure LookupBuyFromContact()
    var
        Contact: Record Contact;
    begin
        if "Buy-from Vendor No." = '' then
            exit;

        Contact.FilterGroup(2);
        LookupContact("Buy-from Vendor No.", "Buy-from Contact No.", Contact);
        if PAGE.RunModal(0, Contact) = ACTION::LookupOK then
            Validate("Buy-from Contact No.", Contact."No.");
        Contact.FilterGroup(0);
    end;

    procedure GetHideValidationDialog(): Boolean
    begin
        exit(HideValidationDialog);
    end;

    procedure SetHideValidationDialog(NewHideValidationDialog: Boolean)
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;

    procedure SetStatus(NewStatus: Option)
    begin
        Status := Enum::"Workflow Document Status".FromInteger(NewStatus);
        Modify();
    end;

    local procedure ConfirmUpdateField(UpdatingFieldNo: Integer) Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeConfirmUpdateField(Rec, xRec, UpdatingFieldNo, CurrFieldNo, Result, IsHandled);
        if IsHandled then
            exit(Result);

        if GetHideValidationDialog() or not GuiAllowed then
            Result := true
        else
            Result := Confirm(ConfirmChangeQst, false, GetUpdatedFieldCaption(UpdatingFieldNo));
    end;

    procedure GetUpdatedFieldCaption(UpdatingFieldNo: Integer): Text
    var
        RecRef: RecordRef;
        FldRef: FieldRef;
    begin
        case UpdatingFieldNo of
            FieldNo("Buy-from Vendor No."):
                exit(BuyFromVendorTxt);
        end;

        RecRef.Get(RecordId);
        FldRef := RecRef.Field(UpdatingFieldNo);
        exit(FldRef.Caption);
    end;

    local procedure GetFilterVendNo(): Code[20]
    begin
        if GetFilter("Buy-from Vendor No.") <> '' then
            if GetRangeMin("Buy-from Vendor No.") = GetRangeMax("Buy-from Vendor No.") then
                exit(GetRangeMax("Buy-from Vendor No."));
    end;

    procedure HasBuyFromAddress() Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeHasBuyFromAddress(Rec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        case true of
            "Buy-from Address" <> '':
                exit(true);
            "Buy-from Address 2" <> '':
                exit(true);
            "Buy-from City" <> '':
                exit(true);
            "Buy-from Contact" <> '':
                exit(true);
        end;

        exit(false);
    end;

    local procedure CopyBuyFromVendorAddressFieldsFromVendor(var BuyFromVendor: Record Vendor; ForceCopy: Boolean)
    begin
        if BuyFromVendorIsReplaced() or ShouldCopyAddressFromBuyFromVendor(BuyFromVendor) or ForceCopy then begin
            "Buy-from Address" := BuyFromVendor.Address;
            "Buy-from Address 2" := BuyFromVendor."Address 2";
            "Buy-from City" := BuyFromVendor.City;
            OnAfterCopyBuyFromVendorAddressFieldsFromVendor(Rec, BuyFromVendor);
        end;
    end;

    local procedure ShouldCopyAddressFromBuyFromVendor(BuyFromVendor: Record Vendor): Boolean
    begin
        exit((not HasBuyFromAddress()) and BuyFromVendor.HasAddress());
    end;

    procedure ShouldSearchForVendorByName(VendorNo: Code[20]) Result: Boolean
    var
        Vendor: Record Vendor;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeShouldSearchForVendorByName(VendorNo, Result, IsHandled);
        if IsHandled then
            exit(Result);

        if VendorNo = '' then
            exit(true);

        if not Vendor.Get(VendorNo) then
            exit(true);

        exit(not Vendor."Disable Search by Name");
    end;

    local procedure BuyFromVendorIsReplaced(): Boolean
    begin
        exit((xRec."Buy-from Vendor No." <> '') and (xRec."Buy-from Vendor No." <> "Buy-from Vendor No."));
    end;

    local procedure LookupContact(VendorNo: Code[20]; ContactNo: Code[20]; var Contact: Record Contact)
    var
        ContactBusinessRelation: Record "Contact Business Relation";
    begin
        if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Vendor, VendorNo) then
            Contact.SetRange("Company No.", ContactBusinessRelation."Contact No.")
        else
            Contact.SetRange("Company No.", '');
        if ContactNo <> '' then
            if Contact.Get(ContactNo) then;
    end;

    procedure BuyfromContactLookup(): Boolean
    var
        Contact: Record Contact;
        ContactBusinessRelation: Record "Contact Business Relation";
        IsHandled: Boolean;

    begin
        IsHandled := false;
        OnBeforeLookupBuyFromContactNo(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        if "Buy-from Vendor No." <> '' then
            if Contact.Get("Buy-from Contact No.") then
                Contact.SetRange("Company No.", Contact."Company No.")
            else
                if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Vendor, "Buy-from Vendor No.") then
                    Contact.SetRange("Company No.", ContactBusinessRelation."Contact No.")
                else
                    Contact.SetRange("No.", '');

        if "Buy-from Contact No." <> '' then
            if Contact.Get("Buy-from Contact No.") then;
        if Page.RunModal(0, Contact) = Action::LookupOK then begin
            xRec := Rec;
            CurrFieldNo := FieldNo("Buy-from Contact No.");
            Validate("Buy-from Contact No.", Contact."No.");
            exit(true);
        end;
        exit(false);
    end;

    procedure SetAllowSelectNoSeries()
    begin
        SelectNoSeriesAllowed := true;
    end;

    /*
    procedure TestStatusIsNotPendingApproval() NotPending: Boolean;
    begin
        NotPending := Status <> Status::"Pending Approval";

        OnTestStatusIsNotPendingApproval(Rec, NotPending);
    end;
    */




    procedure TestStatusIsNotReleased() NotReleased: Boolean;
    begin
        NotReleased := Status <> Status::"Pending Approval";

        OnTestStatusIsNotReleased(Rec, NotReleased);
    end;

    procedure TestStatusOpen()
    begin
        OnBeforeTestStatusOpen(Rec, xRec, CurrFieldNo);

        if StatusCheckSuspended then
            exit;

        TestField(Status, Status::Open);

        OnAfterTestStatusOpen();
    end;

    local procedure CheckBlockedVendOnDocs(Vend: Record Vendor)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckBlockedVendOnDocs(Rec, xRec, Vend, CurrFieldNo, IsHandled);
        if IsHandled then
            exit;

        Vend.CheckBlockedVendOnDocs(Vend, false);
    end;

    procedure LookupBuyFromVendorName(var VendorName: Text): Boolean
    var
        Vendor: Record Vendor;
        LookupStateManager: Codeunit "Lookup State Manager";
        RecVariant: Variant;
        SearchVendorName: Text;
    begin
        SearchVendorName := VendorName;
        if "Buy-from Vendor No." <> '' then
            Vendor.Get("Buy-from Vendor No.");

        if Vendor.SelectVendor(Vendor) then begin
            if Rec."Buy-from Vendor Name" = Vendor.Name then
                VendorName := SearchVendorName
            else
                VendorName := Vendor.Name;
            RecVariant := Vendor;
            LookupStateManager.SaveRecord(RecVariant);
            exit(true);
        end;
    end;

    local procedure CheckContactRelatedToVendorCompany(ContactNo: Code[20]; VendorNo: Code[20]; CurrFieldNo: Integer);
    var
        Contact: Record Contact;
        ContactBusinessRelation: Record "Contact Business Relation";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckContactRelatedToVendorCompany(Rec, CurrFieldNo, IsHandled);
        if IsHandled then
            exit;

        Contact.Get(ContactNo);
        if ContactBusinessRelation.FindByRelation(Enum::"Contact Business Relation Link to Table"::Vendor, VendorNo) then
            if (ContactBusinessRelation."Contact No." <> Contact."Company No.") and (ContactBusinessRelation."Contact No." <> Contact."No.") then
                Error(Text038, Contact."No.", Contact.Name, VendorNo);
    end;

    procedure UpdateBuyFromCont(VendorNo: Code[20])
    var
        ContBusRel: Record "Contact Business Relation";
        Vend: Record Vendor;
        OfficeContact: Record Contact;
        OfficeMgt: Codeunit "Office Management";
    begin
        if OfficeMgt.GetContact(OfficeContact, VendorNo) then begin
            SetHideValidationDialog(true);
            UpdateBuyFromVend(OfficeContact."No.");
            SetHideValidationDialog(false);
        end else
            if Vend.Get(VendorNo) then begin
                if Vend."Primary Contact No." <> '' then
                    "Buy-from Contact No." := Vend."Primary Contact No."
                else
                    "Buy-from Contact No." := ContBusRel.GetContactNo(ContBusRel."Link to Table"::Vendor, "Buy-from Vendor No.");
                "Buy-from Contact" := Vend.Contact;
            end;

        if "Buy-from Contact No." <> '' then
            if OfficeContact.Get("Buy-from Contact No.") then
                OfficeContact.CheckIfPrivacyBlockedGeneric();

        OnAfterUpdateBuyFromCont(Rec, Vend, OfficeContact);
    end;

    local procedure UpdateBuyFromVend(ContactNo: Code[20])
    var
        ContBusinessRelation: Record "Contact Business Relation";
        Vend: Record Vendor;
        Cont: Record Contact;
        ShouldUpdateFromContact: Boolean;
    begin
        ShouldUpdateFromContact := Cont.Get(ContactNo);
        OnUpdateBuyFromVendOnAfterGetContact(Rec, Cont, ShouldUpdateFromContact);
        if ShouldUpdateFromContact then begin
            "Buy-from Contact No." := Cont."No.";
            if Cont.Type = Cont.Type::Person then
                "Buy-from Contact" := Cont.Name
            else
                if Vend.Get("Buy-from Vendor No.") then
                    "Buy-from Contact" := Vend.Contact
                else
                    "Buy-from Contact" := ''
        end else begin
            "Buy-from Contact" := '';
            exit;
        end;

        if ContBusinessRelation.FindByContact(ContBusinessRelation."Link to Table"::Vendor, Cont."Company No.") then begin
            if ("Buy-from Vendor No." <> '') and
               ("Buy-from Vendor No." <> ContBusinessRelation."No.")
            then
                Error(Text037, Cont."No.", Cont.Name, "Buy-from Vendor No.");
            if "Buy-from Vendor No." = '' then begin
                SkipBuyFromContact := true;
                Validate("Buy-from Vendor No.", ContBusinessRelation."No.");
                SkipBuyFromContact := false;
            end;
        end else
            ContactIsNotRelatedToVendorError(Cont, ContactNo);

        OnCheckBuyFromContactOnAfterFindByContact(Rec, ContBusinessRelation, Cont);


        OnAfterUpdateBuyFromVend(Rec, Cont);
    end;

    local procedure ContactIsNotRelatedToVendorError(Cont: Record Contact; ContactNo: Code[20])
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeContactIsNotRelatedToVendorError(Cont, ContactNo, IsHandled);
        if IsHandled then
            exit;

        Error(Text039, Cont."No.", Cont.Name);
    end;

    procedure DeleteWorkflowCommentLines()
    var
        CommentLine: Record "Workflow Comment Line";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeDeleteWorkflowCommentLines(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        CommentLine.DeleteComments("Document Type".AsInteger(), "No.");
    end;

    procedure ConfirmDeletion() Result: Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeConfirmDeletion(Rec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        //TODO: oprogramowac, gdy istnieje zadanie akceptacji
        exit(true);
    end;

    procedure ConfirmCloseUnrealisted() Result: Boolean
    var
        InstructionMgt: Codeunit "Instruction Mgt.";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeConfirmCloseUnrealisted(Rec, Result, IsHandled);
        if IsHandled then
            exit(Result);
        exit(true)
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeConfirmCloseUnrealisted(var WorkflowHeader: Record "Workflow Header"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeConfirmDeletion(var WorkflowHeader: Record "Workflow Header"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeGetNoSeriesCode(WorkflowSetup: Record "Workflow Setup"; var NoSeriesCode: Code[20]; var IsHandled: Boolean; var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInitRecord(var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInitNoSeries(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckBuyFromVendor(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; Vendor: Record Vendor)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyBuyFromVendorAddressFieldsFromVendor(var WorkflowHeader: Record "Workflow Header"; BuyFromVendor: Record Vendor)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetNoSeriesCode(var WorkflowHeader: Record "Workflow Header"; WorkflowSetup: Record "Workflow Setup"; var NoSeriesCode: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetWorkflowSetup(WorkflowHeader: Record "Workflow Header"; var WorkflowSetup: Record "Workflow Setup"; CalledByFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetStatusStyleText(WorkflowHeader: Record "Workflow Header"; var StatusStyleText: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterTestNoSeries(var WorkflowHeader: Record "Workflow Header"; WorkflowSetup: Record "Workflow Setup")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var WorkflowHeader: Record "Workflow Header"; OldWorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeConfirmUpdateField(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; UpdatingFieldNo: Integer; CurrentFieldNo: Integer; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInitInsert(var WorkflowHeader: Record "Workflow Header"; var xWorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInitRecord(var WorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean; xWorkflowHeader: Record "Workflow Header"; WorkflowSetup: Record "Workflow Setup"; GLSetup: Record "General Ledger Setup"; var SkipInitialization: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeHasBuyFromAddress(var WorkflowHeader: Record "Workflow Header"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnDelete(var WorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShouldSearchForVendorByName(VendorNo: Code[20]; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestNoSeries(var WorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateBuyFromVendorNo(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; CallingFieldNo: Integer; var SkipBuyFromContact: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnRename(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusOpen(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; CallingFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusOpen()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInitInsertOnBeforeInitRecord(var WorkflowHeader: Record "Workflow Header"; var xWorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInitRecordOnAfterAssignDates(var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnTestStatusIsNotReleased(WorkflowHeader: Record "Workflow Header"; var NotReleased: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnLookupBuyfromVendorNameOnAfterSuccessfulLookup(var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckBlockedVendOnDocs(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; var Vend: Record Vendor; CurrFieldNo: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupBuyFromContactNo(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnInsert(var WorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateBuyFromVendorName(var WorkflowHeader: Record "Workflow Header"; var Vendor: Record Vendor; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckContactRelatedToVendorCompany(WorkflowHeader: Record "Workflow Header"; CurrFieldNo: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeContactIsNotRelatedToVendorError(Contact: Record Contact; ContactNo: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDeleteWorkflowCommentLines(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCheckBuyFromContactOnAfterFindByContact(var WorkflowHeader: Record "Workflow Header"; var ContBusinessRelation: Record "Contact Business Relation"; var Contact: Record Contact)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnUpdateBuyFromVendOnAfterGetContact(var WorkflowHeader: Record "Workflow Header"; var Cont: Record Contact; var ShouldUpdateFromContact: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateBuyFromCont(var WorkflowHeader: Record "Workflow Header"; Vendor: Record Vendor; Contact: Record Contact)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateBuyFromVend(var WorkflowHeader: Record "Workflow Header"; Contact: Record Contact)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyBuyFromVendorFieldsFromVendor(var WorkflowHeader: Record "Workflow Header"; Vendor: Record Vendor; xWorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateBuyFromVendorNoOnAfterUpdateBuyFromCont(var WorkflowHeader: Record "Workflow Header"; xWorkflowHeader: Record "Workflow Header"; CallingFieldNo: Integer; var SkipBuyFromContact: Boolean)
    begin
    end;

}
