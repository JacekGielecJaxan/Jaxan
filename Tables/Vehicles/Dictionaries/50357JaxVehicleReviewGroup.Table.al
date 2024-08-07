/// <summary>
/// Slownik przeglodow, napraw wagonow
/// </summary>
table 50357 "Vehicle Review Group"
{
    Caption = 'Vehicle Review Group';
    DataCaptionFields = Code, Description;
    LookupPageID = "Vehicle Review Group List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }
}