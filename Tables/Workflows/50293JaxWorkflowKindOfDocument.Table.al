/// <summary>
/// Slownik rodzajow dokumentow
/// </summary>
table 50293 "Workflow Kind of Document"
{
    Caption = 'Workflow Kind of Document';
    DataCaptionFields = "Code", Descripiton;
    DrillDownPageID = "Workflow Kind of Document List";
    LookupPageID = "Workflow Kind of Document List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Descripiton; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(3; Important; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Important';
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