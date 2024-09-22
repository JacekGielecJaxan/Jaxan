codeunit 50020 "Job Task Event"
{
    [EventSubscriber(ObjectType::Table, Database::"Job Task", 'OnBeforeOnInsert', '', false, false)]
    local procedure OnBeforeOnInsert(var JobTask: Record "Job Task"; var IsHandled: Boolean)
    var
        Job: Record Job;
    begin
        Job.Get(jobtask."Job No.");
        if Job.Blocked = Job.Blocked::All then
            Job.TestBlocked();
        IsHandled := true;
    end;

    //local procedure OnInitJobTaskNoOnCheckSeries(JobNo: Code[20]; Suffix: Code[10]; var IsHandled: Boolean)
    [EventSubscriber(ObjectType::Table, Database::"Job Task", 'OnInitJobTaskNoOnCheckSeries', '', false, false)]
    local procedure OnInitJobTaskNoOnCheckSeries(JobNo: Code[20]; JobName: Text[100]; Suffix: Code[10]; var IsHandled: Boolean)
    var
        JaxNoSeriesMgt: Codeunit "Jax NoSeriesManagement";
        NoSerie: Record "No. Series";
        SerieCode: Code[10];
    begin
        if (JobNo = '') or (Suffix = '') then begin
            IsHandled := true;
            EXIT;
        end;

        SerieCode := JobNo + Suffix;

        if not NoSerie.Get(SerieCode) then
            JaxNoSeriesMgt.AddNewSeries(SerieCode, JobNo, JobName);

    end;

    [EventSubscriber(ObjectType::Table, Database::"Job Task", 'OnBeforeValidateJobTaskNo', '', false, false)]
    local procedure OnBeforeValidateJobTaskNo(var JobTask: Record "Job Task"; var xJobTask: Record "Job Task"; FieldNumber: Integer; var IsHandled: Boolean)
    var

    begin
        IsHandled := true;
    end;
}