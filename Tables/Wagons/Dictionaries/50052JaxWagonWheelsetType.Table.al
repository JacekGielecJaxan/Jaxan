/// <summary>
/// Typy zestawow kolowych wagonow
/// </summary>
table 50052 "Wagon Wheelset Type"
{
    Caption = 'Wagon Wheelset Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Wagon Wheelset Types";
    LookupPageID = "Wagon Wheelset Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[20])
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