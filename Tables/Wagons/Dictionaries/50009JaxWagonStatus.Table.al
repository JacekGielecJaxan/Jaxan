/// <summary>
/// Slownik statusow wagonow
/// </summary>
table 50009 "Wagon Status"
{
    Caption = 'Wagon Status';
    DataCaptionFields = "Code", Descripiton;
    DrillDownPageID = "Wagon Status List";
    LookupPageID = "Wagon Status List";
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
        /// <summary>
        /// Status ujmowany w sytuacji wagonowej.
        /// </summary>
        field(3; "Wagon Situation"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Wagon Situation';
        }
        /// <summary>
        /// Status wskazujacy na wylaczenie wagonu.
        /// </summary>
        field(4; Exclusion; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Exclusion';
        }
        /// <summary>
        /// Status wskazujacy ze wagon jest eksploatowany.
        /// </summary>
        field(5; Work; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Work';
        }
        /// <summary>
        /// Grupa statusu
        /// </summary>
        field(6; "Group Code"; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Group Code';
            TableRelation = "Wagon Status Group";
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