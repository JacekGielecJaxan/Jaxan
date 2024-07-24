/// <summary>
/// Slownik przeglodow, napraw wagonow
/// </summary>
table 50055 "Wagon Review"
{
    Caption = 'Wagon Review';
    DataCaptionFields = Code, Description;
    LookupPageID = "Wagon Review List";
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
        field(3; "Review Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Review Group Code';
            TableRelation = "Wagon Review Group";
        }
        field(4; Exclusion; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Exclusion';
        }
        field(5; Level; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Level';
        }
        field(14; "Status 1"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status 1';
            TableRelation = "Wagon Status Group";
        }
        field(15; "Status 2"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status 2';
            TableRelation = "Wagon Status";

            //TODO: oprogramowac przy zalozeniu ze podany jest status 1 badz nie
            trigger OnLookup()
            begin

            end;
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