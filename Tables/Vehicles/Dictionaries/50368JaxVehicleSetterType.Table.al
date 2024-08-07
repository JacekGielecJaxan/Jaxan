/// <summary>
/// Typ nastawiacza
/// </summary>
table 50368 "Vehicle Setter Type"
{
    Caption = 'Vehicle Setter Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Setter Types";
    LookupPageID = "Vehicle Setter Types";
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