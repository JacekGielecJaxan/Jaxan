/// <summary>
/// Page Mine List (ID 50002).
/// Lista kopalni
/// </summary>
page 50002 "Mine List"
{
    Caption = 'Mine List';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Mine";
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

