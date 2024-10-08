/// <summary>
/// Odroczenia
/// </summary>
table 50323 "Vehicle Prorogation Entry"
{
    Caption = 'Vehicle Prorogation Entry';
    DrillDownPageID = "Vehicle Prorogation Entries";
    LookupPageID = "Vehicle Prorogation Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Date; Date)
        {
            Caption = 'Date';
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
        /// <summary>
        /// Data odroczenia
        /// </summary>
        field(4; "Prorogation Date"; Date)
        {
            Caption = 'Prorogation Date';
        }
        field(6; Description; Text[150])
        {
            Caption = 'Description';
        }
        /// <summary>
        /// Nr odroczenia
        /// </summary>
        field(7; "Prorogation No."; Text[50])
        {
            Caption = 'Prorogation No.';
        }
        /// <summary>
        /// Kod odroczenia
        /// </summary>
        field(8; "Prorogation Code"; code[20])
        {
            Caption = 'Prorogation Code';
            TableRelation = "Vehicle Prorogation";
        }

        field(9; "Prorogation Up To"; Date)
        {
            Caption = 'Prorogation Up To';
        }

        /// <summary>
        /// Organ wydający odroczenie
        /// </summary>
        field(12; "Office Issuing The Prorogation"; text[50])
        {
            Caption = 'Office Issuing The Prorogation';

        }
        /// <summary>
        /// Osoba wydająca odroczenie
        /// </summary>
        field(13; "Person Name Iss. The Prorog."; text[100])
        {
            Caption = 'Office Issuing The Prorogation';

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
        field(500; "Transaction No."; BigInteger)
        {
            Caption = 'Transaction No.';
        }
        field(501; "User ID"; code[100])
        {
            Caption = 'User Id';
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
        key(Key2; "Vehicle No.", "Prorogation Date")
        {
        }
        key(Key3; "Prorogation Date", "Vehicle No.")
        {
        }
        key(Key4; "Prorogation No.")
        {
        }
        key(key5; "Vehicle No.", Date)
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