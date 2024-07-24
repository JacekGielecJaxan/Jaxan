table 50221 "Track"
{
    Caption = 'Track';
    DataCaptionFields = "Station Code", "Code", Description;
    DrillDownPageID = "Tracks List";
    LookupPageID = "Tracks List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Station Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Station Code';
            TableRelation = Station;
        }
        field(2; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(4; Info; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Info';
        }
        field(5; Length; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Length';
            BlankNumbers = BlankZero;

        }
    }

    keys
    {
        key(Key1; "station code", Code)
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