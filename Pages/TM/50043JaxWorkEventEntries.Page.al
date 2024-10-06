page 50043 "Work Event Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Work Event Entries';
    //DataCaptionFields = "Wheelset No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Work Event Entry" = m;
    SourceTable = "Work Event Entry";
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
                field("Work Event Code"; rec."Work Event Code")
                {
                    ApplicationArea = basic, suite;
                }
                field("Work Event Name"; rec."Work Event Name")
                {
                    ApplicationArea = basic, suite;
                }
                field("Work Event Group"; rec."Work Event Group")
                {
                    ApplicationArea = basic, suite;
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
                field("Notification Place"; rec."Notification Place")
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
