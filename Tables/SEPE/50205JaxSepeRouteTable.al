table 50205 "Sepe Route"
{
    DataCaptionFields = "Train No.", Pos, "Object Name";
    DrillDownPageID = "Sepe Route List";
    LookupPageID = "Sepe Route List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
            Editable = false;
        }
        field(2; "Timetable Code"; code[9])
        {
            Caption = 'Timetable Code';
            TableRelation = Timetable;
            Editable = false;

        }
        field(3; "SEPE Entry No."; BigInteger)
        {
            Caption = 'SEPE Entry No.';
            Editable = false;
        }
        field(4; Pos; integer)
        {
            Caption = 'Pos.';
            Editable = false;
        }
        field(5; "Train No."; Text[10])
        {
            Caption = 'Train No.';
            Editable = false;
        }
        field(6; "Object No."; Integer)
        {
            Caption = 'Object No.';
            Editable = false;
        }
        field(7; "Object Name"; Text[100])
        {
            Caption = 'Object Name';
            Editable = false;
        }
        field(8; "Departure Plan"; Time)
        {
            Caption = 'Departure Plan';
            Editable = false;
        }
        field(9; "Departure Actual"; Time)
        {
            Caption = 'Departure Actual';
            Editable = false;
        }
        field(10; "Arrival Plan"; time)
        {
            Caption = 'Arrival Plan';
            Editable = false;
        }
        field(11; "Arrival Actual"; Time)
        {
            Caption = 'Arrival Actual';
            Editable = false;
        }
        field(12; Approval; Boolean)
        {
            Caption = 'Approval';
            Editable = false;
        }
        field(13; Stop; Boolean)
        {
            Caption = 'Stop';
            Editable = false;
        }
        field(14; Km; Integer)
        {
            Caption = 'Km';
            Editable = false;
        }
        field(15; "Order No."; Integer)
        {
            Caption = 'Order No.';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "SEPE Entry No.") { }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}