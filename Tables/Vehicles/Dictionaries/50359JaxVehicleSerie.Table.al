/// <summary>
/// Seria wagonu
/// </summary>
table 50359 "Vehicle Serie"
{
    Caption = 'Vehicle Serie';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Series";
    LookupPageID = "Vehicle Series";
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