/// <summary>
/// Work Event Group
/// Grupy zdarzen pracy
/// </summary>
table 50039 "Work Event Group"
{
    Caption = 'Work Event Group';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Work Event Groups";
    LookupPageID = "Work Event Groups";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
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

