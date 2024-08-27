page 50224 "Document Register"
{
    ApplicationArea = basic, suite;
    UsageCategory = Lists;
    Caption = 'Document Register';
    Editable = false;
    PageType = List;
    SourceTable = "Document Register";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = all;

                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = all;
                }
                field(Error; Rec.Error)
                {
                    ApplicationArea = all;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                }
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

