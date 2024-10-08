page 50226 "Equipment List"
{
    Caption = 'Equipment List';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Equipment";
    ApplicationArea = basic, suite;
    UsageCategory = Lists;

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