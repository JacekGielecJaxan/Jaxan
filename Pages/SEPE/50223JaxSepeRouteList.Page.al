page 50223 "Sepe Route List"
{
    ApplicationArea = basic, suite;
    UsageCategory = Lists;
    Caption = 'Sepe Route List';
    Editable = false;
    PageType = List;
    SourceTable = "Sepe Route";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Timetable Code"; Rec."Timetable Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = all;
                }
                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = all;
                }
                field("SEPE Entry No."; Rec."SEPE Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Object No."; Rec."Object No.")
                {
                    ApplicationArea = all;
                }
                field("Object Name"; Rec."Object Name")
                {
                    ApplicationArea = all;
                }
                field("Departure Plan"; Rec."Departure Plan")
                {
                    ApplicationArea = all;
                }
                field("Departure Actual"; Rec."Departure Actual")
                {
                    ApplicationArea = all;
                }
                field("Arrival Plan"; Rec."Arrival Plan")
                {
                    ApplicationArea = all;
                }
                field("Arrival Actual"; Rec."Arrival Actual")
                {
                    ApplicationArea = all;
                }
                field(Approval; Rec.Approval)
                {
                    ApplicationArea = all;
                }
                field(Stop; Rec.Stop)
                {
                    ApplicationArea = all;
                }
                field(Km; Rec.Km)
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

