table 50403 "Work Register Line"
{
    Caption = 'Work Register Line';
    DrillDownPageID = "Work Register Lines";
    LookupPageID = "Work Register Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
        }
        field(2; "Work Register No."; code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }

        field(4; "Source No."; code[20])
        {
            Caption = 'Source No.';

        }
        field(5; "Source Name"; Text[100])
        {
            Caption = 'Source Name';
            Editable = false;
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(7; "Start Time"; Time)
        {
            Caption = 'Start Time';
        }
        field(8; "Job No."; code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(9; "Job Task No."; code[20])
        {
            Caption = 'Job Task No.';
        }
        field(10; "Job Type Code"; code[20])
        {
            Caption = 'Job Type Code';
            TableRelation = "Job Type";
        }

        field(11; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(12; "End Time"; Time)
        {
            Caption = 'End Time';
        }
        field(13; "Task Duration"; Duration)
        {
            Caption = 'Task Duration';
        }
        field(14; Description; text[100])
        {
            Caption = 'Description';
        }
        field(15; "Train No."; code[20])
        {
            Caption = 'Train No.';
        }
        field(16; "Start Object No."; Integer)
        {
            Caption = 'Start Object No.';
        }
        field(17; "Start Object Name"; Text[100])
        {
            Caption = 'Start Object Name';
        }
        field(18; "End Object No."; Integer)
        {
            Caption = 'End Object No.';
        }
        field(19; "End Object Name"; Text[100])
        {
            Caption = 'Start Object Name';
        }
        field(20; "Timetable Code"; code[9])
        {
            Caption = 'Timetable Code';
        }
        field(21; "Train Date"; Date)
        {
            Caption = 'Train Date';
        }
        /// <summary>
        /// Nr zamowienia dla pociagu Z SKRJ
        /// </summary>
        field(23; "Order No."; Integer)
        {
            Caption = 'Order No.';
        }
        /// <summary>
        /// Zgloszenie gotowosci
        /// </summary>
        field(30; "Declaration of Readiness"; Boolean)
        {
            Caption = 'Declaration of Readiness';
        }

        field(115; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Editable = false;
        }
        field(116; "Creation Time"; Time)
        {
            Caption = 'Creation Time';
            Editable = false;
        }
        field(117; "Creation User Id"; code[50])
        {
            Caption = 'Creation User Id';
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Work Register No.", "Start Date")
        {
        }
        key(Key4; "Source No.", "Start Date")
        {
        }
    }

    trigger OnInsert()
    begin
        "Creation Date" := WorkDate();
        "Creation Time" := time;
        "Creation User Id" := UserId;

        "Entry No." := FindLastLineNo() + 1;
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
        Error('');
    end;

    trigger OnRename()
    begin
        Error('');
    end;

    procedure FindLastLineNo(): BigInteger
    var
        WorkRegister: Record "Work Register";
    begin
        IF WorkRegister.FindLast() then
            exit(WorkRegister."Entry No.")
        else
            exit(0);
    end;

}