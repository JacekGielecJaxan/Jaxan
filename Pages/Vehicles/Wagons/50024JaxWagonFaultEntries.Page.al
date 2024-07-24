page 50024 "Wagon Fault Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Wagon Fault Entries';
    DataCaptionFields = "Wagon No.";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Wagon Fault Entry" = m;
    SourceTable = "Wagon Fault Entry";
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
                }
                field("Wagon No."; Rec."Wagon No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Wagon No. 2"; Rec."Wagon No. 2")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Element Code"; Rec."Element Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Fault Code"; Rec."Fault Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Short Fault Description"; Rec."Short Fault Description")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Fault No."; Rec."Fault No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Fault TM No."; Rec."Fault TM No.")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Fault Reporting User Id"; Rec."Fault Reporting User Id")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Date of Reporting the Fault"; Rec."Date of Reporting the Fault")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Place of Reporting the Fault"; Rec."Place of Reporting the Fault")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field(Latitude; Rec.Latitude)
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field(Longitude; Rec.Longitude)
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = basic, suite;
                }
                field("Accepting User Id"; Rec."Accepting User Id")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Acceptance Date"; Rec."Acceptance Date")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = basic, suite;
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
