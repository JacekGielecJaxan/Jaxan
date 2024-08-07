/// <summary>
/// Typ zderzaka
/// </summary>
table 50362 "Vehicle Bumper Type"
{
    Caption = 'Vehicle Bumper Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Bumper Types";
    LookupPageID = "Vehicle Bumper Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[30])
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