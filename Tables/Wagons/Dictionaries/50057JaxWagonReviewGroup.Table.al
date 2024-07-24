/// <summary>
/// Slownik przeglodow, napraw wagonow
/// </summary>
table 50057 "Wagon Review Group"
{
    Caption = 'Wagon Review Group';
    DataCaptionFields = Code, Description;
    LookupPageID = "Wagon Review Group List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "code")
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