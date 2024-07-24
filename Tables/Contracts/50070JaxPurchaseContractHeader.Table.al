table 50070 "Purchase Contract Header"
{
    Caption = 'Purchase Contract Header';
    DataCaptionFields = "No.", "Vendor Name";
    LookupPageID = "Purchase Contract List";

    DataClassification = CustomerContent;

    fields
    {
        field(1; "Contract Type"; Code[10])
        {
            Caption = 'Contract Type';
        }
        field(2; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateVendorNo(Rec, xRec, CurrFieldNo, IsHandled);
                if IsHandled then
                    exit;

                if "No." = '' then
                    InitRecord();
                TestStatusNew();

                if ("Vendor No." <> xRec."Vendor No.") and
                   (xRec."Vendor No." <> '')
                then begin
                    if ConfirmUpdateField(FieldNo("Vendor No.")) then begin
                        if InitFromVendor("Vendor No.", FieldCaption("Vendor No.")) then
                            exit;

                    end else begin
                        Rec := xRec;
                        exit;
                    end;
                end;

                GetVend("Vendor No.");
                CheckBlockedVendOnDocs(Vend);

                IsHandled := false;
                OnAfterCheckVendor(Rec, xRec, Vend, IsHandled);

                CopyVendorDataFieldsFromVendor(Vend, false);
                CopyVendorAddressFieldsFromVendor(Vend, false);

                IsHandled := false;
                OnAfterCopyVendorFieldsFromVendor(Rec, xRec, Vend, IsHandled);

            end;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GetPurchSetup();
                    NoSeries.TestManual(GetNoSeriesCode());
                    "No. Series" := '';
                end;
            end;
        }
        field(4; "Vendor Name"; text[100])
        {
            caption = 'Vendor Name';
        }
        field(5; "Vendor Name 2"; text[100])
        {
            caption = 'Vendor Name 2';
        }
        field(19; "Document Date"; Date)
        {
            Caption = 'Document Date';

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateDocumentDate(Rec, xRec, IsHandled);
                if IsHandled then
                    exit;

            end;
        }

        field(22; "Contract Description"; Text[1000])
        {
            Caption = 'Contract Description';
        }
        field(23; "Contract Subject"; Text[100])
        {
            Caption = 'Contract Subject';
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
        field(35; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';
        }
        field(41; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;

        }
        field(46; Comment; Boolean)
        {
            CalcFormula = exist("Purch. Comment Line" where("No." = field("No."),
                                                             "Document Line No." = const(0)));
Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; Amount; Decimal)
        {
            AutoFormatExpression = Rec."Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(70; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(71; "External No."; code[50])
        {
            Caption = 'External No.';
        }
        field(81; "Vendor Address"; Text[100])
        {
            Caption = 'Vendor Address';
        }
        field(82; "Vendor Address 2"; Text[50])
        {
            Caption = 'Vendor Address 2';
        }
        field(83; "Vendor City"; Text[30])
        {
            Caption = 'Vendor City';
        }
        field(85; "Vendor Post Code"; Code[20])
        {
            Caption = 'Vendor Post Code';
        }
        field(86; "Contact 1"; Text[100])
        {
            Caption = 'Contact 1';
        }
        field(87; "Contact 2"; Text[100])
        {
            Caption = 'Contact 2';
        }
        field(88; "Contact 3"; Text[100])
        {
            Caption = 'Contact 3';
        }
        field(89; "Contact 4"; Text[100])
        {
            Caption = 'Contact 4';
        }
        field(90; "Contact Tel. 1"; Text[50])
        {
            Caption = 'Contact Tel. 1';
        }
        field(91; "Contact Tel. 2"; Text[50])
        {
            Caption = 'Contact Tel. 2';
        }
        field(92; "Contact Tel. 3"; Text[50])
        {
            Caption = 'Contact Tel. 3';
        }
        field(93; "Contact Tel. 4"; Text[50])
        {
            Caption = 'Contact Tel. 4';
        }
        field(100; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(101; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(120; Status; Enum "Contract Status")
        {
            Caption = 'Status';
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Vendor No.")
        {
        }
        key(Key3; "Document Date")
        {
        }
        key(Key4; Status, "Responsibility Center")
        {
        }
    }


    trigger OnDelete()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnDelete(Rec, IsHandled);
        if IsHandled then
            exit;
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
    begin
        Error(Text003, TableCaption);
    end;

    var
        Text003: Label 'You cannot rename a %1.';
        Text008: Label 'Confirm change?';

        Vend: Record Vendor;
        RespCenter: Record "Responsibility Center";
        GlobalNoSeries: Record "No. Series";
        NoSeries: Codeunit "No. Series";
        Confirmed: Boolean;
        Text034: Label 'You cannot change the %1 when the %2 has been filled in.';
ConfirmChangeQst: Label 'Do you want to change %1?', Comment = '%1 = a Field Caption like Currency Code';
        SelectNoSeriesAllowed: Boolean;
        PurchSetup: Record "Purchases & Payables Setup";
        ContractHeader: Record "Purchase Contract Header";
        HideValidationDialog: Boolean;
        StatusCheckSuspended: Boolean;

    procedure InitInsert()
    var
        ContractHeader2: Record "Purchase Contract Header";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInitInsert(Rec, xRec, IsHandled);
        if not IsHandled then
            if "No." = '' then begin
                TestNoSeries();
                NoSeriesCode := GetNoSeriesCode();
                NoSeriesMgt.RaiseObsoleteOnBeforeInitSeries(NoSeriesCode, xRec."No. Series", "Document Date", "No.", "No. Series", IsHandled);
                if not IsHandled then begin
                    "No. Series" := NoSeriesCode;
                    if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                        "No. Series" := xRec."No. Series";
                    "No." := NoSeries.GetNextNo("No. Series", "Document Date");
                    ContractHeader2.ReadIsolation(IsolationLevel::"ReadUncommitted");
                    ContractHeader2.SetLoadFields("No.");
                    while ContractHeader2.Get("No.") do
                        "No." := NoSeries.GetNextNo("No. Series", "Document Date");
                    NoSeriesMgt.RaiseObsoleteOnAfterInitSeries("No. Series", NoSeriesCode, "Document Date", "No.");
                end;
            end;

        OnInitInsertOnBeforeInitRecord(Rec, xRec);
        InitRecord();
    end;

    procedure InitRecord()
    var
        IsHandled, SkipInitialization : Boolean;
    begin
        GetPurchSetup();
        IsHandled := false;
        OnBeforeInitRecord(Rec, IsHandled, xRec, PurchSetup, SkipInitialization);
        if SkipInitialization then
            exit;

        if "Document Date" = 0D then
            "Document Date" := WorkDate();

        OnAfterInitRecord(Rec);
    end;

    procedure AssistEdit(OldContractHeader: Record "Purchase Contract Header"): Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, OldContractHeader, IsHandled);
        if IsHandled then
            exit;

        GetPurchSetup();
        TestNoSeries();
        if NoSeries.LookupRelatedNoSeries(GetNoSeriesCode(), OldContractHeader."No. Series", "No. Series") then begin
            "No." := NoSeries.GetNextNo("No. Series");
            exit(true);
        end;
    end;

    procedure TestNoSeries()
    var
        IsHandled: Boolean;
    begin
        GetPurchSetup();
        IsHandled := false;
        OnBeforeTestNoSeries(Rec, IsHandled);
        if not IsHandled then begin
            PurchSetup.TestField("Contract Nos.");
        end;

        OnAfterTestNoSeries(Rec, PurchSetup);
    end;

    procedure GetNoSeriesCode(): Code[20]
    var
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
    begin
        GetPurchSetup();
        IsHandled := false;
        OnBeforeGetNoSeriesCode(PurchSetup, NoSeriesCode, IsHandled, Rec);
        if IsHandled then
            exit(NoSeriesCode);

        NoSeriesCode := PurchSetup."Contract Nos.";

        OnAfterGetNoSeriesCode(Rec, PurchSetup, NoSeriesCode);

        if not SelectNoSeriesAllowed then
            exit(NoSeriesCode);

        if NoSeries.IsAutomatic(NoSeriesCode) then
            exit(NoSeriesCode);

        if NoSeries.HasRelatedSeries(NoSeriesCode) then
            if NoSeries.LookupRelatedNoSeries(NoSeriesCode, "No. Series") then
                exit("No. Series");

        exit(NoSeriesCode);
    end;

    procedure TestNoSeriesDate(No: Code[20]; NoSeriesCode: Code[20]; NoCapt: Text[1024]; NoSeriesCapt: Text[1024])
    begin
        if (No <> '') and (NoSeriesCode <> '') then begin
            GlobalNoSeries.Get(NoSeriesCode);
        end;
    end;


    local procedure GetPurchSetup()
    begin
        PurchSetup.Get();
        OnAfterGetPurchSetup(Rec, PurchSetup, CurrFieldNo);
    end;

    procedure GetVend(VendNo: Code[20])
    begin
        if VendNo <> Vend."No." then
            Vend.Get(VendNo);
    end;

    procedure GetStatusStyleText() StatusStyleText: Text
    begin
        if Status <> Status::New then
            StatusStyleText := 'Favorable'
        else
            StatusStyleText := 'Strong';

        OnAfterGetStatusStyleText(Rec, StatusStyleText);
    end;

    local procedure InitFromVendor(VendorNo: Code[20]; VendorCaption: Text): Boolean
    begin
        Init();
        "No. Series" := xRec."No. Series";
        OnInitFromVendorOnBeforeInitRecord(Rec, xRec);
        InitRecord();
        exit(true);
    end;

    local procedure InitFromContact(ContactNo: Code[20]; VendorNo: Code[20]; ContactCaption: Text): Boolean
    begin
        Init();
        GetPurchSetup();
        "No. Series" := xRec."No. Series";
        OnInitFromContactOnBeforeInitRecord(Rec, xRec);
        InitRecord();
        exit(true);
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

    procedure GetHideValidationDialog(): Boolean
    begin
        exit(HideValidationDialog);
    end;

    procedure SetHideValidationDialog(NewHideValidationDialog: Boolean)
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;

    [IntegrationEvent(true, false)]
    procedure OnCheckPurchasePostRestrictions()
    begin
    end;

    procedure CheckPurchasePostRestrictions()
    begin
        OnCheckPurchasePostRestrictions();
    end;

    [IntegrationEvent(true, false)]
    local procedure OnCheckPurchaseReleaseRestrictions()
    begin
    end;

    procedure SetStatus(NewStatus: Option)
    begin
        Status := Enum::"Purchase Document Status".FromInteger(NewStatus);
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
        RecRef.Get(RecordId);
        FldRef := RecRef.Field(UpdatingFieldNo);
        exit(FldRef.Caption);
    end;

    local procedure CopyVendorDataFieldsFromVendor(var FromVendor: Record Vendor; ForceCopy: Boolean)
    begin
        "Vendor Name" := Vend.Name;
        "Vendor Name 2" := Vend."Name 2";
        "Currency Code" := Vend."Currency Code";
        OnAfterCopyVendorDataFieldsFromVendor(Rec, FromVendor);
    end;

    local procedure CopyVendorAddressFieldsFromVendor(var FromVendor: Record Vendor; ForceCopy: Boolean)
    begin
        "Vendor Address" := FromVendor.Address;
        "Vendor Address 2" := FromVendor."Address 2";
        "Vendor City" := FromVendor.City;
        "Vendor Post Code" := FromVendor."Post Code";
        OnAfterCopyVendorAddressFieldsFromVendor(Rec, FromVendor);
    end;

    procedure SetAllowSelectNoSeries()
    begin
        SelectNoSeriesAllowed := true;
    end;

    procedure TestStatusIsNotActive() NotActive: Boolean;
    begin
        NotActive := Status <> Status::Active;

        OnTestStatusIsNotActive(Rec, NotActive);
    end;

    procedure TestStatusActive()
    begin
        OnBeforeTestStatusActive(Rec, xRec, CurrFieldNo);

        if StatusCheckSuspended then
            exit;

        TestField(Status, Status::Active);

        OnAfterTestStatusActive();
    end;

    procedure TestStatusNew()
    begin
        OnBeforeTestStatusNew(Rec, xRec, CurrFieldNo);

        if StatusCheckSuspended then
            exit;

        TestField(Status, Status::New);

        OnAfterTestStatusNew();
    end;

    procedure SuspendStatusCheck(Suspend: Boolean)
    begin
        StatusCheckSuspended := Suspend;
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

    procedure GetUseDate(): Date
    begin
        if "Document Date" = 0D then
            exit(WorkDate());

        exit("Document Date");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterHasDifferentBuyFromAddress(var ContractHeader: Record "Purchase Contract Header"; Vendor: Record Vendor; var Result: Boolean)
    begin
    end;




    [IntegrationEvent(true, false)]
    local procedure OnBeforeGetNoSeriesCode(PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20]; var IsHandled: Boolean; var ContractHeader: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInitRecord(var ContractHeader: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInitNoSeries(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyBuyFromVendorFieldsFromVendor(var ContractHeader: Record "Purchase Contract Header"; Vendor: Record Vendor; xContractHeader: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetNoSeriesCode(var ContractHeader: Record "Purchase Contract Header"; PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetPurchSetup(ContractHeader: Record "Purchase Contract Header"; var PurchasesPayablesSetup: Record "Purchases & Payables Setup"; CalledByFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetStatusStyleText(ContractHeader: Record "Purchase Contract Header"; var StatusStyleText: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterTestNoSeries(var ContractHeader: Record "Purchase Contract Header"; PurchSetup: Record "Purchases & Payables Setup")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterTransferSavedFields(var DestinationPurchaseLine: Record "Purchase Line"; SourcePurchaseLine: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateFromVend(var ContractHeader: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateCurrencyFactor(var ContractHeader: Record "Purchase Contract Header"; HideValidationDialog: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var ContractHeader: Record "Purchase Contract Header"; OldContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInitInsert(var ContractHeader: Record "Purchase Contract Header"; var xContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInitRecord(var ContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean; xContractHeader: Record "Purchase Contract Header"; PurchSetup: Record "Purchases & Payables Setup"; var SkipInitialization: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnDelete(var ContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestNoSeries(var ContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusActive(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; CallingFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusActive()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusNew(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; CallingFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusNew()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInitInsertOnBeforeInitRecord(var ContractHeader: Record "Purchase Contract Header"; var xContractHeader: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnTestStatusIsNotActive(ContractHeader: Record "Purchase Contract Header"; var NotReleased: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckBlockedVendOnDocs(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; var Vend: Record Vendor; CurrFieldNo: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDeleteContractCommentLines(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeStoreContractCommentLineToTemp(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnInsert(var ContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateVendorNo(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; CurrFieldNo: Integer; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateDocumentDate(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInitFromVendorOnBeforeInitRecord(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckVendor(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; var Vend: Record Vendor; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyVendorFieldsFromVendor(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; var Vend: Record Vendor; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyVendorDataFieldsFromVendor(var ContractHeader: Record "Purchase Contract Header"; Vend: Record Vendor)
    begin

    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyVendorAddressFieldsFromVendor(var ContractHeader: Record "Purchase Contract Header"; Vend: Record Vendor)
    begin

    end;

    [IntegrationEvent(false, false)]
    local procedure OnInitFromContactOnBeforeInitRecord(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header")
    begin

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeConfirmUpdateField(var ContractHeader: Record "Purchase Contract Header"; xContractHeader: Record "Purchase Contract Header"; UpdatingFieldNo: Integer; CurrentFieldNo: Integer; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;
}

