page 50071 "Purchase Contract Card"
{
    Caption = 'Purchase Contract Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Purchase Contract Header";
    //AdditionalSearchTerms = 'Customer Profile, Client Details, Buyer Information, Customer Data, Customer View, Client Profile, Customer Detail, Client Info';

    AboutTitle = 'About contract details';
    AboutText = 'With the **Contract Card** you manage information about a contract.';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the contract.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = '';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Contract Subject"; Rec."Contract Subject")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = '';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    StyleExpr = StyleTxt;
                    ToolTip = '';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies when the wagon card was last modified.';
                    Editable = false;
                }
            }
            group("Contractor")
            {
                Caption = 'Contractor';
                group(ContractorDetails)
                {
                    Caption = 'Contractor Details';
                    field("Vendor No."; Rec."Vendor No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = '';
                    }
                    field("Vendor Name"; Rec."Vendor Name")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = '';
                    }
                    field("Vendor Name 2"; Rec."Vendor Name 2")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = '';
                    }
                    field("Vendor Address"; Rec."Vendor Address")
                    {
                        ApplicationArea = basic, suite;
                        ToolTip = '';
                    }
                    field("Vendor Address 2"; Rec."Vendor Address 2")
                    {
                        ApplicationArea = basic, suite;
                        ToolTip = '';
                    }
                    field("Vendor Post Code"; Rec."Vendor Post Code")
                    {
                        ApplicationArea = basic, suite;
                        ToolTip = '';
                    }
                    field("Vendor City"; Rec."Vendor City")
                    {
                        ApplicationArea = basic, suite;
                        ToolTip = '';
                    }
                }
            }
            group(ContractDetails)
            {
                Caption = 'Contract Details';
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic, Suite;
                    //Importance = Additional;
                    ToolTip = '';
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = All;
                    //Importance = Additional;
                    ToolTip = '';
                }
                field("External No."; Rec."External No.")
                {
                    ApplicationArea = Basic, Suite;
                    //Importance = Additional;
                    ToolTip = '';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic, Suite;
                    //Importance = Additional;
                    ToolTip = '';
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ApplicationArea = basic, suite;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = basic, suite;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = basic, suite;
                }

            }
            group(Contacts)
            {
                Caption = 'Contacts';
                group(Contact1)
                {
                    Caption = 'Dtld. Contact 1';
                    field("Contact 1"; Rec."Contact 1")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Contact Tel. 1"; Rec."Contact Tel. 1")
                    {
                        ApplicationArea = basic, suite;
                    }
                }

                group(Contact2)
                {
                    Caption = 'Dtld. Contact 2';
                    field("Contact 2"; Rec."Contact 2")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Contact Tel. 2"; Rec."Contact Tel. 2")
                    {
                        ApplicationArea = basic, suite;
                    }
                }

                group(Contact3)
                {
                    Caption = 'Dtld. Contact 3';
                    field("Contact 3"; Rec."Contact 3")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Contact Tel. 3"; Rec."Contact Tel. 3")
                    {
                        ApplicationArea = basic, suite;
                    }
                }
                group(Contact4)
                {
                    Caption = 'Dtld. Contact 4';
                    field("Contact 4"; Rec."Contact 4")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Contact Tel. 4"; Rec."Contact Tel. 4")
                    {
                        ApplicationArea = basic, suite;
                    }
                }


            }
            group(Statistics)
            {
                Caption = 'Statistics';
                Editable = false;
                Visible = FoundationOnly;

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Purchase Contract Header"),
                              "No." = field("No.");
            }
            /*
            part(ContractStatisticsFactBox; "Purch. Contract Stat. FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
            }
            */
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Contract")
            {
                Caption = '&Contract';
                Image = ContactReference;


                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
        }
        area(processing)
        {

        }
        area(reporting)
        {

        }
        area(Promoted)
        {
            group(Category_Process)
            {
Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';
            }
            group(Category_Category5)
            {
Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 4.';

            }
            group(Category_Category6)
            {
Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 5.';

            }
            group(Category_Category4)
            {
Caption = 'New Document', Comment = 'Generated from the PromotedActionCategories property index 3.';

            }
            group(Category_Category7)
            {
Caption = 'Prices & Discounts', Comment = 'Generated from the PromotedActionCategories property index 6.';
            }
            group(Category_Category9)
            {
Caption = 'Vendor', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Category8)
            {
Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 7.';
            }
            group(Category_Report)
            {
Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
    end;

    local procedure OnAfterGetCurrRecordFunc()
    var
    begin
        ActivateFields();

    end;

    trigger OnInit()
    var
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
    begin
    end;

    trigger OnOpenPage()
    begin
        OnBeforeOnOpenPage(Rec);

        if GuiAllowed() then
            OnOpenPageFunc()
        else
            OnOpenBackground();
        OnAfterOnOpenPage(Rec, xRec);
    end;

    local procedure OnOpenPageFunc()
    var
    begin
        SetNoFieldVisible();

    end;

    local procedure OnOpenBackground()
    begin
        //Rec.SetAutoCalcFields("Sales (LCY)", "Profit (LCY)", "Inv. Discounts (LCY)", "Payments (LCY)");
    end;

    local procedure StartBackgroundCalculations()
    var
    //CustomerCardCalculations: Codeunit "Customer Card Calculations";
    //Args: Dictionary of [Text, Text];
    begin
        //if Rec."No." = PrevCustNo then
        //    exit;
        //PrevCustNo := Rec."No.";
        //if (BackgroundTaskId <> 0) then
        //    CurrPage.CancelBackgroundTask(BackgroundTaskId);

        /*
        DaysPastDueDate := 0;
        ExpectedMoneyOwed := 0;
        AvgDaysToPay := 0;
        TotalMoneyOwed := 0;
        AttentionToPaidDay := false;
        AmountOnPostedInvoices := 0;
        AmountOnPostedCrMemos := 0;
        AmountOnOutstandingInvoices := 0;
        AmountOnOutstandingCrMemos := 0;
        Totals := 0;
        AdjmtCostLCY := 0;
        AdjCustProfit := 0;
        AdjProfitPct := 0;
        CustInvDiscAmountLCY := 0;
        CustPaymentsLCY := 0;
        CustSalesLCY := 0;
        CustProfit := 0;
        NoPostedInvoices := 0;
        NoPostedCrMemos := 0;
        NoOutstandingInvoices := 0;
        NoOutstandingCrMemos := 0;
        OverdueBalance := 0;
        LinkedVendorNo := '';
        BalanceAsVendor := 0;
        BalanceAsVendorEnabled := false;

        Args.Add(CustomerCardCalculations.GetCustomerNoLabel(), Rec."No.");
        Args.Add(CustomerCardCalculations.GetFiltersLabel(), Rec.GetView());
        Args.Add(CustomerCardCalculations.GetWorkDateLabel(), Format(WorkDate()));

        CurrPage.EnqueueBackgroundTask(BackgroundTaskId, Codeunit::"Customer Card Calculations", Args);

        Session.LogMessage('0000D4Q', StrSubstNo(PageBckGrndTaskStartedTxt, Rec."No."), Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', CustomerCardServiceCategoryTxt);
        */
    end;


    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
    //CustomerCardCalculations: Codeunit "Customer Card Calculations";
    //DictionaryValue: Text;
    begin
        /*
        if (TaskId = BackgroundTaskId) then begin
            if Results.Count() = 0 then
                exit;

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAvgDaysPastDueDateLabel(), DictionaryValue) then
                Evaluate(DaysPastDueDate, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetExpectedMoneyOwedLabel(), DictionaryValue) then
                Evaluate(ExpectedMoneyOwed, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAvgDaysToPayLabel(), DictionaryValue) then
                Evaluate(AvgDaysToPay, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAmountOnPostedInvoicesLabel(), DictionaryValue) then
                Evaluate(AmountOnPostedInvoices, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAmountOnPostedCrMemosLabel(), DictionaryValue) then
                Evaluate(AmountOnPostedCrMemos, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAmountOnOutstandingInvoicesLabel(), DictionaryValue) then
                Evaluate(AmountOnOutstandingInvoices, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAmountOnOutstandingCrMemosLabel(), DictionaryValue) then
                Evaluate(AmountOnOutstandingCrMemos, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetTotalsLabel(), DictionaryValue) then
                Evaluate(Totals, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAdjmtCostLCYLabel(), DictionaryValue) then
                Evaluate(AdjmtCostLCY, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAdjCustProfitLabel(), DictionaryValue) then
                Evaluate(AdjCustProfit, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetAdjProfitPctLabel(), DictionaryValue) then
                Evaluate(AdjProfitPct, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetCustInvDiscAmountLCYLabel(), DictionaryValue) then
                Evaluate(CustInvDiscAmountLCY, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetCustPaymentsLCYLabel(), DictionaryValue) then
                Evaluate(CustPaymentsLCY, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetCustSalesLCYLabel(), DictionaryValue) then
                Evaluate(CustSalesLCY, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetCustProfitLabel(), DictionaryValue) then
                Evaluate(CustProfit, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetNoPostedInvoicesLabel(), DictionaryValue) then
                Evaluate(NoPostedInvoices, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetNoPostedCrMemosLabel(), DictionaryValue) then
                Evaluate(NoPostedCrMemos, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetNoOutstandingInvoicesLabel(), DictionaryValue) then
                Evaluate(NoOutstandingInvoices, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetNoOutstandingCrMemosLabel(), DictionaryValue) then
                Evaluate(NoOutstandingCrMemos, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetOverdueBalanceLabel(), DictionaryValue) then
                Evaluate(OverdueBalance, DictionaryValue);

            if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetLinkedVendorNoLabel(), DictionaryValue) then
                LinkedVendorNo := CopyStr(DictionaryValue, 1, MaxStrLen(LinkedVendorNo));
            BalanceAsVendorEnabled := LinkedVendorNo <> '';
            if BalanceAsVendorEnabled then
                if TryGetDictionaryValueFromKey(Results, CustomerCardCalculations.GetBalanceAsVendorLabel(), DictionaryValue) then
                    Evaluate(BalanceAsVendor, DictionaryValue);

            AttentionToPaidDay := DaysPastDueDate > 0;
            TotalMoneyOwed := Rec."Balance (LCY)" + ExpectedMoneyOwed;

            Session.LogMessage('0000D4R', PageBckGrndTaskCompletedTxt, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', CustomerCardServiceCategoryTxt);
        end;
        */
    end;

    var
        StyleTxt: Text;
        NoFieldVisible: Boolean;
        BalanceExhausted: Boolean;
        FoundationOnly: Boolean;
        EnabledApprovalWorkflowsExist: Boolean;
        NewMode: Boolean;
        WorkFlowEventFilter: Text;

    protected procedure ActivateFields()
    begin
        /*
         ContactEditable := Rec."Primary Contact No." = '';
         if Rec."Country/Region Code" <> PrevCountryCode then
             IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
         PrevCountryCode := Rec."Country/Region Code";
         */
        OnAfterActivateFields(Rec);
    end;


    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.CustomerNoIsVisible();
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterActivateFields(var Contract: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterOnOpenPage(var Contract: Record "Purchase Contract Header"; xContract: Record "Purchase Contract Header")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeOnOpenPage(var Contract: Record "Purchase Contract Header")
    begin
    end;
}

