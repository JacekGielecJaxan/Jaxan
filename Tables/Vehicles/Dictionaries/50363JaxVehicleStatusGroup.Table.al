/// <summary>
/// Slownik statusow wagonow
/// </summary>
table 50363 "Vehicle Status Group"
{
    Caption = 'Vehicle Status Group';
    DataCaptionFields = "Code", Descripiton;
    DrillDownPageID = "Vehicle Status Groups";
    LookupPageID = "Vehicle Status Groups";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Descripiton; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
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