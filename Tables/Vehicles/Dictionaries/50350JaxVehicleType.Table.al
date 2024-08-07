/// <summary>
/// Typ wagonu
/// </summary>
table 50350 "Vehicle Type"
{
    Caption = 'Wagon Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Types";
    LookupPageID = "Vehicle Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[20])
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