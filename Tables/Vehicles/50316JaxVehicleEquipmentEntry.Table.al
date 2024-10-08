/// <summary>
/// Wyposazenie pojazdu
/// </summary>
table 50316 "Vehicle Equipment Entry"
{
    Caption = 'Vehicle Equipment Entry';
    DrillDownPageID = "Vehicle Equipment Entries";
    LookupPageID = "Vehicle Equipment Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Vehicle No."; Code[12])
        {
            Caption = 'Vehicle No.';
            TableRelation = Vehicle;
        }

        field(3; "Vehicle No. 2"; Code[12])
        {
            Caption = 'Vehicle No. 2';
        }
        /// <summary>
        /// Data przyjecia na stan pracownika
        /// </summary>
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
        field(7; "Equipment Code"; code[20])
        {
            Caption = 'Equipment Code';
        }
        field(8; "Equipment Name"; text[100])
        {
            Caption = 'Equipment Name';
        }
        field(9; "Employee No."; Code[50])
        {
            Caption = 'Employee No.';
            TableRelation = Resource where(Type = const(Person));
        }
        field(10; "Employee Name"; text[100])
        {
            Caption = 'Employee Name';
        }
        field(11; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(12; "Return Date"; Date)
        {
            Caption = 'Return Date';
            trigger OnValidate()
            begin
                Open := "Return Date" <> 0D;
            end;
        }
        field(13; "Return Time"; Time)
        {
            Caption = 'Return Time';

        }
        field(14; "Serie No."; text[50])
        {
            Caption = 'Series No.';
        }
        field(15; "Expiration Date"; date)
        {
            Caption = 'Expiration Date';

        }
        field(16; Open; Boolean)
        {
            Caption = 'Open';
        }
        field(17; "Review Date"; Date)
        {
            Caption = 'Review Date';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Vehicle No.", Date)
        {
        }
        key(Key3; Date, "Vehicle No.")
        {
        }
        key(Key4; "Vehicle No. 2", Date)
        {
        }

    }

    trigger OnInsert()
    begin
        Open := true;
        "Entry No." := GetLastEntryNo() + 1;
    end;

    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;

}