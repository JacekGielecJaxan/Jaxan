table 50212 "Document Register"
{
    Caption = 'Document Register';
    DataCaptionFields = "Entry No.";
    DrillDownPageID = "Document Register";
    LookupPageID = "Document Register";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            Editable = false;

        }
        field(2; "Start Time"; DateTime)
        {
            Caption = 'Start Time';
            Editable = false;

        }
        field(3; "End Time"; Integer)
        {
            Caption = 'End Time';
            Editable = false;

        }
        field(4; Error; Boolean)
        {
            Caption = 'Error';
            Editable = false;
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