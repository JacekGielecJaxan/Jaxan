table 50100 "Vendor Type"
{
    Caption = 'Vendor Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vendor Types";
    LookupPageID = "Vendor Types";
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