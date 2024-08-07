page 50330 "Vehicle Setup"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Vehicle Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Vehicle Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            OnOpenPageOnBeforeRecInsert(Rec);
            Rec.Insert();
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnOpenPageOnBeforeRecInsert(var VehicleSetup: Record "Vehicle Setup")
    begin
    end;
}

