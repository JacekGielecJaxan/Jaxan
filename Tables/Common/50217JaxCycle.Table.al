/// <summary>
/// Cykl
/// </summary>
table 50217 Cycle
{
    Caption = 'Cycle';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Cycles List";
    LookupPageID = "Cycles List";
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
        /// <summary>
        /// Formula daty np. 2M+1
        /// </summary>
        field(3; Formula; DateFormula)
        {
            Caption = 'Formula';
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