page 50018 "Wagon Km Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Wagon Km Entries';
    DataCaptionFields = "Wagon No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Wagon Km Entry" = m;
    SourceTable = "Wagon Km Entry";
    SourceTableView = sorting("Wagon No.", "Date") order(descending);
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Date"; Rec."Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Wagon No."; Rec."Wagon No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Wagon No. 2"; Rec."Wagon No. 2")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Visible = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field(TimetableCode; Rec.TimetableCode)
                {
                    ApplicationArea = basic, suite;
                    Editable = false;

                }
                field("SEPE Order No."; Rec."SEPE Order No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("SKRJ Order No"; Rec."SKRJ Order No")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Order No."; Rec."Sales Order No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field(Km; Rec.Quantity)
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Station From Pos."; Rec."Station From Pos.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Station From No."; Rec."Station From No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Station From Name"; Rec."Station From Name")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Station To Pos."; Rec."Station To Pos.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Station To No."; Rec."Station To No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Station To Name"; Rec."Station To Name")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Status Grooup Code"; Rec."Status Grooup Code")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Status Code"; Rec."Status Code")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Status TM Code"; Rec."Status TM Code")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies a description of the customer entry.';
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
