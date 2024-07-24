table 50201 "Timetable Route"
{
    Caption = 'Timetable Route';
    DataCaptionFields = "Timetable Code", "Order No.";
    DrillDownPageID = "Timetable Route List";
    LookupPageID = "Timetable Route List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Timetable Code"; code[9])
        {
            Caption = 'Timetable Code';
            TableRelation = Timetable;
            Editable = false;

        }
        field(2; "Order No."; Integer)
        {
            Caption = 'Order No.';
            Editable = false;

        }
        field(3; "Pos."; Integer)
        {
            Caption = 'Pos.';
            Editable = false;
        }
        field(4; "Lp. PCS"; Integer)
        {
            Caption = 'Lp. PCS';
            Editable = false;

        }
        field(5; "Gross Weight"; Integer)
        {
            Caption = 'Gross Weight';
            Editable = false;

        }
        field(6; "Train Length"; Integer)
        {
            Caption = 'Train Length';
            Editable = false;

        }
        field(7; "Infrastructure PCS Agency No."; Integer)
        {
            Caption = 'Infrastructure PCS Agency No.';
            Editable = false;

        }
        field(8; "Exit Platform"; text[10])
        {
            Caption = 'Exit Platform';
            Editable = false;

        }
        field(9; "Exit Track"; Text[10])
        {
            Caption = 'Exit Track';
            Editable = false;

        }
        field(10; "Entrance Platform"; text[10])
        {
            Caption = 'Entrance Platform';
            Editable = false;

        }
        field(11; "Entrance Track"; Text[10])
        {
            Caption = 'Entrance Track';
            Editable = false;

        }
        field(14; "Req. Max Perc. Braking Mass"; Integer)
        {
            Caption = 'Req. Max Perc. Braking Mass';
            Editable = false;

        }
        field(15; "Object No."; Integer)
        {
            Caption = 'Object No.';
            Editable = false;

        }
        field(16; "Object Name"; Text[100])
        {
            Caption = 'Object Name';
            Editable = false;

        }
        field(17; "PCS Object No."; Integer)
        {
            Caption = 'PCS Object No.';
            Editable = false;

        }
        field(18; "Stop Time"; Integer)
        {
            Caption = 'Stop Time';
            Editable = false;

        }
        field(19; "Vehicle 1 No."; Integer)
        {
            Caption = 'Vehicle 1 No.';
            Editable = false;

        }
        field(20; "Vehicle 2 No."; Integer)
        {
            Caption = 'Vehicle 2 No.';
            Editable = false;

        }
        field(21; "Vehicle 3 No."; Integer)
        {
            Caption = 'Vehicle 3 No.';
            Editable = false;

        }
        field(22; "Train Type No."; Integer)
        {
            Caption = 'Train Type No.';
            Editable = false;

        }
        field(23; "Max Load Axle"; Integer)
        {
            Caption = 'Max Load Axle';
            Editable = false;

        }
        field(24; "Gross Train"; Integer)
        {
            Caption = 'Gross Train';
            Editable = false;

        }
        field(25; "V Max"; Integer)
        {
            Caption = 'V Max';
            Editable = false;

        }
        field(26; "Wagon Train Length"; Integer)
        {
            Caption = 'Wagon Train Length';
            Editable = false;

        }
        field(27; "Train Braking Mass"; Integer)
        {
            Caption = 'Train Braking Mass';
            Editable = false;

        }
        field(28; "Is Train Set Change"; Boolean)
        {
            Caption = 'Is Train Set Change';
            Editable = false;

        }
        field(29; "Is Technical Stop"; Boolean)
        {
            Caption = 'Is Technical Stop';
            Editable = false;

        }
        field(30; "Is Maneuvers"; Boolean)
        {
            Caption = 'Is Maneuvers';
            Editable = false;

        }
        field(31; "Is Stop For Employee"; Boolean)
        {
            Caption = 'Is Stop For Employee';
            Editable = false;

        }
        field(32; "Is Commercial Stop"; Boolean)
        {
            Caption = 'Is Commercial Stop';
            Editable = false;

        }
        field(33; "Public Service No."; Integer)
        {
            Caption = 'Public Service No.';
            Editable = false;

        }
        field(34; "PCS Brake Type No."; Integer)
        {
            Caption = 'PCS Brake Type No.';
            Editable = false;

        }
        field(35; "PCS Agency No."; Integer)
        {
            Caption = 'PCS Agency No.';
            Editable = false;

        }
        field(36; "Commercial Category Code"; Code[10])
        {
            Caption = 'Commercial Category Code';
            Editable = false;

        }
        field(37; "Bits Parameters"; Integer)
        {
            Caption = 'Bits Parameters';
            Editable = false;

        }
    }

    keys
    {
        key(Key1; "Timetable Code", "Order No.", "Pos.")
        {
            Clustered = true;
        }
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