controladdin graph
{
    Scripts = 'Graph/dhtmlxgantt.js', 'Graph/graph.js';
    StartupScript = 'Graph/startup.js';
    StyleSheets = 'Graph/dhtmlxgantt.css';
    VerticalStretch = true;
    HorizontalStretch = true;

    event ControlReady();
    event TaskClicked();

    procedure Load(Data: JsonObject);
}