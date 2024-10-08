/// <summary>
/// Swiadectwa wagonow
/// </summary>
table 50012 "Wagon Approval Entry"
{
    Caption = 'Wagon Approval Entry';
    DrillDownPageID = "Wagon Approval Entries";
    LookupPageID = "Wagon Approval Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Date; Date)
        {
            Caption = 'Date';
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
        field(4; "Approval Date"; Date)
        {
            Caption = 'Certificate Date';
        }
        field(6; Description; Text[150])
        {
            Caption = 'Description';
        }
        /// <summary>
        /// Nr dopuszczenia
        /// </summary>
        field(7; "Approval No."; Text[50])
        {
            Caption = 'Certificate No.';
        }
        /// <summary>
        /// Wazne od
        /// </summary>
        field(8; "Valid From"; date)
        {
            Caption = 'Valid From';
        }
        /// <summary>
        /// Data waznosci
        /// </summary>
        field(9; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(10; "Limit Km"; Decimal)
        {
            Caption = 'Limit Km';
        }
        field(11; "Actual Km"; Decimal)
        {
            Caption = 'Actual Km';
        }
        /// <summary>
        /// Organ wydający dopuszczenie
        /// </summary>
        field(12; "Office Issuing The Approval"; text[50])
        {
            Caption = 'Office Issuing The Approval';

        }
        /// <summary>
        /// Osoba wydająca dopuszczenie
        /// </summary>
        field(13; "Person Name Iss. The Approval"; text[50])
        {
            Caption = 'Person Issuing The Approval';

        }
        /// <summary>
        /// Status dopuszczenia
        /// </summary>
        field(14; "Status Approval"; enum "Status Approval")
        {
            Caption = 'Status Approval';

        }
        /// <summary>
        /// Osoba anulujaca
        /// </summary>
        field(15; "Person Canceling"; Text[50])
        {
            Caption = 'Person Canceling';
        }
        /// <summary>
        /// Przyczyna anulowania
        /// </summary>
        field(16; "Reason For Cancellation"; Text[150])
        {
            Caption = 'Reason For Cancellation';
        }
        field(17; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Wagon No.", "Approval Date")
        {
        }
        key(Key3; "Approval Date", "Wagon No.")
        {
        }
        key(Key4; "Approval No.")
        {
        }
        key(key5; "Wagon No.", Date)
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