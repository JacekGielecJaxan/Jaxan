/// <summary>
/// Typ wózka
/// </summary>
table 50351 "Vehicle Trolley Type"
{
    Caption = 'Vehicle Trolley Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Trolley Types";
    LookupPageID = "Vehicle Trolley Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
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