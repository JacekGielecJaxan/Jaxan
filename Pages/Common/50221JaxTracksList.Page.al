page 50221 "Tracks List"
{
    Caption = 'Tracks List';
    DataCaptionFields = "Station Code", "Code", Description;
    PageType = List;
    SourceTable = "Track";
    ApplicationArea = basic, suite;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Station Code"; Rec."Station Code")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                    Visible = false;
                }
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
                field(Length; Rec.Length)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Info; Rec.Info)
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