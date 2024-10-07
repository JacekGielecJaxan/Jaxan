page 50045 "Readiness Declaration Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Readiness Declaration Entries';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "readiness declaration Entry" = m;
    SourceTable = "readiness declaration Entry";
    //SourceTableView = sorting("Wheelset No.", "Date") order(descending);
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
                field(Time; rec.Time)
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Who Was Reported"; rec."Who Was Reported")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Job No."; Rec."Job No.")
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
                field("Train No."; Rec."Train No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }
                field("Object No."; rec."Object No.")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field("Object Name"; rec."Object Name")
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                }

                field(Longitude; rec.Longitude)
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field(Latitude; rec.Latitude)
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
