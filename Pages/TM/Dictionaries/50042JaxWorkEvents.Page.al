page 50042 "Work Events"
{
    Caption = 'Work Events';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Work Event";
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
                field("Work Event Group"; rec."Work Event Group")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

