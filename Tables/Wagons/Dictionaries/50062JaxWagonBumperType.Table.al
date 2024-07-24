/// <summary>
/// Typ zderzaka
/// </summary>
table 50062 "Wagon Bumper Type"
{
    Caption = 'Wagon Bumper Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Wagon Bumper Types";
    LookupPageID = "Wagon Bumper Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[30])
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