controladdin graph
{
    Scripts = 'Graph/dhtmlxgantt.js', 'Graph/graph.js';
    StartupScript = 'Graph/startup.js';
    StyleSheets = 'Graph/dhtmlxgantt.css';
    VerticalStretch = true;
    HorizontalStretch = true;

    event ControlReady();
    event TaskClicked(TaskId: Integer);

    procedure Load(Data: JsonObject);
    procedure SaveChanges(Task: JsonObject);
}