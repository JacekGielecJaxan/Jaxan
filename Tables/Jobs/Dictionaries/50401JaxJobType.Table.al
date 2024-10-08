/// <summary>
/// Table Job Type (ID 50401).
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
        /// <summary>
        /// Wymagany wykaz. Gdy zostanie wybrany kod z ta wymagalnoscia system sprawdzi czy istnieje juz na dany dzien wykaz,
        /// jezeli wykazu nie bedzie zostanie utworzony z odpowiednia data rozpoczecia
        /// </summary>
        field(3; "Work Register Mandatory"; Boolean)
        {
            Caption = 'Work Register Mandatory';
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

