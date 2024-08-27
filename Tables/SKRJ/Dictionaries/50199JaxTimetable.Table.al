/// <summary>
/// Rozklady jazdy
/// </summary>
table 50199 Timetable
{
    Caption = 'Timetable';
    DataCaptionFields = Code;
    DrillDownPageID = "Timetable List";
    LookupPageID = "Timetable List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';

        }
        field(3; Year; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Year';
        }

        field(4; "Date From"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date From';
        }

        field(5; "Date To"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date To';
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