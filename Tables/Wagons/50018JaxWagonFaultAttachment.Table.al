/// <summary>
/// Zalaczniki zgloszonych usterek wagonow
/// </summary>
table 50018 "Wagon Fault Attachment Entry"
{
    Caption = 'Wagon Fault Attachment Entry';
    DrillDownPageID = "Wagon Fault Attachment Entries";
    LookupPageID = "Wagon Fault Attachment Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Wagon No."; Code[12])
        {
            Caption = 'Wagon No.';
            TableRelation = Wagon;
        }

        field(3; "Wagon No. 2"; Code[12])
        {
            Caption = 'Wagon No. 2';
            TableRelation = Wagon;
        }
        field(4; "File Name"; Text[50])
        {
            Caption = 'File Name';
        }
        field(9; "Fault No"; integer)
        {
            Caption = 'Fault No.';
        }
        field(10; Image; Blob)
        {
            Caption = 'Image';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Wagon No.")
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

    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;

}