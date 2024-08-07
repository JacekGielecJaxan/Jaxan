/// <summary>
/// System hamulca wagonu
/// </summary>
table 50353 "Vehicle Brake System"
{
    Caption = 'Vehicle Brake System';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Brake Systems";
    LookupPageID = "Vehicle Brake Systems";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
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
}