page 50200 "Timetable Order List"
{
    ApplicationArea = basic, suite;
    UsageCategory = Lists;
    Caption = 'Timetable Order List';
    Editable = false;
    PageType = List;
    SourceTable = "Timetable Order";

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
                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = all;
                }
                field("Train Name"; Rec."Train Name")
                {
                    ApplicationArea = all;
                }

                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = all;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = all;
                }
                field("Active"; Rec.Active)
                {
                    ApplicationArea = all;
                }
                field("Order Group No."; Rec."Order Group No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Prev. Order No."; Rec."Prev. Order No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Closing Organization Cycle No."; Rec."Closing Organization Cycle No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Status No."; Rec."Status No.")
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
                field("Departure Time"; Rec."Departure Time")
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
                field("Arrival Time"; Rec."Arrival Time")
                {
                    ApplicationArea = all;
                }
                field("Carrier Authorization Date"; Rec."Carrier Authorization Date")
                {
                    ApplicationArea = all;
                }
                field("Req. Headquarters Authoriz."; Rec."Req. Headquarters Authoriz.")
                {
                    ApplicationArea = all;
                }
                field("Decree No."; Rec."Decree No.")
                {
                    ApplicationArea = all;
                }
                field("Designer Comments"; Rec."Designer Comments")
                {
                    ApplicationArea = all;
                }
                field("Rejection Reason No."; Rec."Rejection Reason No.")
                {
                    ApplicationArea = all;
                }
                field("Constr. Route Approval Date"; Rec."Constr. Route Approval Date")
                {
                    ApplicationArea = all;
                }
                field("Not Run"; Rec."Not Run")
                {
                    ApplicationArea = all;
                }
                field("Application Authorization Date"; Rec."Application Authorization Date")
                {
                    ApplicationArea = all;
                }
                field("Rejection Date"; Rec."Rejection Date")
                {
                    ApplicationArea = all;
                }
                field("Rejection Description"; Rec."Rejection Description")
                {
                    ApplicationArea = all;
                }
                field("Schedule No."; Rec."Schedule No.")
                {
                    ApplicationArea = all;
                }
                field(Restrictions; Rec.Restrictions)
                {
                    ApplicationArea = all;
                }
                field("Timetable Type No."; Rec."Timetable Type No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Transport Type No."; Rec."Transport Type No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Wide Tracks"; Rec."Wide Tracks")
                {
                    ApplicationArea = all;
                }
                field("Cargo Type No."; Rec."Cargo Type No.")
                {
                    ApplicationArea = all;
                }
                field("Train Order No."; Rec."Train Order No.")
                {
                    ApplicationArea = all;
                }
                field("Carrier Notes"; Rec."Carrier Notes")
                {
                    ApplicationArea = all;
                }
                field("Timetable Notes"; Rec."Timetable Notes")
                {
                    ApplicationArea = all;
                }
                field("Train Character No."; Rec."Train Character No.")
                {
                    ApplicationArea = all;
                }
                field("Operation Days"; Rec."Operation Days")
                {
                    ApplicationArea = all;
                }
                field("Order Vehicles"; Rec."Order Vehicles")
                {
                    ApplicationArea = all;
                }
                field("Train Types"; Rec."Train Types")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Last History"; Rec."Last History")
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

