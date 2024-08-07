table 50367 "Vehicle Prorogation"
{
    Caption = 'Vehicle Proragation';
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Vehicle Prorogation List";
    LookupPageID = "Vehicle Prorogation List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }

        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Term."; DateFormula)
        {
            Caption = 'Term.';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
}