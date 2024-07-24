page 50066 "Wagon Status Groups TM"
{
    Caption = 'Wagon Status Groups TM';
    DataCaptionFields = "Code", Description;
    PageType = List;
    SourceTable = "Wagon Status Group TM";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Wagon;
                    ToolTip = '';
                }
                field(Name; Rec.Description)
                {
                    ApplicationArea = Wagon;
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

