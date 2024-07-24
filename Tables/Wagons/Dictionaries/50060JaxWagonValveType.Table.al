/// <summary>
/// Typ zaworu
/// </summary>
table 50060 "Wagon Valve Type"
{
    Caption = 'Wagon Valve Type';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Wagon Valve Types";
    LookupPageID = "Wagon Valve Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
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