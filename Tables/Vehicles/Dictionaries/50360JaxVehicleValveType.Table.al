/// <summary>
/// Typ zaworu
/// </summary>
table 50360 "Vehicle Valve Type"
{
    Caption = 'Vehicle Valve Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Valve Types";
    LookupPageID = "Vehicle Valve Types";
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