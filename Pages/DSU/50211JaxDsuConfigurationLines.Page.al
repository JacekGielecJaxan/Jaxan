page 50211 "DSU Configuration Lines"
{
    ApplicationArea = Basic, Suite;
    Caption = 'DSU Configuration Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "DSU Configuration Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("DSU Code"; Rec."DSU Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("Date From"; Rec."Date From")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
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

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Show DSU Configuration")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show Document';
                    Image = View;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Open the document that the selected line exists on.';

                    trigger OnAction()
                    var
                        PageManagement: Codeunit "Page Management";
                    begin
                        DsuConfigurationHeader.Get(Rec."DSU Code", Rec."Date From");
                        PageManagement.PageRun(DsuConfigurationHeader);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Show Document_Promoted"; "Show DSU Configuration")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
    end;

    trigger OnOpenPage()
    begin
    end;

    var
        DsuConfigurationHeader: Record "DSU Configuration Header";
}

