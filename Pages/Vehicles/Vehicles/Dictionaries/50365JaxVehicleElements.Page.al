page 50365 "Vehicle Elements"
{
    Caption = 'Vehicle Elements';
    DataCaptionFields = "Code", "Name";
    PageType = List;
    SourceTable = "Vehicle element";
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field(Code; rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Name"; Rec."Name")
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

