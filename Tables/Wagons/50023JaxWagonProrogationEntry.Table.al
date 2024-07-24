/// <summary>
/// Odroczenia
/// </summary>
table 50023 "Wagon Prorogation Entry"
{
    Caption = 'Wagon Prorogation Entry';
    DrillDownPageID = "Wagon Prorogation Entries";
    LookupPageID = "Wagon Prorogation Entries";
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
            TableRelation = "Wagon Prorogation";
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
        key(Key2; "Wagon No.", "Prorogation Date")
        {
        }
        key(Key3; "Prorogation Date", "Wagon No.")
        {
        }
        key(Key4; "Prorogation No.")
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

}