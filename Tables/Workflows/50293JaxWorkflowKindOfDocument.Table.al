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
        // wymagany numer odkumenty zewnetrznego
        field(4; "Ext. Document No. Mandatory"; Boolean)
        {
            Caption = 'Ext. Document No. Mandatory';
        }
        //wymagana kwota
        field(5; "Amount Mandatory"; Boolean)
        {
            Caption = 'Amount Mandatory';
        }
        //wymagany numer kontrahenta, czyli klient musi istniec w bazie
        field(6; "Contractor No. Mandatory"; Boolean)
        {
            Caption = 'Contractor No. Mandatory';
        }
        field(7; "Def. No. of Days For Approve"; DateFormula)
        {
            Caption = 'Default No. od Days To Wait For Approval';

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