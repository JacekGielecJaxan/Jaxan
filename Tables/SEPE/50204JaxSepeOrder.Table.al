/// <summary>
/// Zamowienia SEPE
/// </summary>
table 50204 "Sepe Order"
{
    Caption = 'Sepe Order';
    DataCaptionFields = "Train Date", "Train No.";
    DrillDownPageID = "Sepe Order List";
    LookupPageID = "Sepe Order List";
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
        field(4; "Train No."; Text[10])
        {
            Caption = 'Train No.';
            Editable = false;
        }
        field(5; "Train Name"; Text[100])
        {
            Caption = 'Train Name';
            Editable = false;
        }
        field(6; "Int. Train No."; Text[10])
        {
            Caption = 'Int. Train No.';
            Editable = false;
        }
        //Data pociagu
        field(7; "Train Date"; Date)
        {
            Caption = 'Train Date';
            Editable = false;
        }
        field(8; "Oryginal Date"; DateTime)
        {
            Caption = 'Oryginal Date';
            Editable = false;
        }
        //Data wyjazdu
        field(9; "Departure Date"; DateTime)
        {
            Caption = 'Departure Date';
        }
        field(10; "Application No."; code[50])
        {
            Caption = 'Application No.';
            Editable = false;
        }
        field(11; "Application Date"; DateTime)
        {
            Caption = 'Application Date';
            Editable = false;
        }
        field(12; "Order No."; Integer)
        {
            Caption = 'Order No.';
            Editable = false;
        }
        field(13; "Carrier No."; Integer)
        {
            Caption = 'Carrier No.';
            Editable = false;
        }
        field(14; "Timetable Type No."; Integer)
        {
            Caption = 'Timetable Type No.';
            Editable = false;
        }
        field(15; Planned; Boolean)
        {
            Caption = 'Planned';
            Editable = false;
        }
        field(16; "Running"; Boolean)
        {
            Caption = 'Running';
            Editable = false;
        }
        field(17; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = false;
        }
        field(18; Resignation; Boolean)
        {
            Caption = 'Resignation';
            Editable = false;
        }
        field(19; "Resignation Date"; DateTime)
        {
            Caption = 'Resignation Date';
            Editable = false;
        }
        field(20; "Start Object No."; Integer)
        {
            Caption = 'Start Object No.';
            Editable = false;
        }
        field(21; "Start Object Name"; Text[100])
        {
            Caption = 'Start Object Name';
            Editable = false;
        }
        field(22; "End Object No."; Integer)
        {
            Caption = 'End Object No.';
            Editable = false;
        }
        field(23; "End Object Name"; Text[100])
        {
            Caption = 'End Object Name';
            Editable = false;
        }
        field(24; "Train Type No."; Integer)
        {
            Caption = 'Train Type No.';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Train Date") { }
        key(Key3; "Train No.", "Train Date") { }
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