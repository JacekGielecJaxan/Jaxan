/// <summary>
/// Zapisy zalegania wagonow
/// </summary>
table 50036 "Wagon Exclusion Entry"
{
    Caption = 'Wagon Exclusion Entry';
    DrillDownPageID = "Wagon Exclusion Entries";
    LookupPageID = "Wagon Exclusion Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
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
        field(5; Time; Time)
        {
            Caption = 'Time';
        }
        field(6; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(7; "Number of Faults"; Integer)
        {
            Caption = 'Number of Faults';
            FieldClass = FlowField;
            //TODO: dopisac kalkulacje ilosc usterek ze zgłoszenia
        }
        field(9; "Status Grooup Code"; Code[10])
        {
            Caption = 'Status Group Code';
            TableRelation = "Wagon Status Group";
        }
        field(10; "Status Code"; code[10])
        {
            Caption = 'Status Code';
            TableRelation = "Wagon Status";
        }
        field(11; "Train No."; code[10])
        {
            Caption = 'Train No.';

        }
        field(12; "Exclusion Date"; Date)
        {
            Caption = 'Exclusion Date';
        }
        field(13; "Exclusion Time"; Time)
        {
            Caption = 'Exclusion Date';
        }
        field(14; "Exclusion User Id"; code[50])
        {
            Caption = 'Exclusion User Id';
        }
        field(15; "Exclusion Place"; Text[100])
        {
            Caption = 'Exclusion Place';
        }
        field(16; "Station Code"; code[20])
        {
            Caption = 'Station Code';
        }
        field(17; "Track No."; code[10])
        {
            Caption = 'Track No.';
        }
        //firma wynajmujaca
        field(18; "Leasing Company Code"; code[20])
        {
            Caption = 'Leasing Company Code';
        }
        //z wahadla
        field(19; "Job No."; code[20])
        {
            Caption = 'Job No.';
            TableRelation = job;
        }
        //z wahadla
        field(20; "Job Task No."; code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task";
        }
        //rozliczeniowa data wyłączenia
        field(21; "Billing Cut-Off Date"; Date)
        {
            Caption = 'Billing Cut-Off Date';
        }
        //prozny
        field(22; Empty; Boolean)
        {
            Caption = 'Empty';
        }
        // nr dokumentu zgloszenia usterek
        field(23; "Document No."; code[20])
        {
            Caption = 'Document No.';
            //TODO: dopisac relacje do zgloszen usterek
        }
        //otwarty. przyz gloszeniu zalegania domyslnie ustawiane na true po likwidacji zalegania odznaczane na false
        field(24; Open; boolean)
        {
            Caption = 'Open';
        }
        //data zamkniecia
        field(25; "Closed Date"; Date)
        {
            Caption = 'Closed Date';
        }
        //czas zamkniecia
        field(26; "Closed Time"; Time)
        {
            Caption = 'Closed Time';
        }
        field(27; "Billing Date of Inclusion"; Date)
        {
            Caption = 'Billing Date of Inclusion';
        }
        //liczba wagonodob
        field(28; "Days"; Integer)
        {
            Caption = 'Days';
        }

        //liczba wagonodob rozliczeniowych
        field(29; "Billing Days"; Integer)
        {
            Caption = 'Billing Days';
        }
        //nr przywrocenia
        field(30; "Restoration No."; code[50])
        {
            Caption = 'Restoration No.';
        }
        //nr dopuszczenia
        field(31; "Admission No."; code[50])
        {
            Caption = 'Admission No.';
        }
        field(505; Latitude; Integer)
        {
            Caption = 'Latitude';
        }
        field(506; Longitude; Integer)
        {
            Caption = 'Longitude';
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

}