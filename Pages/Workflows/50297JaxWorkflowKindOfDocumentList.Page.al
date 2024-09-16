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
            }
        }
    }
}

