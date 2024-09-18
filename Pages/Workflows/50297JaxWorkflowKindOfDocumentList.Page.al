page 50297 "Workflow Kind Of Document List"
{
    Caption = 'Workflow Kind Of Document List';
    DataCaptionFields = "Code", Descripiton;
    PageType = List;
    SourceTable = "Workflow Kind Of Document";
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
                field(Name; Rec.Descripiton)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Important; rec.Important)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Contractor No. Mandatory"; rec."Contractor No. Mandatory")
                {
                    ApplicationArea = all;
                }
                field("Ext. Document No. Mandatory"; rec."Ext. Document No. Mandatory")
                {
                    ApplicationArea = all;
                }
                field("Amount Mandatory"; rec."Amount Mandatory")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

