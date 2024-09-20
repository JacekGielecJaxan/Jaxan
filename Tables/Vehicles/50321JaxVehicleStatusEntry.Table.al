/// <summary>
/// Zapisy statusow wagonow
/// </summary>
table 50321 "Vehicle Status Entry"
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
            TableRelation = "Vehicle Status Group";
        }
        field(10; "Status Code"; code[10])
        {
            Caption = 'Status Code';
            TableRelation = "Vehicle Status";
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
        key(Key2; "Vehicle No.", Date)
        {
        }
        key(Key3; Date, "Vehicle No.")
        {
        }
        key(Key4; "Vehicle No. 2", Date)
        {
        }
        key(Key5; "Vehicle No.", "Status Code", Date)
        {
        }

    }


}