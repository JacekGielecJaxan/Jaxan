/// <summary>
/// System nastawienia hamulca
/// </summary>
table 50054 "Wagon Brake Adjustment System"
{
    Caption = 'Wagon Brake Adjustment System';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Wagon Brake Adjustment Systems";
    LookupPageID = "Wagon Brake Adjustment Systems";
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