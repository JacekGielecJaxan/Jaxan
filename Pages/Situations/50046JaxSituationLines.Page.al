page 50046 "Situation Lines"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Situation Lines';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Situation Line" = m;
    SourceTable = "Situation Line";
    SourceTableView = sorting("Object No.", position) order(descending);
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Object No."; rec."Object No.")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Track No."; rec."Track No.")
                {
                    ApplicationArea = basic, suite;
                }
                field(Position; rec.Position)
                {
                    ApplicationArea = basic, suite;
                }
                field("Vehicle Type"; rec."Vehicle Type")
                {
                    ApplicationArea = basic, suite;
                }
                field("Vehicle No."; rec."Vehicle No.")
                {
                    ApplicationArea = basic, suite;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a description of the customer entry.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = basic, suite;
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
                    Visible = false;

                }
                field("SEPE Order No."; Rec."SEPE Order No.")
                {
                    ApplicationArea = basic, suite;
                }
                field("SKRJ Order No"; Rec."SKRJ Order No")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Train Name"; rec."Train Name")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
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
