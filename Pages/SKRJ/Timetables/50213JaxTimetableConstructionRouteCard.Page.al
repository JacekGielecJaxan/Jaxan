page 50213 "Timetable Construc. Route Card"
{
    Caption = 'Timetable Construciton Route Card';
    PageType = Card;
    RefreshOnActivate = true;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "Timetable Route";

    AboutTitle = 'About timetable route details';
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
                field("Pos."; Rec."Pos.")
                {
                    ApplicationArea = all;
                }
                field("Lp. PCS"; Rec."Lp. PCS")
                {
                    ApplicationArea = all;
                    Visible = false;
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

                field("Train Type No."; Rec."Train Type No.")
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
            group(Parameters)
            {
                Caption = 'Parameters';

                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = all;
                }
                field("Train Length"; Rec."Train Length")
                {
                    ApplicationArea = all;
                }
                field("Req. Max Perc. Braking Mass"; Rec."Req. Max Perc. Braking Mass")
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
            }
            group(Vehicles)
            {
                Caption = 'Vehicles';

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
            }
            group(Is)
            {
                Caption = 'Is';

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

