/// <summary>
/// Wyposazenie np. apteczka, radiotelefon, gasnica
/// </summary>
table 50223 "Equipment"
{
    Caption = 'Equipment';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Equipment List";
    LookupPageID = "Equipment List";
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