page 50699 "Planning"
{
    PageType = Card;
    Caption = 'Planning';
    DataCaptionExpression = Rec.Description;
    UsageCategory = Administration;
    ApplicationArea = all;
    SourceTable = Job;

    layout
    {
        area(Content)
        {
            usercontrol(Graph; graph)
            {
                ApplicationArea = all;

                trigger ControlReady()
                begin
                    CurrPage.Graph.Load(JobAsJson(Rec));
                end;

                trigger TaskClicked(TaskParentId: Code[20])
                var
                    JobCard: Record Job;
                begin
                    IF JobCard.Get(TaskParentId) then begin
                        PAGE.RunModal(Page::"Job Card", JobCard);
                        CurrPage.Graph.Load(JobAsJson(Rec)); //DODAĆ TUTAJ LEPSZE ZAPISYWANIE GANTTA
                    end;
                end;

                trigger TaskDragged(TaskObject: JsonObject; TaskId: Code[20])
                var
                    JobTask: Record "Job Task";
                    Ref: RecordRef;
                    FieldRef: FieldRef;
                    FieldHash: Dictionary of [Text, Integer];
                    i: Integer;
                    JsonKey: Text;
                    T: JsonToken;
                    JsonKeyValue: JsonValue;
                begin
                    JobTask.SetRange("Job Task No.", TaskId);
                    if JobTask.FindSet() then
                        Ref.GetTable(JobTask); //GetTable do poprawy?

                    for i := 1 to Ref.FieldCount() do begin
                        FieldRef := Ref.FieldIndex(i);
                        FieldHash.Add(GetJsonFieldName(FieldRef), FieldRef.Number);
                    end;

                    //Rec.Init();

                    foreach JsonKey in TaskObject.Keys() do begin
                        if TaskObject.Get(JsonKey, T) then begin
                            if T.IsValue then begin
                                JsonKeyValue := T.AsValue();
                                case JsonKey of
                                    'text':
                                        JobTask.Description := JsonKeyValue.AsText();
                                    'start_date':
                                        JobTask."Shuttle Start Date" := JsonDateToDate(JsonKeyValue) + 1;
                                    'duration':
                                        JobTask."Shuttle End Date" := JobTask."Shuttle Start Date" + JsonKeyValue.AsInteger() - 1;
                                end;
                            end;
                        end;
                    end;
                    JobTask.Modify();
                end;
                // FieldRef := Ref.Field(FieldHash.Get(JsonKey));
                // AssignValueToFieldRecord(JsonKeyValue, JsonKey, JobTask);
                // AssignValueToFieldRef(FieldRef, JsonKeyValue);
            }
        }
    }

    local procedure JobAsJson(JobRec: Record Job): JsonObject
    var
        stratdate: Date;
        enddate: Date;
        jobtask: Record "Job Task";
        out: JsonObject;
        project: JsonObject;
        task: JsonObject;
        tasks: JsonArray;
        null: JsonValue;
        links: JsonArray;
    begin
        null.SetValueToNull();

        repeat

            jobtask.SetRange("Job No.", JobRec."No.");
            //jobtask.SetFilter("Shuttle Start Date", '<>0D');

            // Dodawanie job do gantta
            Clear(project);
            project.Add('id', JobRec."No.");
            project.Add('text', JobRec.Description);

            //if jobtask.FindFirst() then begin
            stratdate := jobtask."Shuttle Start Date";
            project.Add('start_date', null);
            project.Add('start_time', null);
            //end;

            //if jobtask.FindLast() then begin
            enddate := jobtask."Shuttle End Date";
            if format(enddate) = '' then
                enddate := Today;
            project.Add('end_date', null);
            project.Add('end_time', null);
            //end;

            project.Add('duration', null);
            project.Add('parent', 0);
            //project.Add('hide_bar', true);
            tasks.Add(project);

            // Dodawanie job task do gantta
            if jobtask.FindFirst() then
                repeat

                    Clear(task);
                    task.add('id', jobtask."Job Task No.");
                    task.add('text', jobtask."Job Task No." + ' / (' +
                      jobtask."Contract (Vehicle Type)" + ' * ' +
                      jobtask."Schedule (Vehicle Type)" + ' * ' +
                      jobtask."Usage (Vehicle Type)" + ') / (' +
                      format(jobtask."Contract (Number of Wagons)") + ' * ' +
                      format(jobtask."Schedule (Number of Wagons)") + ' * ' +
                      format(jobtask."Usage (Number of Wagons)") + ')');
                    task.add('start_date', jobtask."Shuttle Start Date");
                    task.Add('end_date', jobtask."Shuttle End Date");
                    task.Add('strat_time', jobtask."Shuttle Start Time");
                    task.Add('end_time', jobtask."Shuttle End Time");
                    task.add('duration', jobtask."Shuttle End Date" - jobtask."Shuttle Start Date" + 1);
                    task.add('parent', JobRec."No.");

                    if format(jobtask."Shuttle Start Date") <> '' then
                        tasks.Add(task);
                until jobtask.Next() = 0;
        until JobRec.Next() = 0;

        out.Add('data', tasks);
        out.Add('links', links);
        exit(out);
    end;

    procedure GetJsonFieldName(FRef: FieldRef): Text
    var
        Name: Text;
        i: Integer;
    begin
        Name := FRef.Name();
        for i := 1 to StrLen(Name) do begin
            if Name[i] < '0' then
                Name[i] := '_';
        end;
        exit(Name.Replace('__', '_').TrimEnd('_').TrimStart('_'));
    end;

    procedure AssignValueToFieldRef(var FR: FieldRef; JsonKeyValue: JsonValue)
    begin
        case FR.Type() of
            FieldType::Code,
            FieldType::Text:
                FR.Value := JsonKeyValue.AsText();
            FieldType::Integer:
                FR.Value := JsonKeyValue.AsInteger();
            FieldType::Date:
                FR.Value := JsonKeyValue.AsDate();
            FieldType::Boolean:
                FR.Value := JsonKeyValue.AsBoolean();
            else
                Error('%1 is not supported field type', FR.Type());
        end;
    end;

    procedure AssignValueToFieldRecord(JsonKeyValue: JsonValue; JsonKey: Text; JobTask: Record "Job Task")
    begin
        case JsonKey of
            //'id':
            //    JobTask."Job Task No." := Format(JsonKeyValue);
            'text':
                begin
                    //JobTask.Description := 'tata';
                    //JobTask.Modify();
                end;
            'start_date':
                begin
                    JobTask."Shuttle Start Date" := JsonDateToDate(JsonKeyValue) + 1; //Musi być +1, ponieważ z Jsona przychodzi data o jeden dzień wcześniejsza
                end;
            'duration':
                begin
                    JobTask."Shuttle End Date" := JobTask."Shuttle Start Date" + JsonKeyValue.AsInteger() - 1; //To samo co wyżej
                end;                                                                                                         // 'parent':
        end;
    end;

    local procedure JsonDateToDate(JsonKeyValue: JsonValue): Date
    var
        NormalDate: Date;
        TempDate: Text;
        TextDate: Text;
    begin
        TempDate := JsonKeyValue.AsText();
        TextDate := TempDate.Substring(1, 10);
        Evaluate(NormalDate, TextDate);
        exit(NormalDate);
    end;

    local procedure CreateJsonProjectId(JobNo: Text): Integer
    var
        temp: Text;
        result: Integer;
        i: Integer;
        try: Integer;
    begin
        for i := 1 to StrLen(JobNo) do begin
            if JobNo[i] <= '9' then
                temp += JobNo[i];
        end;

        if not Evaluate(result, temp) then
            Error('Could not create JsonId for Project');

        exit(result);
    end;

    local procedure CreateJsonTaskId(JobTaskNo: Text): Integer
    var
        temp: Text;
        result: Integer;
        i: Integer;
    begin
        for i := 1 to StrLen(JobTaskNo) do begin
            if (JobTaskNo[i] < '9') and (JobTaskNo[i] >= '0') then
                temp += JobTaskNo[i];
        end;

        if not Evaluate(result, temp) then
            Error('Could not create JsonId for Task');

        exit(result);
    end;
}