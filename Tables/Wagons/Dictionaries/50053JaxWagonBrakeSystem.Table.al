/// <summary>
/// System hamulca wagonu
/// </summary>
table 50053 "Wagon Brake System"
{
    Caption = 'Wagon Brake System';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Wagon Brake Systems";
    LookupPageID = "Wagon Brake Systems";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[10])
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