/// <summary>
/// Pomiary zestawow kolowych
/// </summary>
table 50035 "Wheelset Measurement Entry"
{
    Caption = 'Wheelset Measurment Entry';
    DrillDownPageID = "Wheelset Measurement Entries";
    LookupPageID = "Wheelset Measurement Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Wheelset No."; Code[12])
        {
            Caption = 'Wheelset No.';
            TableRelation = Wheelset;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; Time; Time)
        {
            Caption = 'Time';
        }
        field(6; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(7; Serie; text[50])
        {
            Caption = 'Serie';
        }
        field(8; Mileage; Decimal)
        {
            Caption = 'Mileage';
        }

        field(9; "Height (sH) (Right)"; Decimal)
        {
            Caption = 'Height (sH)  (Right)';
        }

        field(10; "Height (sH) (Left)"; Decimal)
        {
            Caption = 'Height (sH)  (Left)';
        }
        field(11; "Thickness (sD) (Left)"; Decimal)
        {
            Caption = 'Thickness (sD) (Left)';
        }
        field(12; "Thickness (sD) (Right)"; Decimal)
        {
            Caption = 'Thickness (sD) (Right)';
        }
        field(13; "Gradient (qR) (Left)"; Decimal)
        {
            Caption = 'Gradient (qR) (Left)';
        }
        field(14; "Gradient (qR) (Right)"; Decimal)
        {
            Caption = 'Gradient (qR) (Right)';
        }
        field(15; "Hollow (Hl) (Left)"; Decimal)
        {
            Caption = 'Hollow (Hl) (Left)';
        }
        field(16; "Hollow (Hl) (Right)"; Decimal)
        {
            Caption = 'Hollow (Hl) (Right)';
        }
        field(17; "Diameter (D) (Left)"; Decimal)
        {
            Caption = 'Diameter (D) (Left)';
        }
        field(18; "Diameter (D) (Right)"; Decimal)
        {
            Caption = 'Diameter (D) (Right)';
        }
        field(19; "Loss (Hl) (Left)"; Decimal)
        {
            Caption = 'Diameter (D) (Left)';
        }
        field(20; "Loss (Hl) (Right)"; Decimal)
        {
            Caption = 'Diameter (D) (Right)';
        }
        field(21; "Place"; text[100])
        {
            Caption = 'Place';
        }
        field(22; "Place On Protocole"; text[100])
        {
            Caption = 'Place On Protocole';
        }
        field(23; "Measurement Person"; Text[100])
        {
            Caption = 'Measurement Person';
        }

        field(50; "Wagon No."; Code[12])
        {
            Caption = 'Wagon No.';
            TableRelation = Wagon;
        }

        field(51; "Wagon No. 2"; Code[12])
        {
            Caption = 'Wagon No. 2';
            TableRelation = Wagon;
        }
        field(52; Position; Integer)
        {
            Caption = 'Position';
        }
        field(501; "User ID"; code[100])
        {
            Caption = 'User Id';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Wheelset No.", Date)
        {
        }
        key(Key3; Date, "Wheelset No.")
        {
        }
        key(Key4; "Wagon No.", "Wheelset No.", Date)
        {
        }
        key(Key5; Date, "Wagon No.", "Wheelset No.")
        {
        }
    }

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