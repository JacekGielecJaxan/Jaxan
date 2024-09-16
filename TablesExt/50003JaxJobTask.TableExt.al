tableextension 50003 "Job Task Ext" extends "Job Task"
{
    fields
    {
        // Na potrzeby modułu Planning
        field(50000; "Shuttle Start Date"; Date)
        {
            Caption = 'Shuttle Start Date';
            FieldClass = Normal;
        }
        // Na potrzeby modułu Planning
        field(50001; "Shuttle End Date"; Date)
        {
            Caption = 'Shuttle End Date';
            FieldClass = Normal;
        }
    }
}