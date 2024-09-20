table 50292 "Workflow Comment Line"
{
    Caption = 'Workflow Comment Line';
    DrillDownPageID = "Workflow Comment List";
    LookupPageID = "Workflow Comment List";
    DataClassification = CustomerContent;

    fields
    {
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure SetUpNewLine()
    var
        CommentLine: Record "Workflow Comment Line";
    begin
        CommentLine.SetRange("No.", "No.");
        CommentLine.SetRange(Date, WorkDate());
        OnSetUpNewLineOnAfterSetFilter(Rec, CommentLine);
        if not CommentLine.FindFirst() then
            Date := WorkDate();

        OnAfterSetUpNewLine(Rec, CommentLine);
    end;

    procedure CopyComments(FromDocumentType: Integer; ToDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20])
    var
        CommentLine: Record "Workflow Comment Line";
        CommentLine2: Record "Workflow Comment Line";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCopyComments(CommentLine, ToDocumentType, IsHandled, FromDocumentType, FromNumber, ToNumber);
        if IsHandled then
            exit;

        CommentLine.SetRange("No.", FromNumber);
        if CommentLine.FindSet() then
            repeat
                CommentLine2 := CommentLine;
                CommentLine2."No." := ToNumber;
                OnBeforeCopyCommentsOnBeforeInsert(CommentLine2, CommentLine);
                CommentLine2.Insert();
            until CommentLine.Next() = 0;
    end;

    procedure CopyLineComments(FromDocumentType: Integer; ToDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20]; FromDocumentLineNo: Integer; ToDocumentLineNo: Integer)
    var
        CommentLineSource: Record "Workflow Comment Line";
        CommentLineTarget: Record "Workflow Comment Line";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCopyLineComments(
          CommentLineTarget, IsHandled, FromDocumentType, ToDocumentType, FromNumber, ToNumber, FromDocumentLineNo, ToDocumentLineNo);
        if IsHandled then
            exit;

        CommentLineSource.SetRange("No.", FromNumber);
        if CommentLineSource.FindSet() then
            repeat
                CommentLineTarget := CommentLineSource;
                CommentLineTarget."No." := ToNumber;
                CommentLineTarget.Insert();
            until CommentLineSource.Next() = 0;
    end;

    procedure CopyHeaderComments(FromDocumentType: Integer; ToDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20])
    var
        CommentLineSource: Record "Workflow Comment Line";
        CommentLineTarget: Record "Workflow Comment Line";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCopyHeaderComments(CommentLineTarget, IsHandled, FromDocumentType, ToDocumentType, FromNumber, ToNumber);
        if IsHandled then
            exit;

        CommentLineSource.SetRange("No.", FromNumber);
        if CommentLineSource.FindSet() then
            repeat
                CommentLineTarget := CommentLineSource;
                CommentLineTarget."No." := ToNumber;
                CommentLineTarget.Insert();
            until CommentLineSource.Next() = 0;
    end;

    procedure DeleteComments(DocType: Option; No: Code[20])
    begin
        SetRange("No.", No);
        if not IsEmpty() then
            DeleteAll();
    end;

    procedure ShowComments(DocType: Option; No: Code[20]; DocLineNo: Integer)
    var
        CommentSheet: Page "Workflow Comment Sheet";
    begin
        SetRange("No.", No);
        Clear(CommentSheet);
        CommentSheet.SetTableView(Rec);
        CommentSheet.RunModal();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetUpNewLine(var CommentLineRec: Record "Workflow Comment Line"; var CommentLineFilter: Record "Workflow Comment Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCopyComments(var CommentLine: Record "Workflow Comment Line"; ToDocumentType: Integer; var IsHandled: Boolean; FromDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCopyLineComments(var CommentLine: Record "Workflow Comment Line"; var IsHandled: Boolean; FromDocumentType: Integer; ToDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20]; FromDocumentLineNo: Integer; ToDocumentLine: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCopyHeaderComments(var CommentLine: Record "Workflow Comment Line"; var IsHandled: Boolean; FromDocumentType: Integer; ToDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCopyCommentsOnBeforeInsert(var NewCommentLine: Record "Workflow Comment Line"; OldCommentLine: Record "Workflow Comment Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnSetUpNewLineOnAfterSetFilter(var CommentLineRec: Record "Workflow Comment Line"; var CommentLineFilter: Record "Workflow Comment Line")
    begin
    end;
}

