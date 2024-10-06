tableextension 50003 "Job Task Ext" extends "Job Task"
{
    fields
    {

        // Na potrzeby modułu Planning
        field(50000; "Shuttle Start Date"; Date)
        {
            Caption = 'Shuttle Start Date';
            FieldClass = Normal;

            trigger OnValidate()
            var
                dt: DateTime;
            begin
                JobsSetup.Get();

                "Shuttle End Date" := "Shuttle Start Date";

                if format(JobsSetup."Def. No. Days For Shuttle") <> '' then
                    "Shuttle End Date" := CalcDate(JobsSetup."Def. No. Days For Shuttle", "Shuttle Start Date");

                if JobsSetup."Default Start Hour" <> 0T then
                    "Shuttle Start Time" := JobsSetup."Default Start Hour";

                dt := CreateDateTime("Shuttle Start Date", "Shuttle Start Time") - 1;
                "Shuttle End Time" := DT2Time(dt);
            end;
        }
        // Na potrzeby modułu Planning
        field(50001; "Shuttle End Date"; Date)
        {
            Caption = 'Shuttle End Date';
            FieldClass = Normal;
        }
        field(50002; "Contract (Vehicle Type)"; code[10])
        {
            Caption = 'Contract (Vehicle Type)';
            TableRelation = "Vehicle Type";
        }
        field(50003; "Contract (Number of Wagons)"; Integer)
        {
            Caption = 'Contract (Number of Wagons)';
        }
        field(50004; "Schedule (Vehicle Type)"; code[10])
        {
            Caption = 'Schedule (Vehicle Type)';
            TableRelation = "Vehicle Type";
        }
        field(50005; "Schedule (Number of Wagons)"; Integer)
        {
            Caption = 'Schedule (Number of Wagons)';
        }
        field(50006; "Usage (Vehicle Type)"; code[10])
        {
            Caption = 'Usage (Vehicle Type)';
            TableRelation = "Vehicle Type";
        }
        field(50007; "Usage (Number of Wagons)"; Integer)
        {
            Caption = 'Usage (Number of Wagons)';
        }
        field(50008; "Object No. From"; Integer)
        {
            Caption = 'Object No. From';
        }
        field(50009; "Object Name From"; Text[100])
        {
            Caption = 'Object Name From';
        }
        field(50010; "Object No. To"; Integer)
        {
            Caption = 'Object No. To';
        }
        field(50011; "Object Name To"; Text[100])
        {
            Caption = 'Object Name To';
        }
        field(50012; "No. Series"; code[10])
        {
            Caption = 'No. Series';
        }
        field(50013; "Shuttle Start Time"; time)
        {
            Caption = 'Shuttle Start Time';
            FieldClass = Normal;

            trigger OnValidate()
            var
                dt: DateTime;
            begin
                dt := CreateDateTime("Shuttle Start Date", "Shuttle Start Time");
                "Shuttle End Time" := DT2Time(dt);
            end;
        }
        // Na potrzeby modułu Planning
        field(50014; "Shuttle End Time"; Time)
        {
            Caption = 'Shuttle End Time';
            FieldClass = Normal;
        }
        field(50015; Status; enum "Job Task Status")
        {
            Caption = 'Status';
        }
        field(50016; "Mine Code"; code[20])
        {
            Caption = 'Mine Code';
            TableRelation = Mine;
        }

    }


    procedure InitJobTaskNo()
    var
        Job2: Record Job;
        JobTask2: Record "Job Task";
        IsHandled: Boolean;
        JobsSetup: Record "Jobs Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Codeunit "No. Series";
        dt: DateTime;
    begin
        IsHandled := false;
        OnBeforeInitJobTaskNo(Rec, xRec, IsHandled);
        if IsHandled then
            exit;
        JobsSetup.Get();
        Job2.Get("Job No.");
        if "job task No." = '' then begin
            JobsSetup.TestField("Job Task Serie No. Suffix");
            "No. Series" := "Job No." + JobsSetup."Job Task Serie No. Suffix";

            OnInitJobTaskNoOnCheckSeries("Job No.", job2.Description, JobsSetup."Job Task Serie No. Suffix", IsHandled);
            if IsHandled then
                exit;
#if not CLEAN24
            NoSeriesMgt.RaiseObsoleteOnBeforeInitSeries("No. Series", xRec."No. Series", 0D, "job task No.", "No. Series", IsHandled);
            if not IsHandled then begin
#endif
                if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "Job Task No." := NoSeries.GetNextNo("No. Series");
                JobTask2.ReadIsolation(IsolationLevel::ReadUncommitted);
                JobTask2.SetLoadFields("Job Task No.");
                while JobTask2.Get("Job No.", "job task No.") do
                    "job task No." := NoSeries.GetNextNo("No. Series");
#if not CLEAN24
                NoSeriesMgt.RaiseObsoleteOnAfterInitSeries("No. Series", "No. Series", 0D, "Job Task No.");
            end;
#endif

            "Contract (Number of Wagons)" := Job2."Def. Number of Wagons";

            JobTask2.SetRange("Job No.", "Job No.");
            if JobTask2.FindLast() then begin
                if JobTask2."Shuttle End Date" <> 0D then begin
                    dt := RoundDateTime(CreateDateTime(JobTask2."Shuttle End Date", JobTask2."Shuttle End Time"), 360000L);
                    Validate("Shuttle Start Date", DT2Date(dt));
                    Validate("Shuttle Start Time", dt2time(dt));
                end;
            end;

        end;
    end;

    procedure GetShuttleStartDateTime(): DateTime
    begin
        if Format("Shuttle Start Date") <> '' then
            EXIT(CreateDateTime("Shuttle Start Date", "Shuttle Start Time"))
        else
            exit(0DT);
    end;

    procedure GetShuttleEndDateTime(): DateTime
    begin
        if format("Shuttle End Date") <> '' then
            EXIT(CreateDateTime("Shuttle End Date", "Shuttle End Time"))
        else
            exit(0DT);
    end;

    var
        JobsSetup: Record "Jobs Setup";

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInitJobTaskNo(var JobTask: Record "Job Task"; var xJobTask: Record "Job Task"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInitJobTaskNoOnCheckSeries(JobNo: Code[20]; JobName: Text[100]; Suffix: Code[10]; var IsHandled: Boolean)
    begin
    end;
}