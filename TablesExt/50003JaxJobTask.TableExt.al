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
        field(50002; "Contract (Vehicle Type)"; code[10])
        {
            Caption = 'Contract (Vehicle Type)';
            TableRelation = "Vehicle Type";
        }
        field(50003; "Contract (Number of Wagons)"; Integer)
        {
            Caption = 'Contract (Number of Wagons)';
        }
        field(50004; "Schedule (Vehicle Type)"; code[10])
        {
            Caption = 'Schedule (Vehicle Type)';
            TableRelation = "Vehicle Type";
        }
        field(50005; "Schedule (Number of Wagons)"; Integer)
        {
            Caption = 'Schedule (Number of Wagons)';
        }
        field(50006; "Usage (Vehicle Type)"; code[10])
        {
            Caption = 'Usage (Vehicle Type)';
            TableRelation = "Vehicle Type";
        }
        field(50007; "Usage (Number of Wagons)"; Integer)
        {
            Caption = 'Usage (Number of Wagons)';
        }
    }
}