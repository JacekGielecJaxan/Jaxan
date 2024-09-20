/// <summary>
/// Lokalizacje serwisow
/// </summary>
table 50369 "Vehicle Service Location"
{
    Caption = 'Vehicle Service Location';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Service Locations";
    LookupPageID = "Vehicle Service Locations";
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