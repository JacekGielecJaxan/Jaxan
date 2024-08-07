/// <summary>
/// Wstawka
/// </summary>
table 50361 "Vehicle Inset"
{
    Caption = 'Vehicle Inset';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Insets";
    LookupPageID = "Vehicle Insets";
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