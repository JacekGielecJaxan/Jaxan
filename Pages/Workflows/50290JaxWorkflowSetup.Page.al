page 50290 "Workflow Setup"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Workflow Setup';
    DataCaptionExpression = '';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Workflow Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("Workflow Nos."; Rec."Workflow Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to workflows.';
                }
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
