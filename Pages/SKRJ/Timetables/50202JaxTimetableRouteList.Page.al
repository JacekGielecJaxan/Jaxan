page 50202 "Timetable Route List"
{
    ApplicationArea = basic, suite;
    Caption = 'Timetable Route List';
    Editable = false;
    PageType = List;
    SourceTable = "Timetable Route";
    UsageCategory = Lists;

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
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = all;
                }
                field("Pos."; Rec."Pos.")
                {
                    ApplicationArea = all;
                }
                field("Lp. PCS"; Rec."Lp. PCS")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = all;
                }
                field("Train Length"; Rec."Train Length")
                {
                    ApplicationArea = all;
                }
                field("Entrance Platform"; Rec."Entrance Platform")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Entrance Track"; Rec."Entrance Track")
                {
                    ApplicationArea = all;
                }
                field("Req. Max Perc. Braking Mass"; Rec."Req. Max Perc. Braking Mass")
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
                field("Stop Time"; Rec."Stop Time")
                {
                    ApplicationArea = all;
                }
                field("Vehicle 1 No."; Rec."Vehicle 1 No.")
                {
                    ApplicationArea = all;
                }
                field("Vehicle 2 No."; Rec."Vehicle 2 No.")
                {
                    ApplicationArea = all;

                }
                field("Vehicle 3 No."; Rec."Vehicle 3 No.")
                {
                    ApplicationArea = all;
                }
                field("Train Type No."; Rec."Train Type No.")
                {
                    ApplicationArea = all;
                }
                field("Max. Load Axle"; Rec."Max Load Axle")
                {
                    ApplicationArea = all;
                }
                field("Gross Train"; Rec."Gross Train")
                {
                    ApplicationArea = all;
                }
                field("V Max"; Rec."V Max")
                {
                    ApplicationArea = all;
                }
                field("Wagon Train Length"; Rec."Wagon Train Length")
                {
                    ApplicationArea = all;
                }
                field("Train Braking Mass"; Rec."Train Braking Mass")
                {
                    ApplicationArea = all;
                }
                field("Is Train Set Change"; Rec."Is Train Set Change")
                {
                    ApplicationArea = all;
                }
                field("Is Technical Stop"; Rec."Is Technical Stop")
                {
                    ApplicationArea = all;
                }
                field("Is Maneuvers"; Rec."Is Maneuvers")
                {
                    ApplicationArea = all;
                }
                field("Is Stop For Employee"; Rec."Is Stop For Employee")
                {
                    ApplicationArea = all;
                }
                field("Public Service No."; Rec."Public Service No.")
                {
                    ApplicationArea = all;
                }
                field("PCS Brake Type No."; Rec."PCS Brake Type No.")
                {
                    ApplicationArea = all;
                }
                field("Bits Parameters"; Rec."Bits Parameters")
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

