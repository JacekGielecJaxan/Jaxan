page 50048 "Situation Comment Sheet"
{
    AutoSplitKey = true;
    Caption = 'Situation Comment Sheet';
    DataCaptionFields = "Situation Entry No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Situation Comment Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Date; Rec.Date)
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the date the comment was created.';
                }
                field(Time; rec.Time)
                {
                    ApplicationArea = comments;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the comment itself.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies a code for the comment.';
                    Visible = false;
                }
                field("Object No."; rec."Object No.")
                {
                    ApplicationArea = comments;
                    Visible = false;
                }
                field("Object Name"; rec."Object Name")
                {
                    ApplicationArea = comments;
                }
                field("Track No."; rec."Track No.")
                {
                    ApplicationArea = comments;
                }
                field("Vehicle Type"; rec."Vehicle Type")
                {
                    ApplicationArea = comments;
                }
                field("Vehicle No."; rec."Vehicle No.")
                {
                    ApplicationArea = comments;
                }

            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.SetUpNewLine();
    end;
}
