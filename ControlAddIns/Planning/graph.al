controladdin graph
{
    Scripts = 'ControlAddIns/Planning/dhtmlxgantt.js', 'ControlAddIns/Planning/graph.js';
    StartupScript = 'ControlAddIns/Planning/startup.js';
    StyleSheets = 'ControlAddIns/Planning/dhtmlxgantt.css';
    VerticalStretch = true;
    HorizontalStretch = true;

    event ControlReady();
    event TaskClicked(TaskParentId: Code[20]);
    event TaskDragged(TaskObject: JsonObject; TaskId: Code[20]);

    procedure Load(Data: JsonObject);
}