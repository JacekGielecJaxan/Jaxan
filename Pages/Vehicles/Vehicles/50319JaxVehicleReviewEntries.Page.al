page 50319 "Vehicle Review Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Vehicle Review Entries';
    DataCaptionFields = "Vehicle No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Vehicle Review Entry" = m;
    SourceTable = "Vehicle Review Entry";
    SourceTableView = sorting("Vehicle No.", "Date") order(descending);
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
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Vehicle No. 2"; Rec."Vehicle No. 2")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Visible = false;
                }
                field("Review Code"; Rec."Review Code")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Review Group"; Rec."Review Group")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = basic, suite;
                    Editable = false;

                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("External Doc. No."; Rec."External Doc. No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Planned Km"; Rec."Planned Km")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Actual Km"; Rec."Actual Km")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }

                field("Approval Document No."; Rec."Approval Document No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                /// <summary>
                /// Kod odroczenia
                /// </summary>
                field("Prorogation Code"; Rec."Prorogation Code")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Term."; Rec."Term.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                /// <summary>
                /// Data odroczenia
                /// </summary>
                field("Prorogation Date"; Rec."Prorogation Date")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                /// <summary>
                /// Nr dokumentu dopuszczenia
                /// </summary>
                field("Prorogation Doc. No."; Rec."Prorogation Doc. No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                /// <summary>
                /// Data dokumentu odroczenia
                /// </summary>
                field("Prorogation Doc. Date"; Rec."Prorogation Doc. Date")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
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

                action(Vehicle)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vehicle';
                    Image = Customer;
                    RunObject = Page "Vehicle Card";
                    RunPageLink = "No." = field("Vehicle No.");
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

                actionref(Vehicle_Promoted; Vehicle)
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
