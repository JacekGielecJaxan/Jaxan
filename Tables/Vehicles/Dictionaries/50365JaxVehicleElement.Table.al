table 50365 "Vehicle Element"
{
    Caption = 'Vehicle Elements';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Elements";
    LookupPageID = "Vehicle Elements";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }

        field(2; Name; Text[100])
        {
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