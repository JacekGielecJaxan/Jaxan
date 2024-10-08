table 50046 "Readiness Decl. Comment Line"
{
    Caption = 'Readiness Decl. Comment Line';
    DrillDownPageID = "Readiness Decl. Comment List";
    LookupPageID = "Readiness Decl. Comment List";
    DataClassification = CustomerContent;

    fields
    {
        field(2; "Readiness Decl. Entry No."; Integer)
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
        field(5; Time; Time)
        {
            Caption = 'Time';
        }
        field(6; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(7; Comment; Text[200])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Readiness Decl. Entry No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure SetUpNewLine()
    var
        CommentLine: Record "Readiness Decl. Comment Line";
    begin
        CommentLine.SetRange("Readiness Decl. Entry No.", "Readiness Decl. Entry No.");
        if not CommentLine.FindFirst() then begin
            Date := WorkDate();
            Time := dt2time(CurrentDateTime);
        end;

        OnAfterSetUpNewLine(Rec, CommentLine);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetUpNewLine(var CommentLineRec: Record "Readiness Decl. Comment Line"; var CommentLineFilter: Record "Readiness Decl. Comment Line")
    begin
    end;
}

