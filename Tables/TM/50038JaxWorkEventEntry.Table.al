/// <summary>
/// Zapisy zadarzen pracy
/// </summary>
table 50038 "Work Event Entry"
{
    Caption = 'Work Event Entry';
    DrillDownPageID = "Work Event Entries";
    LookupPageID = "Work Event Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Work Event Code"; code[20])
        {
            Caption = 'Work Event Code';
            TableRelation = "Work Event";

            trigger OnValidate()
            var
                WorkEvent: Record "Work Event";
            begin
                if WorkEvent.Get("Work Event Code") then begin
                    "Work Event Name" := WorkEvent.Name;
                    "Work Event Group" := WorkEvent."Work Event Group";
                end;
            end;
        }
        field(3; "Work Event Name"; Text[100])
        {
            Caption = 'Work Event Name';
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
        field(9; "Work Event Group"; code[10])
        {
            Caption = 'Work Event Group';
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
        field(103; "Sales Order No."; code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Sales Header" where("Document Type" = const("Sales Document Type"::Order));
        }
        //Miejsce zgloszenia zdarzenia
        field(104; "Notification Place"; Text[100])
        {
            Caption = 'Notification Place';
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