/// <summary>
/// VKM
/// </summary>
table 50358 "Vehicle VKM"
{
    Caption = 'Vehicle VKM';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle VKMs";
    LookupPageID = "Vehicle VKMs";
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