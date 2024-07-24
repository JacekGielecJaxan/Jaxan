/// <summary>
/// Zapisy zestawow kolowych
/// </summary>
table 50030 "Wheelset Entry"
{
    Caption = 'Wheelset Entry';
    DrillDownPageID = "Wheelset Entries";
    LookupPageID = "Wheelset Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
        }
        field(2; "Wheelset No."; Code[12])
        {
            Caption = 'Wagon No.';
            TableRelation = Wheelset;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; Code; code[20])
        {
            Caption = 'Code';
            //TODO: Dolozyc relację do tabeli kodow
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
        field(9; "Status Grooup Code"; Code[10])
        {
            Caption = 'Status Group Code';
            TableRelation = "Wagon Status Group";
        }
        field(10; "Status Code"; code[10])
        {
            Caption = 'Status Code';
            TableRelation = "Wagon Status";
        }
        field(11; "Train No."; code[10])
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
        field(103; "Order No."; code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Sales Header" where("Document Type" = const("Sales Document Type"::Order));
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
        key(Key5; "Code", Date)
        {
        }
        key(Key6; "Wagon No.", "Wheelset No.", Date)
        {
        }
        key(Key7; Date, "Wagon No.", "Wheelset No.")
        {
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