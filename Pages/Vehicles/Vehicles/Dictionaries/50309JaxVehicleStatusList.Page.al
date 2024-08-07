page 50309 "Vehicle Status List"
{
    Caption = 'Vehicle Status List';
    DataCaptionFields = "Code", Descripiton;
    PageType = List;
    SourceTable = "Vehicle Status";
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
                field(Description; Rec.Descripiton)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Vehicle Situation"; rec."Vehicle Situation")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                /// <summary>
                /// Status wskazujacy na wylaczenie wagonu.
                /// </summary>
                field(Exclusion; Rec.Exclusion)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                /// <summary>
                /// Status wskazujacy ze wagon jest eksploatowany.
                /// </summary>
                field(Work; rec.Work)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                /// <summary>
                /// Grupa statusu
                /// </summary>
                field("Group Code"; rec."Group Code")
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

