page 50017 "Wagon Statistics FactBox"
{
    Caption = 'Wagon Statistics';
    PageType = CardPart;
    SourceTable = Wagon;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Wagon No.';
                ToolTip = 'Specifies the number of the wagon.';

                trigger OnDrillDown()
                begin
                    ShowDetails();
                end;
            }
            field("Last Review Date"; Rec."Last Review Date")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                ToolTip = '';

                trigger OnDrillDown()
                var
                    WagonReviewEntry: Record "Wagon Review Entry";
                begin
                    WagonReviewEntry.SetRange("Wagon No.", Rec."No.");
                    //TODO: Oprogramowac
                    //WagonReviewEntry.DrillDownOnEntries(DtldCustLedgEntry);
                end;
            }
            field("Next Review Date"; Rec."Next Review Date")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Next Review Date';
                Editable = false;
                ToolTip = '';

                //TODO:oprogramowac
                /*
                trigger OnDrillDown()
                var
                    WagonPlanReview: Record "Wagon Plan Review";
                begin
                    if LinkedVendorNo = '' then
                        exit;
                    WagonPlanReview.SetRange("Wagon No.", LinkedVendorNo);
                    WagonPlanReview.DrillDownOnEntries();
                end;
                */
            }
            group(Service)
            {
                Caption = 'Service';

            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    var
        WagonNo: Code[20];
        WagonNoFilter: Text;
    begin
        Rec.FilterGroup(4);
        // Get the customer number and set the current customer number
        WagonNoFilter := Rec.GetFilter("No.");
        if (WagonNoFilter = '') then begin
            Rec.FilterGroup(0);
            WagonNoFilter := Rec.GetFilter("No.");
        end;

        WagonNo := CopyStr(WagonNoFilter, 1, MaxStrLen(WagonNo));
        if WagonNo <> CurrWagonNo then begin
            CurrWagonNo := WagonNo;
            CalculateFieldValues(CurrWagonNo);
        end;
    end;

    var
        TaskIdCalculateCue: Integer;
        CurrWagonNo: Code[20];
        LinkedResourceNo: Code[20];

    procedure CalculateFieldValues(WagonNo: Code[20])
    var
        //TODO: oprogramowac
        //CalculateWagonStats: Codeunit "Calculate Wagon Stats.";
        Args: Dictionary of [Text, Text];
    begin
        if (TaskIdCalculateCue <> 0) then
            CurrPage.CancelBackgroundTask(TaskIdCalculateCue);

        //Clear(LastPaymentDate);
        //Clear(TotalAmountLCY);

        if WagonNo = '' then
            exit;

        //TODO:oprogramowac
        //Args.Add(CalculateWagonStats.GetWagonNoLabel(), WagonNo);
        //CurrPage.EnqueueBackgroundTask(TaskIdCalculateCue, Codeunit::"Calculate Wagon Stats.", Args);
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        //TODO:oprogramowac
        //CalculateWagonStats: Codeunit "Calculate Wagon Stats.";
        DictionaryValue: Text;
    begin
        if (TaskId = TaskIdCalculateCue) then begin
            if Results.Count() = 0 then
                exit;

            //if TryGetDictionaryValueFromKey(Results, CalculateCustomerStats.GetLastPaymentDateLabel(), DictionaryValue) then
            //    Evaluate(LastPaymentDate, DictionaryValue);

        end;
    end;

    [TryFunction]
    local procedure TryGetDictionaryValueFromKey(var DictionaryToLookIn: Dictionary of [Text, Text]; KeyToSearchFor: Text; var ReturnValue: Text)
    begin
        ReturnValue := DictionaryToLookIn.Get(KeyToSearchFor);
    end;

    local procedure ShowDetails()
    begin
        PAGE.Run(PAGE::"Wagon Card", Rec);
    end;
}

