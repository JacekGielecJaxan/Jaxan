/// <summary>
/// Page Traction Vehicle Types (ID 50110). 
/// </summary>
page 50110 "Traction Vehicle Types"
{
    Caption = 'Traction Vehicle Types';
    DataCaptionFields = "Code";
    PageType = List;
    SourceTable = "Traction Vehicle Type";
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Location Code"; Rec."Code")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                    Visible = false;
                }
                field(Description; Rec.Name)
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

