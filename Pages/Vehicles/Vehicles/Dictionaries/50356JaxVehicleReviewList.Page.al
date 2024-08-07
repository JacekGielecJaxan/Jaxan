/// <summary>
/// Słownik przeglądów, napraw wagonów
/// </summary>
page 50356 "Vehicle Review List"
{
    Caption = 'Vehicle Review List';
    DataCaptionFields = "Code", Description;
    PageType = List;
    SourceTable = "Vehicle Review";
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
                field("Review Group Code"; Rec."Review Group Code")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Exclusion; Rec.Exclusion)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Status 1"; rec."Status 1")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Status 2"; rec."Status 2")
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

