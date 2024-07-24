table 50206 "DSU"
{
    Caption = 'DSU';
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "DSU List";
    LookupPageID = "DSU List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[10])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;

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