/// <summary>
/// Page Wagon Insets (ID 50061). Wstawka
/// </summary>
page 50361 "Vehicle Insets"
{
    Caption = 'Vehicle Insets';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Vehicle Inset";
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

