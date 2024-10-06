/// <summary>
/// Work Event
/// Zdarzenia pracy
/// </summary>
table 50037 "Work Event"
{
    Caption = 'Work Event';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Work Events";
    LookupPageID = "Work Events";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Work Event Group"; code[10])
        {
            Caption = 'Work Event Group';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;
}

