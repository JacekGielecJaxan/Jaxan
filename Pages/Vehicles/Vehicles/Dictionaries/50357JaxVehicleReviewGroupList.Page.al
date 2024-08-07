/// <summary>
/// Page Wagon Review Group List (ID 50057). Grupy przegladow wagonow
/// </summary>
page 50357 "Vehicle Review Group List"
{
    Caption = 'Vehicle Review Group List';
    DataCaptionFields = "Code", Description;
    PageType = List;
    SourceTable = "Vehicle Review Group";
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Rec."Code")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }
}

