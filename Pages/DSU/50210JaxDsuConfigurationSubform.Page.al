page 50210 "DSU Configuration Subform"
{
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "DSU Configuration Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';

                }

                field("Review Code"; Rec."Review Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }

                field("Review Group Code"; Rec."Review Group Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                    Visible = false;
                }
                field("Period"; Rec.Period)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("Quantity"; Rec.Quantity)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("Km Limit"; Rec."Km Limit")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("Next Position"; Rec."Next Position")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("Warning Days 1"; Rec."Warning Days 1")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }

                field("Warning Days 2"; Rec."Warning Days 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }

                field("Warning Km"; Rec."Warning Km")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.InitRec();
    end;
}

