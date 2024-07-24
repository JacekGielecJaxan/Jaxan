page 50208 "DSU Configuration List"
{
    Caption = 'DSU Configuration List';
    DataCaptionFields = "DSU Code", "Date From";
    Editable = false;
    PageType = List;
    SourceTable = "DSU Configuration Header";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("DSU Code"; Rec."DSU Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("Date From"; Rec."Date From")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
            }
        }
    }

}

