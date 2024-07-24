table 50207 "DSU Wagon Type"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "DSU Code"; Text[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = DSU;
        }

        field(2; "Code"; Text[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Wagon Type";
        }
    }

    keys
    {
        key(Key1; "DSU Code", Code)
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