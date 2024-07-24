table 50067 "Wagon Prorogation"
{
    Caption = 'Proragation';
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Wagon Prorogation List";
    LookupPageID = "Wagon Prorogation List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }

        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Term."; DateFormula)
        {
            Caption = 'Term.';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}