/// <summary>
/// Zalaczniki zgloszonych usterek wagonow
/// </summary>
table 50318 "Vehicle Fault Attachment Entry"
{
    Caption = 'Vehicle Fault Attachment Entry';
    DrillDownPageID = "Vehicle Fault Att. Entries";
    LookupPageID = "Vehicle Fault Att. Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Vehicle No."; Code[12])
        {
            Caption = 'Vehicle No.';
            TableRelation = Vehicle;
        }

        field(3; "Vehicle No. 2"; Code[12])
        {
            Caption = 'Vehicle No. 2';
            TableRelation = Vehicle;
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
        key(Key2; "Vehicle No.")
        {
        }
    }


    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;

}