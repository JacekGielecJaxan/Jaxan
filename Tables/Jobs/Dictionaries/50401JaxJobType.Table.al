/// <summary>
/// Table Job Setup (ID 50400).
/// Rodzaje dzialan wykonywanych przez pracownikow (maszynistow/rewidentow)
/// </summary>
table 50401 "Job Type"
{
    Caption = 'Job Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Job Types";
    LookupPageID = "Job Types";
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

