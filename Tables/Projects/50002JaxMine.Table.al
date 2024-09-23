/// <summary>
/// Table Mine (ID 50002).
/// Kopalnie
/// </summary>
table 50002 "Mine"
{
    Caption = 'Mine';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Mine List";
    LookupPageID = "Mine List";
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

