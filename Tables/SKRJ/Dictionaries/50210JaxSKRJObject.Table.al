/// <summary>
/// Obiekty SKRJ (stacje)
/// </summary>
table 50210 "SKRJ Object"
{
    Caption = 'SKRJ Object';
    DataCaptionFields = "No.", "Short Name";
    DrillDownPageID = "SKRJ Object List";
    LookupPageID = "SKRJ Object List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
        }

        field(2; Name; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';

        }
        field(3; "Short Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Short Name';
        }

        field(4; "Object Type"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Object Type';
        }
        field(6; "Important For Freight Traffic"; Boolean)
        {
            Caption = 'Important For Freight Traffic';
        }
        /// <summary>
        /// Mozliwe uruchomienie pociagu towarowego
        /// </summary>
        field(7; "Poss. Start Of A Freight Train"; Boolean)
        {
            Caption = 'Poss. Start Of A Freight Train';
        }
        /// <summary>
        /// Mozliwe zakonczenie biegu pociagu
        /// </summary>
        field(8; "Poss. End Of Freight Train Run"; Boolean)
        {
            Caption = 'Poss. End Of Freight Train Run';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Short Name")
        {
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