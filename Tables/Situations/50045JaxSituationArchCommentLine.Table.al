table 50045 "Situation Arch. Comment Line"
{
    Caption = ' Situation Comment Line';
    //DrillDownPageID = "Situation Arch. Comment List";
    //LookupPageID = "Situation Arch. Comment List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Situation Entry No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; Time; Time)
        {
            Caption = 'Time';
        }
        field(6; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(7; Comment; Text[200])
        {
            Caption = 'Comment';
        }
        field(8; "Object No."; Integer)
        {
            Caption = 'Object No.';
        }
        field(9; "Object Name"; Text[100])
        {
            Caption = 'Object Name';
        }
        field(10; "Track No."; Code[10])
        {
            Caption = 'Track No.';
        }
        field(11; "Vehicle Type"; enum "Vehicle Type")
        {
            Caption = 'Vehicle Type';
        }
        field(12; "Vehicle No."; code[20])
        {
            Caption = 'Vehicle No.';
        }
        field(100; "Archived Date"; date)
        {
            Caption = 'Archived Date';
        }
        field(101; "Archived Time"; Time)
        {
            Caption = 'Archived Time';
        }
    }

    keys
    {
        key(key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Situation Entry No.", "Line No.")
        {
        }
    }

    trigger OnInsert()
    begin
        "Entry No." := FindLastEntryNo() + 1;
        "Archived Date" := Today();
        "Archived Time" := Time();
    end;

    local procedure FindLastEntryNo(): Integer
    var
        sit: Record "Situation Arch. Comment Line";
    begin
        if sit.FindLast() then
            exit(sit."Entry No.");
    end;

}

