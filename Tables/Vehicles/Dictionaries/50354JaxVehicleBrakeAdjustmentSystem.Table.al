/// <summary>
/// System nastawienia hamulca
/// </summary>
table 50354 "Vehicle Brake Adj. System"
{
    Caption = 'Vehicle Brake Adjustment System';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Vehicle Brake Adj. Systems";
    LookupPageID = "Vehicle Brake Adj. Systems";
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