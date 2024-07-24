page 50026 "Wagon Fault Attachment Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Wagon Fault Attachment Entries';
    DataCaptionFields = "Wagon No.";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Wagon Fault Attachment Entry" = m;
    SourceTable = "Wagon Fault Attachment Entry";
    SourceTableView = sorting("Wagon No.");
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Fault No"; Rec."Fault No")
                {
                    ApplicationArea = basic, suite;
                    Visible = false;
                }
                field("Wagon No."; Rec."Wagon No.")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Wagon No. 2"; Rec."Wagon No. 2")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("File Name"; Rec."File Name")
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
        }
        area(processing)
        {
        }
        area(Promoted)
        {
            group(Category_Process)
            {
Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

            }
            group(Category_Category5)
            {
Caption = 'Entry', Comment = 'Generated from the PromotedActionCategories property index 4.';
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
    end;

    trigger OnInit()
    begin
    end;

    trigger OnModifyRecord(): Boolean
    begin
    end;

    trigger OnOpenPage()
    begin

        if (Rec.GetFilters() <> '') and not Rec.Find() then
            if Rec.FindFirst() then;
    end;


}
