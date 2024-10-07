/// <summary>
/// Zgłoszenie gotowosci
/// </summary>
table 50040 "Readiness Declaration Entry"
{
    Caption = 'Readiness Declaration Entry';
    DrillDownPageID = "Readiness Declaration Entries";
    LookupPageID = "Readiness Declaration Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        /// <summary>
        /// Osoba do ktorej zgloszono gotowosc
        /// </summary>
        field(2; "Who Was Reported"; Text[100])
        {
            Caption = 'Who Was Reported';
        }
        /// <summary>
        /// Data zgloszenia
        /// </summary>
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        /// <summary>
        /// Godzina zgloszenia
        /// </summary>
        field(5; Time; Time)
        {
            Caption = 'Time';
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
        field(104; "Object No."; Integer)
        {
            Caption = 'Object No.';
        }
        field(105; "Object Name"; Text[100])
        {
            Caption = 'Object Name';
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
        key(Key3; Date, time)
        {
        }
        key(Key5; "Train No.")
        {
        }
        key(Key6; TimetableCode, "SEPE Order No.")
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