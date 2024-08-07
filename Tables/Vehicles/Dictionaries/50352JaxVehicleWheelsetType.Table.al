/// <summary>
/// Typy zestawow kolowych wagonow
/// </summary>
table 50352 "Vehicle Wheelset Type"
{
    Caption = 'Vehicle Wheelset Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Wheelset Types";
    LookupPageID = "Vehicle Wheelset Types";
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