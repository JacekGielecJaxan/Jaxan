table 50043 "Situation Setup"
{
    Caption = 'Situation Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        /// <summary>
        /// ask about the vehicle when in a different location
        /// pytaj, gdy pojazd w innej lokalizacji
        /// </summary>
        field(2; "Ask When Veh. In a Diff. Loc."; Boolean)
        {
            Caption = 'Ask When Vehicle In Different Location';
        }
        field(3; "Ask When Wag. In a Diff. Loc."; Boolean)
        {
            Caption = 'Ask When Wagon In Different Location';
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
        Vehicle: Record Vehicle;
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;
}

