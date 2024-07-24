page 50205 "DSU Card"
{
    Caption = 'DSU Card';
    PageType = Card;
    SourceTable = DSU;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = DSU;
                    Importance = Promoted;
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
                Caption = '&DSU Wagon Types';
                Image = Warehouse;

                action("&Wagon Types")
                {
                    ApplicationArea = DSU;
                    Caption = '&Wagon Types';
                    Image = Zones;
                    RunObject = Page "DSU Wagon Types";
                    RunPageLink = "DSU Code" = field(Code);
                    ToolTip = 'View or edit information about zones that you use at this location to structure your bins.';
                }
            }
        }
    }
}

