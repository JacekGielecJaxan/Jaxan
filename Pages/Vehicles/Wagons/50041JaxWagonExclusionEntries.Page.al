page 50041 "Wagon Exclusion Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Wagon Exclusion Entries';
    DataCaptionFields = "Wagon No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Wagon Exclusion Entry" = m;
    SourceTable = "Wagon Exclusion Entry";
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
                field(Time; Rec.Time)
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Number of Faults"; rec."Number of Faults")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Status Grooup Code"; rec."Status Grooup Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Status Code"; rec."Status Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Train No."; rec."Train No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Exclusion Date"; rec."Exclusion Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Exclusion Time"; rec."Exclusion Time")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Exclusion User Id"; rec."Exclusion User Id")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Exclusion Place"; rec."Exclusion Place")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Station Code"; rec."Station Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Track No."; rec."Track No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //firma wynajmujaca
                field("Leasing Company Code"; rec."Leasing Company Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //z wahadla
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //z wahadla
                field("Job Task No."; rec."Job Task No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //rozliczeniowa data wyłączenia
                field("Billing Cut-Off Date"; rec."Billing Cut-Off Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //prozny
                field(Empty; rec.Empty)
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
                //data zamkniecia
                field("Closed Date"; rec."Closed Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //czas zamkniecia
                field("Closed Time"; rec."Closed Time")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Billing Date of Inclusion"; rec."Billing Date of Inclusion")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //liczba wagonodob
                field(Days; rec.Days)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }

                //liczba wagonodob rozliczeniowych
                field("Billing Days"; rec."Billing Days")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //nr przywrocenia
                field("Restoration No."; rec."Restoration No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                //nr dopuszczenia
                field("Admission No."; rec."Admission No.")
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
