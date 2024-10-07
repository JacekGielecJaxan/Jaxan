page 50047 "Situation Setup"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Situation Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Situation Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Ask When Veh. In a Diff. Loc."; rec."Ask When Veh. In a Diff. Loc.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Ask When Wag. In a Diff. Loc."; rec."Ask When Wag. In a Diff. Loc.")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group("Background Posting")
            {
                Caption = 'Background Posting';
            }
            group(Archiving)
            {
                Caption = 'Archiving';
            }
            group("Journal Templates")
            {
                Caption = 'Journal Templates';
            }
        }
    }


    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

}

