/// <summary>
/// Rodzaje nastawienia hamulca
/// </summary>
page 50054 "Wagon Brake Adjustment Systems"
{
    Caption = 'Wagon Brake Adjustment Systems';
    DataCaptionFields = "Code", Name;
    PageType = List;
    SourceTable = "Wagon Brake Adjustment System";
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
                field(Description; Rec.Name)
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

