page 50369 "Vehicle Service Locations"
{
    Caption = 'Vehicle Service Locations';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Vehicle Service Location";
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

