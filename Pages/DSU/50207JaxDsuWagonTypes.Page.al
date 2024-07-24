Page 50207 "DSU Wagon Types"
{
    Caption = 'DSU Wagon Types';
    DataCaptionFields = "DSU Code", Code;
    PageType = List;
    SourceTable = "DSU Wagon Type";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("DSU Code"; Rec."DSU Code")
                {
                    ApplicationArea = DSU;
                    ToolTip = '';
                    Visible = false;
                }
                field("Code"; Rec.Code)
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

