table 50213 "SKRJ Document"
{
    Caption = 'SKRJ Document';
    DataCaptionFields = "Entry No.";
    DrillDownPageID = "SKRJ Document List";
    LookupPageID = "SKRJ Document List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            Editable = false;

        }
        field(2; "Register Entry No."; Integer)
        {
            Caption = 'Register Entry No.';
            Editable = false;

        }
        field(3; "File Name"; Text[150])
        {
            Caption = 'File Name';
            Editable = false;

        }
        field(4; Type; code[10])
        {
            caption = 'Type';
            editable = false;
        }
        //Obszar obowiazywania
        field(5; "Area Code"; code[50])
        {
            Caption = 'Area Code';
            Editable = false;

        }
        //Wazny od
        field(6; "Valid From"; Date)
        {
            Caption = 'Valid From';
            Editable = false;

        }
        field(7; Active; Boolean)
        {
            Caption = 'Active';
            Editable = false;

        }
        field(8; "Imported Date"; DateTime)
        {
            Caption = 'Imported Date';
            Editable = false;
        }
        field(9; "File Data"; Blob)
        {
            Caption = 'File Data';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
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