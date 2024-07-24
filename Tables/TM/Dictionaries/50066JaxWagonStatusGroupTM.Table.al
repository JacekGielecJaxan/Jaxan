/// <summary>
/// Grupy statusow wagonow dla TM
/// Slownik ten wykorzystywany jest w glownej tablei "50009JaxWagonStatus"
/// </summary>
table 50066 "Wagon Status Group TM"
{
    Caption = 'Wagon Status Group TM';
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Wagon Status Groups TM";
    LookupPageID = "Wagon Status Groups TM";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; Description; Text[100])
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