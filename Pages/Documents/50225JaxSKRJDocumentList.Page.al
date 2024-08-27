page 50225 "SKRJ Document List"
{
    ApplicationArea = basic, suite;
    UsageCategory = Lists;
    Caption = 'SKRJ Document List';
    Editable = false;
    PageType = List;
    SourceTable = "SKRJ Document";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = all;

                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Area Code"; Rec."Area Code")
                {
                    ApplicationArea = all;
                }
                field("Valid From"; Rec."Valid From")
                {
                    ApplicationArea = all;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = all;
                }
                field("Register Entry No."; Rec."Register Entry No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                    Visible = false;
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

