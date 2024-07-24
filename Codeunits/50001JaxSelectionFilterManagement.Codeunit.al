codeunit 50001 "Selection Filter Mgt Jax"
{
    trigger OnRun()
    begin

    end;

    procedure GetSelectionFilterForWagon(var Wagon: Record Wagon): Text
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Wagon);
        exit(SFM.GetSelectionFilter(RecRef, Wagon.FieldNo("No.")));
    end;

    procedure GetSelectionFilterForWheelset(var Wheelset: Record Wheelset): Text
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Wheelset);
        exit(SFM.GetSelectionFilter(RecRef, Wheelset.FieldNo("No.")));
    end;

    //TODO:Odblokowac po zrobieniu kartoteki pojazdu
    /*
    procedure GetSelectionFilterForVehicle(var Vehicle: Record Vehicle): Text
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Vehicle);
        exit(SFM.GetSelectionFilter(RecRef, Vehicle.FieldNo("No.")));
    end;
    */

    procedure GetSelectionFilterForContract(var Contract: Record "Purchase Contract Header"): Text
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Contract);
        exit(SFM.GetSelectionFilter(RecRef, Contract.FieldNo("No.")));
    end;


    var
        SFM: Codeunit SelectionFilterManagement;
}