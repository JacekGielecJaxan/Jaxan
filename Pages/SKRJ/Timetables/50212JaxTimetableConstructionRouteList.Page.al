page 50212 "Timetable Construc. Route List"
{
    ApplicationArea = basic, suite;
    Caption = 'Timetable Construction Route List';
    Editable = false;
    PageType = List;
    SourceTable = "Timetable Construction Route";
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
                field("Preliminary Route Pos."; Rec."Preliminary Route Pos.")
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
                field("Driving Time"; Rec."Driving Time")
                {
                    ApplicationArea = all;
                }
                field("Cumulative Way"; Rec."Cumulative Way")
                {
                    ApplicationArea = all;
                }
                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = all;
                }
                field("Arrival Time"; Rec."Arrival Time")
                {
                    ApplicationArea = all;
                }
                field("Arrival Offset"; Rec."Arrival Offset")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Departure Time"; Rec."Departure Time")
                {
                    ApplicationArea = all;
                }
                field("Departure Offset"; Rec."Departure Offset")
                {
                    ApplicationArea = all;
                }
                field("Rail Line No."; Rec."Rail Line No.")
                {
                    ApplicationArea = all;
                }
                field("Axle Meter"; Rec."Axle Meter")
                {
                    ApplicationArea = all;
                }
                field("Stop Time"; Rec."Stop Time")
                {
                    ApplicationArea = all;
                }
                field("Is Technical Stop"; Rec."Is Technical Stop")
                {
                    ApplicationArea = all;
                }
                field("Is Train Front Change"; Rec."Is Train Front Change")
                {
                    ApplicationArea = all;
                }
                field("Approved"; Rec.Approved)
                {
                    ApplicationArea = all;
                }
                field("Gross Weight"; rec."Gross Weight")
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
                    Visible = false;
                }
                field("Req. Max Perc. Braking Mass"; Rec."Req. Max Perc. Braking Mass")
                {
                    ApplicationArea = all;
                }
                field("Vehicle 1 No."; Rec."Vehicle 1 No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Vehicle 1 Code"; Rec."Vehicle 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Vehicle 2 No."; Rec."Vehicle 2 No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Vehicle 2 Code"; Rec."Vehicle 2 Code")
                {
                    ApplicationArea = all;
                }
                field("Vehicle 3 No."; Rec."Vehicle 3 No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Vehicle 3 Code"; Rec."Vehicle 3 Code")
                {
                    ApplicationArea = all;
                }
                field("Train Type No."; Rec."Train Type No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Train Type Code"; Rec."Train Type Code")
                {
                    ApplicationArea = all;
                }
                field("Max. Load Axle"; Rec."Max. Load Axle")
                {
                    ApplicationArea = all;
                }
                field("Gross Train"; Rec."Gross Train")
                {
                    ApplicationArea = all;
                }
                field("V. Max."; Rec."V. Max.")
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
                field("Is Maneuvers"; Rec."Is Maneuvers")
                {
                    ApplicationArea = all;
                }
                field("Is Stop For Employee"; Rec."Is Stop For Employee")
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

