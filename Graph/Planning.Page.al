page 50699 "Planning"
{
    PageType = Card;
    Caption = 'Planning';
    DataCaptionExpression = Rec.Description;
    UsageCategory = Administration;
    ApplicationArea = all;
    SourceTable = Job; //AKA SHUTTLE!!!

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

                trigger TaskClicked()
                begin
                    page.Run(89); //Odpala formularz z wahadłami
                end;
            }
        }
    }

    procedure JobAsJson(JobRec: Record Job): JsonObject
    var
        jobtask: Record "Job Task";
        out: JsonObject;
        project: JsonObject;
        task: JsonObject;
        tasks: JsonArray;
        null: JsonValue;
        id: Integer;
        links: JsonArray;
    begin
        id := 1;

        repeat
            Clear(project);
            project.Add('id', id);
            project.Add('text', JobRec.Description);
            project.Add('start_date', JobRec."Starting Date");
            project.Add('duration', JobRec."Ending Date" - JobRec."Starting Date" + 1);
            project.Add('parent', 0);
            project.Add('progress', 0);
            project.Add('open', true);
            tasks.Add(project);
            id += 1;
        until JobRec.Next() = 0;

        /*
                null.SetValueToNull();
                id := 1;
                task.Add('id', id);
                task.Add('text', JobRec.Description);
                task.Add('start_date', JobRec."Starting Date");
                task.Add('duration', 1);
                task.Add('parent', 0);
                task.Add('progress', 0);
                task.Add('open', true);
                tasks.Add(task);
                */

        /*
                jobtask.SetRange("Job No.", JobRec."No.");
                if jobtask.FindSet() then
                    repeat
                        Clear(task);
                        id += 1;
                        task.Add('id', id);
                        task.Add('text', jobtask.Description);
                        task.Add('start_date', jobtask."Start Date");
                        task.Add('duration', jobtask."End Date" - jobtask."Start Date" + 1);
                        if jobtask.Indentation = 0 then
                            task.Add('parent', 1)
                        else begin
                            task.Add('parent', id - 1) // Wrong
                        end;
                        tasks.Add(task);
                    until jobtask.Next() = 0;
        */

        out.Add('data', tasks);
        out.Add('links', links);
        exit(out);
    end;

}