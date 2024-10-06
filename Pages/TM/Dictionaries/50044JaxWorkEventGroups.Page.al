page 50044 "Work Event Groups"
{
    Caption = 'Work Event Groups';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Work Event Group";
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
    }
}

