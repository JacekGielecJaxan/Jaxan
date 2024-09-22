tableextension 50004 "Job Ext" extends "Job"
{
    fields
    {
        field(50000; "Def. Number of Wagons"; Integer)
        {
            Caption = 'Def. Number of Wagons';
        }
        field(50001; "Schedule (Vehicle Type)"; code[10])
        {
            Caption = 'Schedule (Vehicle Type)';
            TableRelation = "Vehicle Type";
            //FieldClass = FlowField;
        }
        field(50002; "Schedule (Number of Wagons)"; Integer)
        {
            Caption = 'Schedule (Number of Wagons)';
            //FieldClass = FlowField;
        }
        field(50003; "Usage (Vehicle Type)"; code[10])
        {
            Caption = 'Usage (Vehicle Type)';
            TableRelation = "Vehicle Type";
            //FieldClass = FlowField;
        }
        field(50004; "Usage (Number of Wagons)"; Integer)
        {
            Caption = 'Usage (Number of Wagons)';
            //FieldClass = FlowField;
        }
        field(50009; "Object Name From"; Text[100])
        {
            Caption = 'Object Name From';
            //FieldClass = FlowField;
        }
        field(50011; "Object Name To"; Text[100])
        {
            Caption = 'Object Name To';
            //FieldClass = FlowField;
        }
        field(50012; "Jax Ship-to Code"; code[20])
        {
            Caption = 'Ship-to Code';
            //FieldClass = FlowField;
        }
    }
}