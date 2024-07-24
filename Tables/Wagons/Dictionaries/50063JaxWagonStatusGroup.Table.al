/// <summary>
/// Slownik statusow wagonow
/// </summary>
table 50063 "Wagon Status Group"
{
    Caption = 'Wagon Status Group';
    DataCaptionFields = "Code", Descripiton;
    DrillDownPageID = "Wagon Status Groups";
    LookupPageID = "Wagon Status Groups";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Descripiton; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
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