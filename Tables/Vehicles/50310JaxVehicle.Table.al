/// <summary>
/// Wagon
/// </summary>
table 50310 Vehicle
{
    Caption = 'Vehicle';
    DataCaptionFields = "No.";
    DrillDownPageID = "Vehicle List";
    LookupPageID = "Vehicle List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[12])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(3; EVN; Text[16])
        {
            DataClassification = ToBeClassified;
            Caption = 'EVN';
            Editable = false;

            trigger OnValidate()
            begin

            end;
        }
        /// <summary>
        /// Nr podmiotu wynajmujacego
        /// </summary>
        field(4; "Leasing Entity No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Leasing Entity No.';

            TableRelation = Vendor;
        }
        /// <summary>
        /// Nazwa podmiotu wynajmujacego
        /// </summary>
        field(5; "Leasing Entity Name"; text[150])
        {
            Caption = 'Leasing Entity Name';

            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = Field("Leasing Entity No.")));
        }
        /// <summary>
        /// Nr projektu - wahadla
        /// </summary>
        field(6; "Job No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project No.';
            Editable = false;

            TableRelation = Job;
        }
        /// <summary>
        /// Nr zadania w projekcie
        /// </summary>
        field(7; "Job Task No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project Task No.';
            Editable = false;

            TableRelation = "Job Task";
        }
        /// <summary>
        /// Kod stacji na ktorej znajduje sie pojazd
        /// </summary>
        field(8; "Station Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Station Code';
            Editable = false;

            //TODO: Ustawic relacje do tabeli stacji
        }
        /// <summary>
        /// Tor na ktorym znajduje sie wagon
        /// </summary>
        field(9; "Track No."; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Track No.';
            Editable = false;

            //TODO: Ustawic relacje do tabeli torow
        }
        /// <summary>
        /// Na stanie
        /// </summary>
        field(10; "In Stock"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'In Stock';
            Editable = false;
        }
        /// <summary>
        /// Zablokowany
        /// </summary>
        field(11; "Blocked"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Blocked';
        }
        /// <summary>
        /// Data przyjecia
        /// </summary>
        field(12; "Receipt Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Receipt Date';
            Editable = false;
        }
        /// <summary>
        /// Data zwrotu
        /// </summary>
        field(13; "Release Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Release Date';
            Editable = false;
        }
        /// <summary>
        /// Grupa statusu
        /// </summary>
        field(14; "Operating Status Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Status Group Code';
            TableRelation = "Wagon Status Group";
            Editable = false;
        }
        /// <summary>
        /// Kod statusu
        /// </summary>
        field(15; "Operating Status Code"; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Status Code';
            TableRelation = "Wagon Status";
            Editable = false;

            //TODO: oprogramowac przy zalozeniu ze podany jest status 1 badz nie
            trigger OnLookup()
            begin

            end;
        }

        /// <summary>
        /// Status dla TM
        /// </summary>
        field(16; "Status TM Code"; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Status TM Code';
            TableRelation = "Wagon Status Group TM";
            Editable = false;

            trigger OnLookup()
            begin

            end;
        }

        /// <summary>
        /// Rok produkcji
        /// </summary>
        field(17; "Production Year"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Production Year';
        }
        /// <summary>
        /// Kod producenta
        /// </summary>
        field(18; "Producer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Producer No.';
            TableRelation = Vendor;


            trigger OnValidate()
            var
                vend: Record Vendor;
            begin
                if not vend.Get("Producer No.") then
                    clear(vend);

                "Producer Name" := vend.Name;
            end;
        }
        /// <summary>
        /// Nazwa producenta
        /// </summary>
        field(19; "Producer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Producer Name';
        }
        /// <summary>
        /// numer fabryczny
        /// </summary>
        field(20; "Serial Number"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Serial Number';
        }

        /// <summary>
        /// Przydzial serwisu
        /// </summary>
        field(22; "Service Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Institute Code';
            TableRelation = "Vehicle Service Location";
        }
        /// <summary>
        /// Numer iążący jeden wago z różnymi EVNami
        /// </summary>
        field(23; "No. 2"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. 2';

            trigger OnValidate()
            begin
                //TODO: oprogramowac aktualizacje zapisow po zmianie numeru wiazacego rozne karotteki
            end;
        }

        field(24; "DSU Code"; code[10])
        {
            Caption = 'DSU Code';
            TableRelation = DSU;
        }

        field(25; Status; enum "Wagon Status")
        {
            Caption = 'Status';
        }
        field(26; Description; text[250])
        {
            Caption = 'Description';
        }
        field(27; "Created From Template Code"; code[10])
        {
            Caption = 'Created From Template Code';
        }
        field(28; "Last Date Modified"; date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(29; "Contract No."; code[20])
        {
            Caption = 'Contract No.';
            TableRelation = "Purchase Contract Header";
        }
        field(30; "Contract Validity Date"; date)
        {
            Caption = 'Contract Validity Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Contract Header"."Due Date" where("No." = Field("Contract No.")));

        }
        /// <summary>
        /// Nr zasobu
        /// </summary>
        field(31; "Resource No."; code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource;
        }

        /// <summary>
        /// Odroczenie
        /// </summary>
        field(32; "Prorogation Code"; code[20])
        {
            Caption = 'Prorogation Code';
            TableRelation = "Wagon Prorogation";
            Editable = false;
        }

        field(33; ECM; Code[20])
        {
            Caption = 'ECM';
            TableRelation = "Wagon ECM";
        }

        field(34; "Dispatcher Code"; Code[20])
        {
            Caption = 'Dispatcher Code';
            TableRelation = Dispatcher;
        }


        /// <summary>
        /// Typ nastawiacza
        /// </summary>
        field(50; "Brake Adjustment System Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Brake Adjustment System Code';
            TableRelation = "Vehicle Brake Adj. System";
        }

        /// <summary>
        /// Typ zaworu
        /// </summary>
        field(51; "Valve Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Valve Type Code';
            TableRelation = "Vehicle Valve Type";
        }

        /// <summary>
        /// Wstawka
        /// </summary>
        field(52; "Inset Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Inset Code';
            TableRelation = "Vehicle Inset";
        }

        /// <summary>
        /// Wozek
        /// </summary>
        field(53; "Trolley Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Trolley Type Code';
            TableRelation = "Vehicle Trolley Type";
        }

        /// <summary>
        ///Typ zestawu kolowego
        /// </summary>
        field(54; "Wheelset Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wheelset Type Code';
            TableRelation = "Vehicle Wheelset Type";
        }
        /// <summary>
        ///Typ zderzaka
        /// </summary>
        field(55; "Bumper Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bumper Type Code';
            TableRelation = "Vehicle Bumper Type";
        }
        /// <summary>
        /// Typ nastawiacza
        /// </summary>
        field(56; "Setter Type Code"; Code[20])
        {
            Caption = 'Setter Type Code';
            TableRelation = "Vehicle Setter Type";
        }

        field(57; "M/L"; Enum "Vehicle M/L")
        {
            Caption = 'M/L';
        }
        field(58; "S/E"; enum "Vehicle S/E")
        {
            Caption = 'S/E';
        }
        field(59; "ETCS"; enum "Vehicle ETCS")
        {
            Caption = 'ETCS';
        }
        field(60; "GSMR"; enum "Vehicle GSMR")
        {
            Caption = 'GSMR';
        }

        field(64; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }


        field(100; VKM; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'VKM';
            TableRelation = "Vehicle VKM";
        }
        field(101; Type; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Type';
            TableRelation = "Vehicle Type";
        }
        field(102; Serie; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Serie';
            TableRelation = "Vehicle serie";
        }
        field(103; Length; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Length';
            BlankNumbers = BlankZero;
        }
        /// <summary>
        /// Masa własna
        /// </summary>
        field(106; "Own Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Own Weight';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Masaham.Postojowego
        /// </summary>
        field(107; "Mh. P"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mh. P';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// V max
        /// </summary>
        field(111; "V. Max."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'V. Max.';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Ostatnia data przegladu
        /// </summary>
        field(200; "Last Review Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Review Date';
            Editable = false;
        }
        /// <summary>
        /// Nastepna data przegladu
        /// </summary>
        field(201; "Next Review Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Next Review Date';
            Editable = false;
        }
        /// <summary>
        /// Nr dokumentu dopuszczenia
        /// </summary>
        field(202; "Approval Document No."; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Approval Document No.';
            Editable = false;
        }
        /// <summary>
        /// Zablokowane przez serwis
        /// </summary>
        field(203; "Service Blocked"; Boolean)
        {
            Caption = 'Service Blocked';
        }
        field(204; "Image"; Blob)
        {
            Caption = 'Image';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Status, "No.")
        {
        }
        key(Key3; "Operating Status Group Code", "No.")
        {
        }
        key(Key4; "Operating Status Code", "No.")
        {
        }

    }
}