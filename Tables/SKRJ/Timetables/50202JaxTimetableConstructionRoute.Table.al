table 50202 "Timetable Construction Route"
{
    Caption = 'Timetable Construciton Route';
    DataCaptionFields = "Timetable Code", "Order No.";
    DrillDownPageID = "Timetable Construc. Route List";
    LookupPageID = "Timetable Construc. Route List";
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
        field(4; "Preliminary Route Pos."; Integer)
        {
            Caption = 'Preliminary Route Pos.';
            Editable = false;

        }
        field(5; "Object No."; Integer)
        {
            Caption = 'Object No.';
            Editable = false;

        }
        field(6; "Object Name"; Text[100])
        {
            Caption = 'Object Name';
            Editable = false;

        }
        field(7; "Driving Time"; Integer)
        {
            Caption = 'Driving Time';
            Editable = false;

        }
        field(8; "Cumulative Way"; Integer)
        {
            Caption = 'Cumulative Way';
            Editable = false;

        }
        field(9; "Train No."; Text[10])
        {
            Caption = 'Train No.';
            Editable = false;

        }
        field(10; "Arrival Time"; Time)
        {
            Caption = 'Arrival Time';
            Editable = false;

        }
        field(11; "Arrival Offset"; Integer)
        {
            Caption = 'Arrival Offset';
            Editable = false;

        }
        field(12; "Departure Time"; Time)
        {
            Caption = 'Departure Time';
            Editable = false;

        }
        field(13; "Departure Offset"; Integer)
        {
            Caption = 'Departure Offset';
            Editable = false;

        }
        field(14; "Rail Line No."; Integer)
        {
            Caption = 'Rail Line No.';
            Editable = false;

        }
        field(15; "Axle Meter"; Integer)
        {
            Caption = 'Axle Meter';
            Editable = false;

        }
        field(16; "Next Axle Meter"; Integer)
        {
            Caption = 'Next Axle Meter';
            Editable = false;

        }
        field(17; "Stop Time"; Decimal)
        {
            Caption = 'Stop Time';
            Editable = false;

        }
        field(18; "Is Technical Stop"; Boolean)
        {
            Caption = 'Is Technical Stop';
            Editable = false;

        }
        field(19; "Is Train Front Change"; Boolean)
        {
            Caption = 'Is Train Front Change';
            Editable = false;

        }
        field(20; "Preliminary Route Object"; Boolean)
        {
            Caption = 'Preliminary Route Object';
            Editable = false;

        }
        field(22; "Approved"; Integer)
        {
            Caption = 'Approved';
            Editable = false;

        }
        field(23; "Lp. PCS"; Integer)
        {
            Caption = 'Lp. PCS';
            Editable = false;

        }
        field(24; "Gross Weight"; Integer)
        {
            Caption = 'Gross Weight';
            Editable = false;

        }
        field(25; "Train Length"; Integer)
        {
            Caption = 'Train Length';
            Editable = false;

        }
        field(26; "Infrastructure PCS Agency No."; Integer)
        {
            Caption = 'Infrastructure PCS Agency No.';
            Editable = false;

        }
        field(27; "Exit Platform"; text[10])
        {
            Caption = 'Exit Platform';
            Editable = false;

        }
        field(28; "Exit Track"; Text[10])
        {
            Caption = 'Exit Track';
            Editable = false;

        }
        field(29; "Entrance Platform"; text[10])
        {
            Caption = 'Entrance Platform';
            Editable = false;

        }
        field(30; "Entrance Track"; Text[10])
        {
            Caption = 'Entrance Track';
            Editable = false;

        }
        field(33; "Req. Max Perc. Braking Mass"; Integer)
        {
            Caption = 'Req. Max Perc. Braking Mass';
            Editable = false;

        }
        field(34; "PCS Object No."; Integer)
        {
            Caption = 'PCS Object No.';
            Editable = false;

        }
        field(35; "Vehicle 1 No."; Integer)
        {
            Caption = 'Vehicle 1 No.';
            Editable = false;

        }
        field(36; "Vehicle 1 Code"; Text[10])
        {
            Caption = 'Vehicle 1 Code';
            Editable = false;

        }
        field(37; "Vehicle 2 No."; Integer)
        {
            Caption = 'Vehicle 2 No.';
            Editable = false;

        }
        field(38; "Vehicle 2 Code"; Text[10])
        {
            Caption = 'Vehicle 2 Code';
            Editable = false;

        }
        field(39; "Vehicle 3 No."; Integer)
        {
            Caption = 'Vehicle 3 No.';
            Editable = false;

        }
        field(40; "Vehicle 3 Code"; Text[10])
        {
            Caption = 'Vehicle 3 Code';
            Editable = false;

        }
        field(41; "Train Type No."; Integer)
        {
            Caption = 'Train Type No.';
            Editable = false;

        }
        field(42; "Train Type Code"; Text[10])
        {
            Caption = 'Train Type Code';
            Editable = false;

        }
        field(43; "Max. Load Axle"; Decimal)
        {
            Caption = 'Max. Load Axle';
            Editable = false;

        }
        field(44; "Gross Train"; Integer)
        {
            Caption = 'Gross Train';
            Editable = false;

        }
        field(45; "V. Max."; Integer)
        {
            Caption = 'V. Max.';
            Editable = false;

        }
        field(46; "Wagon Train Length"; Integer)
        {
            Caption = 'Wagon Train Length';
            Editable = false;

        }
        field(47; "Train Braking Mass"; Integer)
        {
            Caption = 'Train Braking Mass';
            Editable = false;

        }
        field(48; "Is Train Set Change"; Boolean)
        {
            Caption = 'Is Train Set Change';
            Editable = false;

        }
        field(49; "Is Maneuvers"; Boolean)
        {
            Caption = 'Is Maneuvers';
            Editable = false;

        }
        field(50; "Is Stop For Employee"; Boolean)
        {
            Caption = 'Is Stop For Employee';
            Editable = false;

        }
        field(51; "Is Commercial Stop"; Boolean)
        {
            Caption = 'Is Commercial Stop';
            Editable = false;

        }
        field(52; "Public Service No."; Integer)
        {
            Caption = 'Public Service No.';
            Editable = false;

        }
        field(53; "PCS Brake Type No."; Integer)
        {
            Caption = 'PCS Brake Type No.';
            Editable = false;

        }
        field(54; "PCS Agency No."; Integer)
        {
            Caption = 'PCS Agency No.';
            Editable = false;

        }
        field(55; "Commercial Category Code"; Text[10])
        {
            Caption = 'Commercial Category Code';
            Editable = false;

        }
        field(56; "Bits Parameters"; Integer)
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