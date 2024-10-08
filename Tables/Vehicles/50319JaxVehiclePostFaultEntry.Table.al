/// <summary>
/// Zarejestrowane, anulowane usterki wagonow
/// </summary>
table 50319 "Vehicle Post Fault Entry"
{
    Caption = 'Vehicle Post Fault Entry';
    DrillDownPageID = "Vehicle Post Fault Entries";
    LookupPageID = "Vehicle Post Fault Entries";
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
        field(4; Date; DateTime)
        {
            Caption = 'Date';
        }
        field(5; "Element Code"; code[10])
        {
            Caption = 'Element Code';
            TableRelation = "Vehicle Element";
        }
        field(6; "Fault Code"; code[10])
        {
            Caption = 'Fault Code';
            TableRelation = "Vehicle Fault";
        }
        field(7; "Short Fault Description"; text[100])
        {
            Caption = 'Short Fault Description';

        }
        field(8; "Description"; Text[500])
        {
            Caption = 'Description';
        }
        field(9; "Fault No."; integer)
        {
            Caption = 'Fault No.';
        }
        field(10; "Document No."; code[20])
        {
            Caption = 'Document No.';
        }
        field(11; "External Document No."; code[50])
        {
            Caption = 'External Document No.';
        }
        field(12; "Fault Reporting User Id"; code[50])
        {
            Caption = 'Fault Reporting User Id';
        }
        field(13; "Fault TM No."; integer)
        {
            Caption = 'Fault TM No.';
        }
        field(14; "Job No."; code[20])
        {
            Caption = 'Job No.';
            TableRelation = "job";
        }
        field(15; "Job Task No."; code[20])
        {
            Caption = 'Job Task No.';
        }
        field(16; "Train No."; Code[10])
        {
            Caption = 'Train No.';
        }
        /// <summary>
        /// Miejsce zgloszenia usterki
        /// </summary>
        field(17; "Place of Reporting the Fault"; code[50])
        {
            Caption = 'Place of Reporting the Fault';
        }
        field(18; "Latitude"; Integer)
        {
            Caption = 'Latitude';
        }
        field(19; "Longitude"; Integer)
        {
            Caption = 'Longitude';
        }
        field(20; Status; enum "Fault Status")
        {
            Caption = 'Status';
        }
        /// <summary>
        /// Osoba akceptujaca
        /// </summary>
        field(21; "Accepting User Id"; code[50])
        {
            Caption = 'Accepting User Id';
        }
        /// <summary>
        /// Data akceptacji
        /// </summary>
        field(22; "Acceptance Date"; DateTime)
        {
            Caption = 'Acceptance Date';
        }
        /// <summary>
        /// Nr zgłoszenia
        /// </summary>
        field(23; "Application No."; code[50])
        {
            Caption = 'Application No.';
        }
        /// <summary>
        /// Data zgłoszenia
        /// </summary>
        field(24; "Application Date"; DateTime)
        {
            Caption = 'Application Date';
        }
        field(25; "Company Repairing the Fault"; code[20])
        {
            Caption = 'Company Repairing the Fault';
            TableRelation = vendor;
        }

        /// <summary>
        /// Data naprawienia lub anulowania usterki
        /// </summary>
        field(26; "Date of Repair of the Fault"; Date)
        {
            Caption = 'Date of Repair of the Fault';
        }
        /// <summary>
        /// Data zgłoszenia usterki
        /// </summary>
        field(27; "Date of Reporting the Fault"; DateTime)
        {
            Caption = 'Date of Reporting the Fault';
        }
        field(28; "Way To Fix It"; Text[500])
        {
            Caption = 'Way To Fix It';
        }

    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Vehicle No.", Date)
        {
        }
        key(Key3; Date, "Vehicle No.")
        {
        }
        key(Key4; "Vehicle No. 2", Date)
        {
        }

    }

    trigger OnInsert()
    begin
        "Entry No." := GetLastEntryNo() + 1;

    end;

    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;

}