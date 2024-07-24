page 50100 "Vendor Types"
{
    Caption = 'Vendor Types';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Vendor Type";
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

