page 50400 "Job Setup"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Job Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Job Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Work Register Prefix"; rec."Work Register Prefix")
                {
                    ApplicationArea = basic, suite;
                }
                field("Test Time"; rec."Test Time")
                {
                    ApplicationArea = basic, suite;
                }
                field("Simplified Test Time"; rec."Simplified Test Time")
                {
                    ApplicationArea = basic, suite;
                }
                field("Default Work Time"; rec."Default Work Time")
                {
                    ApplicationArea = basic, suite;
                }
            }
            group("Series No.")
            {
                Caption = 'Series No.';
                field("Work Register Nos."; rec."Work Register Nos.")
                {
                    ApplicationArea = basic, suite;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            OnOpenPageOnBeforeRecInsert(Rec);
            Rec.Insert();
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnOpenPageOnBeforeRecInsert(var JobSetup: Record "Job Setup")
    begin
    end;
}

