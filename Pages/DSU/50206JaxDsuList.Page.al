page 50206 "DSU List"
{
    ApplicationArea = DSU;
    Caption = 'DSU';
    CardPageID = "DSU Card";
    Editable = false;
    PageType = List;
    SourceTable = "DSU";
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
                    ApplicationArea = DSU;
                    ToolTip = '';
                }
                field(Name; Rec.Description)
                {
                    ApplicationArea = DSU;
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

