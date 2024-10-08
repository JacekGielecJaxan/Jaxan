/// <summary>
/// Zapisy statusow wagonow
/// </summary>
table 50021 "Wagon Status Entry"
{
    Caption = 'Wagon Status Entry';
    DrillDownPageID = "Wagon Status Entries";
    LookupPageID = "Wagon Status Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Wagon No."; Code[12])
        {
            Caption = 'Wagon No.';
            TableRelation = Wagon;
        }

        field(3; "Wagon No. 2"; Code[12])
        {
            Caption = 'Wagon No. 2';
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
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
        field(11; "Status TM Code"; code[10])
        {
            Caption = 'Status TM Code';
            TableRelation = "Wagon Status Group TM";
        }
        field(12; "Train No."; code[10])
        {
            Caption = 'Train No.';

        }
        field(500; "Transaction No."; BigInteger)
        {
            Caption = 'Transaction No.';
        }
        field(501; "User ID"; code[100])
        {
            Caption = 'User Id';
        }
        field(505; Latitude; Integer)
        {
            Caption = 'Latitude';
        }
        field(506; Longitude; Integer)
        {
            Caption = 'Longitude';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Wagon No.", Date)
        {
        }
        key(Key3; Date, "Wagon No.")
        {
        }
        key(Key4; "Wagon No. 2", Date)
        {
        }
        key(Key5; "Wagon No.", "Status Code", Date)
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
        "Entry No." := GetLastEntryNo() + 1;

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

    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;
}