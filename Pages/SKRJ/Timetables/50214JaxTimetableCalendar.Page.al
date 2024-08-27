page 50214 "Timetable Calendars"
{
    ApplicationArea = basic, suite;
    UsageCategory = Lists;
    Caption = 'Timetable Calendars';
    Editable = false;
    PageType = List;
    SourceTable = "Timetable Calendar";

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
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Running Days"; Rec."Running Days")
                {
                    ApplicationArea = all;
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = all;
                }
                field(M00; Rec.M00)
                {
                    ApplicationArea = all;
                }
                field(M01; Rec.M01)
                {
                    ApplicationArea = all;
                }
                field(M02; Rec.M02)
                {
                    ApplicationArea = all;
                }
                field(M03; Rec.M03)
                {
                    ApplicationArea = all;
                }
                field(M04; Rec.M04)
                {
                    ApplicationArea = all;
                }
                field(M05; Rec.M05)
                {
                    ApplicationArea = all;
                }
                field(M06; Rec.M06)
                {
                    ApplicationArea = all;
                }
                field(M07; Rec.M07)
                {
                    ApplicationArea = all;
                }
                field(M08; Rec.M08)
                {
                    ApplicationArea = all;
                }
                field(M09; Rec.M09)
                {
                    ApplicationArea = all;
                }
                field(M10; Rec.M10)
                {
                    ApplicationArea = all;
                }
                field(M11; Rec.M11)
                {
                    ApplicationArea = all;
                }
                field(M12; Rec.M12)
                {
                    ApplicationArea = all;
                }
                field(Terms; Rec.Terms)
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

