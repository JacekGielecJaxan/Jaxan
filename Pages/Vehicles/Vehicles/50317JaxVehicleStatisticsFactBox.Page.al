page 50317 "Vehicle Statistics FactBox"
{
    Caption = 'Vehicle Statistics';
    PageType = CardPart;
    SourceTable = Vehicle;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Vehicle No.';
                ToolTip = 'Specifies the number of the Vehicle.';

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
                    VehicleReviewEntry: Record "Vehicle Review Entry";
                begin
                    VehicleReviewEntry.SetRange("Vehicle No.", Rec."No.");
                    //TODO: Oprogramowac
                    //VehicleReviewEntry.DrillDownOnEntries(DtldCustLedgEntry);
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
                    VehiclePlanReview: Record "Vehicle Plan Review";
                begin
                    if LinkedVendorNo = '' then
                        exit;
                    VehiclePlanReview.SetRange("Vehicle No.", LinkedVendorNo);
                    VehiclePlanReview.DrillDownOnEntries();
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
        VehicleNo: Code[20];
        VehicleNoFilter: Text;
    begin
        Rec.FilterGroup(4);
        // Get the customer number and set the current customer number
        VehicleNoFilter := Rec.GetFilter("No.");
        if (VehicleNoFilter = '') then begin
            Rec.FilterGroup(0);
            VehicleNoFilter := Rec.GetFilter("No.");
        end;

        VehicleNo := CopyStr(VehicleNoFilter, 1, MaxStrLen(VehicleNo));
        if VehicleNo <> CurrVehicleNo then begin
            CurrVehicleNo := VehicleNo;
            CalculateFieldValues(CurrVehicleNo);
        end;
    end;

    var
        TaskIdCalculateCue: Integer;
        CurrVehicleNo: Code[20];
        LinkedResourceNo: Code[20];

    procedure CalculateFieldValues(VehicleNo: Code[20])
    var
        //TODO: oprogramowac
        //CalculateVehicleStats: Codeunit "Calculate Vehicle Stats.";
        Args: Dictionary of [Text, Text];
    begin
        if (TaskIdCalculateCue <> 0) then
            CurrPage.CancelBackgroundTask(TaskIdCalculateCue);

        //Clear(LastPaymentDate);
        //Clear(TotalAmountLCY);

        if VehicleNo = '' then
            exit;

        //TODO:oprogramowac
        //Args.Add(CalculateVehicleStats.GetVehicleNoLabel(), VehicleNo);
        //CurrPage.EnqueueBackgroundTask(TaskIdCalculateCue, Codeunit::"Calculate Vehicle Stats.", Args);
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        //TODO:oprogramowac
        //CalculateVehicleStats: Codeunit "Calculate Vehicle Stats.";
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
        PAGE.Run(PAGE::"Vehicle Card", Rec);
    end;
}

