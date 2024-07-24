/// <summary>
/// Słownik przeglądów, napraw zestawow kolowych
/// </summary>
page 50034 "Wheelset Review List"
{
    Caption = 'Wheelset Review List';
    DataCaptionFields = "Code", Description;
    PageType = List;
    SourceTable = "Wheelset Review";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Exclusion; Rec.Exclusion)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
            }
        }
    }
}

