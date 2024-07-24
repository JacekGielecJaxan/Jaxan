/// <summary>
/// Zarejestrowane km zestawow kolowych
/// </summary>
table 50033 "Wheelset Km Entry"
{
    Caption = 'Wheelset Km Entry';
    DrillDownPageID = "Wheelset Km Entries";
    LookupPageID = "Wheelset Km Entries";
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
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';

        }
        field(6; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(7; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = "Job";
        }
        field(8; "Job Task No."; code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task";
        }
        field(12; "Train No."; code[10])
        {
            Caption = 'Train No.';

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
        field(100; TimetableCode; code[9])
        {
            Caption = 'Timetable Code';
            TableRelation = Timetable;
        }
        field(101; "SKRJ Order No"; Integer)
        {
            Caption = 'SKRJ Order No.';
        }
        field(102; "SEPE Order No."; Integer)
        {
            Caption = 'SEPE Order No.';
        }
        field(103; "Sales Order No."; code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Sales Header" where("Document Type" = const("Sales Document Type"::Order));
        }
        field(104; "Station From Pos."; Integer)
        {
            Caption = 'Station From Pos.';
        }
        field(105; "Station From No."; Integer)
        {
            Caption = 'Station From No.';
            TableRelation = "SKRJ Object";
        }
        field(106; "Station From Name"; text[100])
        {
            Caption = 'Station From Name';
        }
        field(107; "Station To Pos."; Integer)
        {
            Caption = 'Station To Pos.';
        }
        field(108; "Station To No."; Integer)
        {
            Caption = 'Station To No.';
            TableRelation = "SKRJ Object";
        }
        field(109; "Station To Name"; text[100])
        {
            Caption = 'Station To Name';
        }
        field(500; "Transaction No."; BigInteger)
        {
            Caption = 'Transaction No.';
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
        key(Key5; "Train No.")
        {
        }
        key(Key6; TimetableCode, "SEPE Order No.")
        {
        }
        key(Key7; "Wagon No.", "Wheelset No.", Date)
        {
        }
        key(Key8; Date, "Wagon No.", "Wheelset No.")
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