page 50067 "Wagon Prorogation List"
{
    Caption = 'Wagon Prorogation List';
    DataCaptionFields = "Code", "Description";
    PageType = List;
    SourceTable = "Wagon Prorogation";
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field(Code; rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Descripiton"; Rec."Description")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                /// <summary>
                /// Formula daty
                /// </summary>
                field("Term."; Rec."Term.")
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

