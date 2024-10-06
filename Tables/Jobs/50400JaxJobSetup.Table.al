/// <summary>
/// Table Job Setup (ID 50400).
/// Ustawienia pracy w kontekscie wykonywanych zadan przez pracownikow
/// </summary>
table 50400 "Job Setup"
{
    Caption = 'Job Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        /// <summary>
        /// Prefix numeracji wykazu
        /// </summary>
        field(2; "Work Register Prefix"; code[5])
        {
            Caption = 'Work Register Prefix';
        }
        field(9; "Work Register Nos."; Code[20])
        {
            Caption = 'Work Register Nos.';
            TableRelation = "No. Series";
        }

        /// <summary>
        /// Czas proby w minutach
        /// </summary>
        field(10; "Test Time"; Duration)
        {
            Caption = 'Test Time';
        }
        /// <summary>
        /// Czas proby uproszczonej
        /// </summary>
        field(11; "Simplified Test Time"; Duration)
        {
            Caption = 'Simplified Test Time';
        }
        field(12; "Default Work Time"; Duration)
        {
            Caption = 'Default Work Time';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
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

