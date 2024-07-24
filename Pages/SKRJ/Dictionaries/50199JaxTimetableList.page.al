page 50199 "Timetable List"
{
    ApplicationArea = basic, suite;
    Caption = 'Timetable List';
    Editable = false;
    PageType = List;
    SourceTable = "Timetable";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Name; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }

                field(Year; Rec.Year)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }

                field("Date From"; Rec."Date From")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }

                field("Date To"; Rec."Date To")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&DSU")
            {
                Caption = '&DSU';
                Image = Warehouse;

                action("&Wagon Types")
                {
                    ApplicationArea = DSU;
                    Caption = '&Wagon Types';
                    Image = Zones;
                    RunObject = Page "DSU Wagon Types";
                    RunPageLink = "DSU Code" = field(Code);
                    ToolTip = '';
                }
            }
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

