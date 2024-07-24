page 50201 "Timetable Order Card"
{
    Caption = 'Timetable Order Card';
    PageType = Card;
    RefreshOnActivate = true;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "Timetable Order";

    AboutTitle = 'About timetable order details';
    AboutText = '';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Timetable Code"; Rec."Timetable Code")
                {
                    ApplicationArea = all;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = all;
                }
                field("Status No."; Rec."Status No.")
                {
                    ApplicationArea = all;
                }
                field("Order Group No."; Rec."Order Group No.")
                {
                    ApplicationArea = all;
                }
                field("Prev. Order No."; Rec."Prev. Order No.")
                {
                    ApplicationArea = all;
                }
                field("Changing Parameters Order No."; Rec."Changing Parameters Order No.")
                {
                    ApplicationArea = all;
                }
                field("Closing Organization Cycle No."; Rec."Closing Organization Cycle No.")
                {
                    ApplicationArea = all;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = all;
                }

                field("Order Type Code"; Rec."Order Type Code")
                {
                    ApplicationArea = all;
                }
                field("Constr. Route Approval Date"; Rec."Constr. Route Approval Date")
                {
                    ApplicationArea = all;
                }
                field("Applicant No."; Rec."Applicant No.")
                {
                    ApplicationArea = all;
                }
                field("Not Run"; Rec."Not Run")
                {
                    ApplicationArea = all;
                }
                field("Approval Operator No."; Rec."Approval Operator No.")
                {
                    ApplicationArea = all;
                }
                field("Application Authorization Date"; Rec."Application Authorization Date")
                {
                    ApplicationArea = all;
                }
                field("Traction Calculation Date"; Rec."Traction Calculation Date")
                {
                    ApplicationArea = all;
                }
                field("Carrier No."; Rec."Carrier No.")
                {
                    ApplicationArea = all;
                }
                field("Schedule No."; Rec."Schedule No.")
                {
                    ApplicationArea = all;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = all;
                }
                /// <summary>
                /// Nr telegramu skrajniowego
                /// </summary>
                field("Gauge Telegram No."; Rec."Gauge Telegram No.")
                {
                    ApplicationArea = all;
                }

                field("Timetable Type No."; Rec."Timetable Type No.")
                {
                    ApplicationArea = all;
                }
                field("Transport Type No."; Rec."Transport Type No.")
                {
                    ApplicationArea = all;
                }
                field("Receiving Order Branch No."; Rec."Receiving Order Branch No.")
                {
                    ApplicationArea = all;
                }
                field("Variant"; Rec.Variant)
                {
                    ApplicationArea = all;
                }
                field("Responsible Entity No."; Rec."Responsible Entity No.")
                {
                    ApplicationArea = all;
                }

                field("Authorizing Department Id"; Rec."Authorizing Department Id")
                {
                    ApplicationArea = all;
                }
                field("Schedule Unpublished"; Rec."Schedule Unpublished")
                {
                    ApplicationArea = all;
                }
                field("Active"; Rec.Active)
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

                field("Last History"; Rec."Last History")
                {
                    ApplicationArea = all;
                }

            }
            group(Train)
            {
                Caption = 'Train';

                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = all;
                }
                field("Train Name"; Rec."Train Name")
                {
                    ApplicationArea = all;
                }
                field("Train Types"; Rec."Train Types")
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
                field("Train Character No."; Rec."Train Character No.")
                {
                    ApplicationArea = all;
                }
            }
            group(Job)
            {
                Caption = 'Job';

                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = all;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = all;
                }
            }
            group(Object)
            {
                Caption = 'Object';

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

                field("Start Offset Departure"; Rec."Start Offset Departure")
                {
                    ApplicationArea = all;
                }
                field("End Object No."; Rec."End Object No.")
                {
                    ApplicationArea = all;
                }
                field("End Object Pos."; Rec."End Object Pos.")
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
                field("End Offset Arrival"; Rec."End Offset Arrival")
                {
                    ApplicationArea = all;
                }
                field("Leading Hour Pos."; Rec."Leading Hour Pos.")
                {
                    ApplicationArea = all;
                }
                field("Leading Hour"; Rec."Leading Hour")
                {
                    ApplicationArea = all;
                }
                field("Leading Hour Description"; Rec."Leading Hour Description")
                {
                    ApplicationArea = all;
                }

                field("Leading Hour Tolerance Plus"; Rec."Leading Hour Tolerance Plus")
                {
                    ApplicationArea = all;
                }
                field("Leading Hour Tolerance Minus"; Rec."Leading Hour Tolerance Minus")
                {
                    ApplicationArea = all;
                }
                field("Stop Time Tolerance"; Rec."Stop Time Tolerance")
                {
                    ApplicationArea = all;
                }
            }
            group(Decree)
            {
                Caption = 'Decree';

                field("Decree No."; Rec."Decree No.")
                {
                    ApplicationArea = all;
                }
                field("Timetable Decree Of"; Rec."Timetable Decree Of")
                {
                    ApplicationArea = all;
                }
                field("Operator No."; Rec."Operator No.")
                {
                    ApplicationArea = all;
                }
                field("Carrier Authorization Date"; Rec."Carrier Authorization Date")
                {
                    ApplicationArea = all;
                }
                field("Carrier Authoriz. Operator No."; Rec."Carrier Authoriz. Operator No.")
                {
                    ApplicationArea = all;
                }
                field("Req. Headquarters Authoriz."; Rec."Req. Headquarters Authoriz.")
                {
                    ApplicationArea = all;
                }
                field("Headquarters Authoriz. Date"; Rec."Headquarters Authoriz. Date")
                {
                    ApplicationArea = all;
                }
                field("Headq. Authoriz. Operator No."; Rec."Headq. Authoriz. Operator No.")
                {
                    ApplicationArea = all;
                }

                field("Designer Comments"; Rec."Designer Comments")
                {
                    ApplicationArea = all;
                }
            }
            group(Rejection)
            {
                Caption = 'Rejection';
                field("Rejection Reason No."; Rec."Rejection Reason No.")
                {
                    ApplicationArea = all;
                }

                field("Rejection Operator No."; Rec."Rejection Operator No.")
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
            }
            group(Requires)
            {
                Caption = 'Requires';

                field("Requires Carrier Authorization"; Rec."Requires Carrier Authorization")
                {
                    ApplicationArea = all;
                }
            }
            group(Restriction)
            {
                Caption = 'Restriction';
                field(Restrictions; Rec.Restrictions)
                {
                    ApplicationArea = all;
                }

                field("Wide Tracks"; Rec."Wide Tracks")
                {
                    ApplicationArea = all;
                }
            }
            group(Notes)
            {
                Caption = 'Notes';

                field("Email Copy Application"; Rec."Email Copy Application")
                {
                    ApplicationArea = all;
                }
                field("Language Copy Application"; Rec."Language Copy Application")
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

            }
        }
    }


    actions
    {
        area(processing)
        {
            group(Timetable)
            {
                Caption = 'Timetable';
                Image = DataEntry;
            }
            group("E&ntries")
            {
                Caption = 'E&ntries';
                Image = Entries;
                action("&Route")
                {
                    ApplicationArea = Suite;
                    Caption = '&Route';
                    Image = ItemLedger;
                    RunObject = Page "Timetable Route List";
                    RunPageLink = "Timetable Code" = field("Timetable Code");
                    RunPageView = sorting("Timetable Code", "Order No.", "Pos.");
                    Scope = Repeater;
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = '';
                }
                action("&Construction Route")
                {
                    ApplicationArea = Suite;
                    Caption = '&Construction Route';
                    Image = PhysicalInventoryLedger;
                    //RunObject = Page "Timetable Construction Route List";
                    //RunPageLink = "Wagon No." = field("No.");
                    //RunPageView = sorting();
                    Scope = Repeater;
                    ToolTip = '';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if GuiAllowed() then
            OnAfterGetCurrRecordFunc()
        else
            OnAfterGetCurrRecordFuncBackground();
    end;

    local procedure OnAfterGetCurrRecordFunc()
    var
    begin

    end;

    local procedure OnAfterGetCurrRecordFuncBackground()
    begin
    end;

    trigger OnInit()
    begin

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
    end;

    trigger OnOpenPage()
    begin
    end;

    local procedure OnOpenPageFunc()
    var
    begin
    end;

    local procedure OnOpenBackground()
    begin
    end;

    local procedure StartBackgroundCalculations()
    var
    begin
    end;


    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
    end;

}

