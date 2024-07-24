page 50204 "SKRJ Object List"
{
    ApplicationArea = basic, suite;
    Caption = 'SKRJ Object List';
    Editable = false;
    PageType = List;
    SourceTable = "SKRJ Object";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Short Name"; Rec."Short Name")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }

                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }

                field("Important For Freight Traffic"; Rec."Important For Freight Traffic")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Poss. Start Of A Freight Train"; Rec."Poss. Start Of A Freight Train")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Poss. End Of Freight Train Run"; Rec."Poss. End Of Freight Train Run")
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

    actions
    {
        area(navigation)
        {
        }
    }

    procedure GetSelectionFilter(): Text
    var
        Loc: Record Location;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Loc);
        exit(SelectionFilterManagement.GetSelectionFilterForLocation(Loc));
    end;
}

