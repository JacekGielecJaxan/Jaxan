page 50039 "Wheelset Approval Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Wheelset Approval Entries';
    DataCaptionFields = "Wheelset No.";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Wheelset Approval Entry" = m;
    SourceTable = "Wheelset Approval Entry";
    SourceTableView = sorting("Wheelset No.", "Date") order(descending);
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
                field("Wheelset No."; Rec."Wheelset No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Wagon No. 2"; Rec."Wagon No. 2")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                /// <summary>
                /// Nr dopuszczenia
                /// </summary>
                field("Approval No."; Rec."Approval No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                /// <summary>
                /// Wazne od
                /// </summary>
                field("Valid From"; rec."Valid From")
                {
                    ApplicationArea = Basic, Suite;
                }
                /// <summary>
                /// Data waznosci
                /// </summary>
                field("Expiration Date"; rec."Expiration Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Limit Km"; rec."Limit Km")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Actual Km"; rec."Actual Km")
                {
                    ApplicationArea = Basic, Suite;
                }
                /// <summary>
                /// Organ wydający dopuszczenie
                /// </summary>
                field("Office Issuing The Approval"; rec."Office Issuing The Approval")
                {
                    ApplicationArea = Basic, Suite;

                }
                /// <summary>
                /// Osoba wydająca dopuszczenie
                /// </summary>
                field("Person Name Iss. The Approval"; rec."Person Name Iss. The Approval")
                {
                    ApplicationArea = Basic, Suite;

                }
                /// <summary>
                /// Status dopuszczenia
                /// </summary>
                field("Status Approval"; rec."Status Approval")
                {
                    ApplicationArea = Basic, Suite;
                }
                /// <summary>
                /// Osoba anulujaca
                /// </summary>
                field("Person Canceling"; rec."Person Canceling")
                {
                    ApplicationArea = Basic, Suite;
                }
                /// <summary>
                /// Przyczyna anulowania
                /// </summary>
                field("Reason For Cancellation"; rec."Reason For Cancellation")
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
