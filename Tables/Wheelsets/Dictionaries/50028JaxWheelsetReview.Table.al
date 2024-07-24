/// <summary>
/// Slownik przeglodow, napraw zestawow kolowych
/// </summary>
table 50028 "Wheelset Review"
{
    Caption = 'Wheelset Review';
    DataCaptionFields = Code, Description;
    LookupPageID = "Wheelset Review List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(4; Exclusion; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Exclusion';
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