page 50040 "Wheelset Measurement Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Wheelset Measurement Entries';
    DataCaptionFields = "Wheelset No.";
    DeleteAllowed = false;

    InsertAllowed = false;
    Editable = false;
    PageType = List;
    Permissions = TableData "Wheelset Measurement Entry" = m;
    SourceTable = "Wheelset Measurement Entry";
    SourceTableView = sorting("Wheelset No.", "Date") order(descending);
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Wheelset No."; Rec."Wheelset No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Date"; Rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Serie; rec.Serie)
                {
                    ApplicationArea = all;
                }
                field(Mileage; rec.Mileage)
                {
                    ApplicationArea = all;
                }

                field("Height (sH) (Right)"; rec."Height (sH) (Right)")
                {
                    ApplicationArea = all;
                }

                field("Height (sH) (Left)"; rec."Height (sH) (Left)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Thickness (sD) (Left)"; rec."Thickness (sD) (Left)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Thickness (sD) (Right)"; rec."Thickness (sD) (Right)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Gradient (qR) (Left)"; rec."Gradient (qR) (Left)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Gradient (qR) (Right)"; Rec."Gradient (qR) (Right)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Hollow (Hl) (Left)"; rec."Hollow (Hl) (Left)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Hollow (Hl) (Right)"; rec."Hollow (Hl) (Right)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Diameter (D) (Left)"; rec."Diameter (D) (Left)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Diameter (D) (Right)"; rec."Diameter (D) (Right)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Loss (Hl) (Left)"; rec."Loss (Hl) (Left)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Loss (Hl) (Right)"; rec."Loss (Hl) (Right)")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Place"; rec.Place)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Place On Protocole"; rec."Place On Protocole")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Measurement Person"; Rec."Measurement Person")
                {
                    ApplicationArea = basic, suite;
                }
                field("Wagon No."; rec."Wagon No.")
                {
                    ApplicationArea = Basic, Suite;
                }

                field("Wagon No. 2"; rec."Wagon No. 2")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Position; rec.Position)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("User ID"; rec."User ID")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
            }
        }

    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;

                action(Wagon)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Wagon';
                    Image = Customer;
                    RunObject = Page "Wagon Card";
                    RunPageLink = "No." = field("Wagon No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = '';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";

            }
            action("&Navigate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find entries...';
                Image = Navigate;
                Scope = Repeater;
                ShortCutKey = 'Ctrl+Alt+Q';
                ToolTip = '';

                //TODO:Oprogramowac
                trigger OnAction()
                begin
                    //Navigate.SetDoc(Rec."Date", Rec."Transaction No.");
                    Navigate.Run();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("&Navigate_Promoted"; "&Navigate")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Entry', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Wagon_Promoted; Wagon)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
    begin
    end;

    trigger OnAfterGetRecord()
    begin
        //StyleTxt := Rec.SetStyle();
    end;

    trigger OnInit()
    begin
    end;

    trigger OnModifyRecord(): Boolean
    begin
    end;

    trigger OnOpenPage()
    begin
        SetControlVisibility();

        if (Rec.GetFilters() <> '') and not Rec.Find() then
            if Rec.FindFirst() then;
    end;

    var
        Navigate: Page Navigate;

        StyleTxt: Text;

    local procedure SetControlVisibility()
    var
    begin
    end;

}
