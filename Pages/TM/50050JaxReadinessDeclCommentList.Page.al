page 50050 "Readiness Decl. Comment List"
{
    Caption = 'Situation Comment List';
    DataCaptionFields = "Readiness Decl. Entry No.", Comment;
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Readiness Decl. Comment Line";

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
            }
        }
    }

    actions
    {
    }
}

