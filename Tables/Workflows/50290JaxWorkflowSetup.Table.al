table 50290 "Workflow Setup"
{
    Caption = 'Workflow Setup';
    DrillDownPageID = "Workflow Setup";
    LookupPageID = "Workflow Setup";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        //Centrum kompetencyjne wymagane
        field(2; "Respons. Center Mandatory"; Boolean)
        {
            Caption = 'Responsibility Center Mandatory';
        }
        field(3; "Description Mandatory"; Boolean)
        {
            Caption = 'Description Mandatory';
        }
        field(12; "Workflow Nos."; Code[20])
        {
            Caption = 'Workflow Nos.';
            TableRelation = "No. Series";
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

