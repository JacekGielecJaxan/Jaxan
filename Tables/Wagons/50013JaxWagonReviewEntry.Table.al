/// <summary>
/// Przeglady wagonow
/// </summary>
table 50013 "Wagon Review Entry"
{
    Caption = 'Wagon Km Entry';
    DrillDownPageID = "Wagon Km Entries";
    LookupPageID = "Wagon Km Entries";
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
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; "Review Code"; code[10])
        {
            Caption = 'Review Code';
            TableRelation = "Wagon Review";
        }
        field(6; "Review Group"; code[10])
        {
            Caption = 'Review Group';
            TableRelation = "Wagon Review Group";
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
        /// <summary>
        /// Kod odroczenia
        /// </summary>
        field(14; "Prorogation Code"; code[20])
        {
            Caption = 'Prorogation Code';
            TableRelation = "Wagon Prorogation";
        }
        field(15; "Term."; DateFormula)
        {
            Caption = 'Term.';
        }
        /// <summary>
        /// Data odroczenia
        /// </summary>
        field(16; "Prorogation Date"; date)
        {
            Caption = 'Prorogation Date';
        }
        /// <summary>
        /// Nr dokumentu odroczenia
        /// </summary>
        field(17; "Prorogation Doc. No."; code[50])
        {
            Caption = 'Prorogation Doc. No.';
        }
        /// <summary>
        /// Data dokumentu odroczenia
        /// </summary>
        field(18; "Prorogation Doc. Date"; code[50])
        {
            Caption = 'Prorogation Doc. Date';
        }
        field(500; "Transaction No."; BigInteger)
        {
            Caption = 'Transaction No.';
        }
        field(501; "User ID"; code[100])
        {
            Caption = 'User Id';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Wagon No.", Date)
        {
        }
        key(Key3; Date, "Wagon No.")
        {
        }
        key(Key4; "Wagon No. 2", Date)
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