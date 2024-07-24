/// <summary>
/// Typ pojazdu
/// </summary>
table 50150 "Traction Vehicle Type"
{
    Caption = 'Traction Vehicle Types';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Traction Vehicle Types";
    LookupPageID = "Traction Vehicle Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[10])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Name; Text[100])
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