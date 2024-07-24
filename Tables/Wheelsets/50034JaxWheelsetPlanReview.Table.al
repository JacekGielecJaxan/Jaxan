/// <summary>
/// Plan przegladow zestawow
/// </summary>
table 50034 "Wheelset Plan Review Entry"
{
    Caption = 'Wheelset Km Entry';
    DrillDownPageID = "Wheelset Plan Review Entries";
    LookupPageID = "Wheelset Plan Review Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Wheelset No."; Code[12])
        {
            Caption = 'Wheelset No.';
            TableRelation = Wheelset;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; "Review Code"; code[10])
        {
            Caption = 'Review Code';
            TableRelation = "Wheelset Review";
        }
        field(7; "Planned Date"; Date)
        {
            Caption = 'Planned Date';

        }
        field(8; "Planned Km"; Decimal)
        {
            Caption = 'Planned Km';
        }
        field(9; "Actual Km"; Decimal)
        {
            Caption = 'Actual Km';
        }
        field(10; "Document No."; code[20])
        {
            Caption = 'Document No.';
        }
        /// <summary>
        /// Dokument dopuszczenia
        /// </summary>
        field(11; "Approval Document No."; code[20])
        {
            Caption = 'Approval Document No.';
        }
        field(12; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(13; "External Doc. No."; Code[50])
        {
            Caption = 'External Doc. No.';
        }
        field(50; "Wagon No."; Code[12])
        {
            Caption = 'Wagon No.';
            TableRelation = Wagon;
        }

        field(51; "Wagon No. 2"; Code[12])
        {
            Caption = 'Wagon No. 2';
            TableRelation = Wagon;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Wheelset No.", Date)
        {
        }
        key(Key3; Date, "Wheelset No.")
        {
        }
        key(Key5; "Wheelset No.", "Planned Date")
        {
        }
        key(Key6; "Wheelset No.", "Review Code")
        {
        }
        key(Key7; "Wagon No.", "Wheelset No.", Date)
        {
        }
        key(Key8; Date, "Wagon No.", "Wheelset No.")
        {
        }
        key(Key9; "Wagon No.", "Wheelset No.", "Planned Date")
        {
        }
        key(Key10; "Wagon No.", "Wheelset No.", "Review Code")
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