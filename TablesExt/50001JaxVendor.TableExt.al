tableextension 50001 "Vendor Ext" extends Vendor
{
    fields
    {
        field(50000; "Vendor Type"; code[10])
        {
            Caption = 'Vendor Type';
            TableRelation = "Vendor Type";
        }
        field(50001; "Active Contract No."; code[50])
        {
            Caption = 'Active Contract No.';
            TableRelation = "Purchase Contract Header";
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Contract Header"."No."
                where("Vendor No." = field("No."), Status = const("Contract Status"::Active)));
        }
    }

    /// <summary>
    /// Pobranie daty zakonczenia umowy
    /// </summary>
    /// <returns></returns>
    procedure GetDueDateActiveContract(): Date
    var
        purchcontract: Record "Purchase Contract Header";

    begin
        if "Active Contract No." = '' then
            EXIT;

        IF not purchcontract.Get("Active Contract No.") then
            EXIT;

        exit(purchcontract."Due Date");
    end;
}