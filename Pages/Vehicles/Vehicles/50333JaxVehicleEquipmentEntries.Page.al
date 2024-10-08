page 50333 "Vehicle Equipment Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Vehicle Equipment Entries';
    DataCaptionFields = "Vehicle No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Vehicle Equipment Entry" = m;
    SourceTable = "Vehicle Equipment Entry";
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
                field(Time; Rec.Time)
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                // nr dokumentu zgloszenia usterek
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //otwarty. przyz gloszeniu zalegania domyslnie ustawiane na true po likwidacji zalegania odznaczane na false
                field(Open; rec.Open)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
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
                    rec.Insert(true);
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
