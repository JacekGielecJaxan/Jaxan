page 50033 "Axle Box Types"
{
    Caption = 'Axle Box Types';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Axle Box Type";
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
                field(Name; Rec.Name)
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
