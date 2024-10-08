table 50044 "Situation Comment Line"
{
    Caption = ' Situation Comment Line';
    DrillDownPageID = "Situation Comment List";
    LookupPageID = "Situation Comment List";
    DataClassification = CustomerContent;

    fields
    {
        field(2; "Situation Entry No."; Code[20])
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
        field(8; "Object No."; Integer)
        {
            Caption = 'Object No.';
        }
        field(9; "Object Name"; Text[100])
        {
            Caption = 'Object Name';
        }
        field(10; "Track No."; Code[10])
        {
            Caption = 'Track No.';
        }
        field(11; "Vehicle Type"; enum "Vehicle Type")
        {
            Caption = 'Vehicle Type';
        }
        field(12; "Vehicle No."; code[20])
        {
            Caption = 'Vehicle No.';
        }
    }

    keys
    {
        key(Key1; "Situation Entry No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure SetUpNewLine()
    var
        CommentLine: Record "Situation Comment Line";
    begin
        CommentLine.SetRange("Situation Entry No.", "Situation Entry No.");
        if not CommentLine.FindFirst() then begin
            Date := WorkDate();
            Time := dt2time(CurrentDateTime);
        end;

        OnAfterSetUpNewLine(Rec, CommentLine);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetUpNewLine(var CommentLineRec: Record "Situation Comment Line"; var CommentLineFilter: Record "Situation Comment Line")
    begin
    end;
}

