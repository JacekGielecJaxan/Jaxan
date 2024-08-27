page 50216 "Sepe Order List"
{
    ApplicationArea = basic, suite;
    UsageCategory = Lists;
    Caption = 'Sepe Order List';
    Editable = false;
    PageType = List;
    SourceTable = "Sepe Order";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field(Date; Rec."Train Date")
                {
                    ApplicationArea = all;

                }
                field("Timetable Code"; Rec."Timetable Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = all;
                }
                field("Train Date"; Rec."Train Date")
                {
                    ApplicationArea = all;
                }
                field("Departure Date"; Rec."Departure Date")
                {
                    ApplicationArea = all;
                }
                field("Oryginal Date"; Rec."Oryginal Date")
                {
                    ApplicationArea = all;
                }
                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = all;
                }
                field("Train Name"; Rec."Train Name")
                {
                    ApplicationArea = all;
                }
                field("SEPE Entry No."; Rec."SEPE Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Start Object No."; Rec."Start Object No.")
                {
                    ApplicationArea = all;
                }
                field("Start Object Name"; Rec."Start Object Name")
                {
                    ApplicationArea = all;
                }
                field("End Object No."; Rec."End Object No.")
                {
                    ApplicationArea = all;
                }
                field("End Object Name"; Rec."End Object Name")
                {
                    ApplicationArea = all;
                }
                field(Planned; Rec.Planned)
                {
                    ApplicationArea = all;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = all;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = all;
                }
                field(Running; Rec.Running)
                {
                    ApplicationArea = all;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = all;

                }
                field(Resignation; Rec.Resignation)
                {
                    ApplicationArea = all;
                }
                field("Resignation Date"; Rec."Resignation Date")
                {
                    ApplicationArea = all;
                }
                field("Timetable Type No."; Rec."Timetable Type No.")
                {
                    ApplicationArea = all;
                }
                field("Train Type No."; Rec."Train Type No.")
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

