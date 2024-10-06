/// <summary>
/// Wykaz
/// </summary>
table 50402 "Work Register"
{
    Caption = 'Work Register';
    DrillDownPageID = "Work Register Entries";
    LookupPageID = "Work Register Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
        }
        field(2; "Document No."; code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }

        field(4; "Source No."; code[20])
        {
            Caption = 'Source No.';

            trigger OnValidate()
            begin
                TestField("Document Date");

                Test();
                CheckDuplicate();

                if "Document No." = '' then
                    SetWorkRegisterDocumentNo();
            end;
        }
        field(5; "Source Name"; Text[100])
        {
            Caption = 'Source Name';
            Editable = false;
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';

            trigger OnValidate()
            begin
                SetEndTime();
            end;
        }
        field(7; "Start Time"; Time)
        {
            Caption = 'Start Time';

            trigger OnValidate()
            begin
                SetEndTime();
            end;
        }
        field(8; "Planned End Date"; Date)
        {
            Caption = 'Planned End Date';
            Editable = false;
        }
        field(9; "Planned End Time"; Time)
        {
            Caption = 'Planned End Time';
            Editable = false;
        }
        /// <summary>
        /// Czas zaplanowany
        /// </summary>
        field(10; "Planned Time"; Duration)
        {
            Caption = 'Planned Time';
            Editable = false;
        }
        field(11; "Last Date"; Date)
        {
            Caption = 'Last Date';
        }
        field(12; "Last Time"; Time)
        {
            Caption = 'Last Time';
        }
        field(13; "Remaining Time"; Duration)
        {
            Caption = 'Remaining Time';
        }
        field(14; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Editable = false;
        }
        field(15; "Creation Time"; Time)
        {
            Caption = 'Creation Time';
            Editable = false;
        }
        field(16; "Creation User Id"; code[50])
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
        key(Key2; "Document No.")
        {
        }
        key(Key3; "Document Date")
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

    local procedure GetSetup()
    begin
        JobSetup.GetRecordOnce();
    end;

    local procedure SetWorkRegisterDocumentNo()
    var
        JNoSeries: Codeunit "Jax NoSeriesManagement";
        NoSeries: Codeunit "No. Series";
    begin
        TestField("Document Date");

        GetSetup();
        JobSetup.TestField("Work Register Nos.");
        JobSetup.TestField("Work Register Prefix");

        JNoSeries.CheckWorkRegisterSerie(JobSetup."Work Register Nos.", JobSetup."Work Register Prefix", "Document Date");

        "Document No." := NoSeries.GetNextNo(JobSetup."Work Register Nos.", "Document Date");
    end;

    local procedure SetEndTime()
    var
        datetime: DateTime;
    begin
        GetSetup();
        JobSetup.TestField("Default Work Time");

        Test();

        datetime := CreateDateTime("Start Date", "Start Time");
        datetime := datetime + JobSetup."Default Work Time";

        "Planned Time" := JobSetup."Default Work Time";

        "Planned End Date" := DT2Date(datetime);
        "Planned End Time" := DT2Time(datetime)
    end;

    local procedure Test()
    begin
        //Error('Procedure Test not implemented.');
    end;

    local procedure CheckDuplicate()
    var
        WorkRegister2: Record "Work Register";
    begin
        WorkRegister2.SetRange("Document Date", "Document Date");
        WorkRegister2.SetRange("Source No.", "Source No.");

        if WorkRegister2.FindSet() then
            Error(Err02, "Source No.", "Document Date", WorkRegister2."Document No.");

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


    var
        Err02: Label 'There is already work register for %1 on %2 with number %3';

        JobSetup: Record "Job Setup";
}