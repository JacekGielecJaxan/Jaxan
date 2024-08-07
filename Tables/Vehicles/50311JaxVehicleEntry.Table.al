/// <summary>
/// Zapisy wagonow
/// </summary>
table 50311 "Vehicle Entry"
{
    Caption = 'Vehicle Entry';
    DrillDownPageID = "Vehicle Entries";
    LookupPageID = "Vehicle Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
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
            TableRelation = Vehicle;
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
            TableRelation = "Vehicle Status Group";
        }
        field(10; "Status Code"; code[10])
        {
            Caption = 'Status Code';
            TableRelation = "Vehicle Status";
        }
        field(11; "Train No."; code[10])
        {
            Caption = 'Train No.';

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
        key(Key2; "Vehicle No.", Date)
        {
        }
        key(Key3; Date, "Vehicle No.")
        {
        }
        key(Key4; "Vehicle No. 2", Date)
        {
        }
        key(Key5; "Code", Date)
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