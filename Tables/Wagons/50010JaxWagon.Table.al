/// <summary>
/// Wagon
/// </summary>
table 50010 Wagon
{
    Caption = 'Wagon';
    DataCaptionFields = EVN;
    DrillDownPageID = "Wagon List";
    LookupPageID = "Wagon List";
    DataClassification = CustomerContent;

    fields
    {
        //short evn
        field(1; "No."; Code[12])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';

            trigger OnValidate()
            begin
                CreateEVN("No.");
            end;
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
        /// Kod stacji na ktorej znajduje sie wagon
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
            Caption = 'Opearting Status Group Code';
            TableRelation = "Wagon Status Group";
            Editable = false;
        }
        /// <summary>
        /// Kod statusu
        /// </summary>
        field(15; "Operating Status Code"; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Operating Status Code';
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
        /// Cykl
        /// </summary>
        field(21; "Cycle"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cycle';
            BlankNumbers = BlankZero;
        }

        /// <summary>
        /// Zaklad
        /// </summary>
        field(22; "Institute Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Institute Code';
            TableRelation = Institute;
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
            TableRelation = "Wagon Brake Adjustment System";
        }

        /// <summary>
        /// Typ zaworu
        /// </summary>
        field(51; "Valve Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wagon Valve Type Code';
            TableRelation = "Wagon Valve Type";
        }

        /// <summary>
        /// Wstawka
        /// </summary>
        field(52; "Inset Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Inset Code';
            TableRelation = "Wagon Inset";
        }

        /// <summary>
        /// Wozek
        /// </summary>
        field(53; "Trolley Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Trolley Type Code';
            TableRelation = "Wagon Trolley Type";
        }

        /// <summary>
        ///Typ zestawu kolowego
        /// </summary>
        field(54; "Wheelset Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wheelset Type Code';
            TableRelation = "Wagon Wheelset Type";
        }
        /// <summary>
        ///Typ zderzaka
        /// </summary>
        field(55; "Bumper Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bumper Type Code';
            TableRelation = "Wagon Bumper Type";
        }
        /// <summary>
        /// Typ nastawiacza
        /// </summary>
        field(56; "Setter Type Code"; Code[20])
        {
            Caption = 'Setter Type Code';
            TableRelation = "Wagon Setter Type";
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
            TableRelation = "Wagon VKM";
        }
        field(101; Type; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Type';
            TableRelation = "Wagon Type";
        }
        field(102; Serie; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Serie';
            TableRelation = "Wagon serie";
        }
        field(103; Length; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Length';
            BlankNumbers = BlankZero;
        }
        /// <summary>
        /// Objetosc ładunku
        /// </summary>
        field(104; "Cargo Volume"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cargo Volume';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Powierzchnia ladowna
        /// </summary>
        field(105; "Loading Area"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Loading Area';
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
        /// Masaham.Prozny
        /// </summary>
        field(108; "Mh. Empty"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mh. Empty';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Masaham.Ladowny
        /// </summary>
        field(109; "Mh. Loaded"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mh. Loaded';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Masa przestawcza
        /// </summary>
        field(110; "Shifting Mass"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Shifting Mass';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// V max prozny
        /// </summary>
        field(111; "V. Max. Empty"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'V. Max. Empty';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// V max ladowny
        /// </summary>
        field(112; "V. Max. Loaded"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'V. Max. Loaded';
            BlankNumbers = BlankZero;

        }
        field(113; "A"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'A';
            BlankNumbers = BlankZero;

        }
        field(114; "B1"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'B1';
            BlankNumbers = BlankZero;

        }
        field(115; "B2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'B2';
            BlankNumbers = BlankZero;

        }
        field(116; "C2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'C2';
            BlankNumbers = BlankZero;

        }
        field(117; "C3"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'C3';
            BlankNumbers = BlankZero;

        }
        field(118; "C4"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'C4';
            BlankNumbers = BlankZero;

        }
        field(119; "D2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'D2';
            BlankNumbers = BlankZero;

        }
        field(120; "D3"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'D3';
            BlankNumbers = BlankZero;

        }
        field(121; "D4"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'D4';
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

    /// <summary>
    /// CreateEVN. Utworzenie EVN na podstawie wprowadzonego nr pojazdu
    /// </summary>
    local procedure CreateEVN(no: Code[12])
    begin
        if "No." = '' then
            exit;

        EVN := CopyStr("No.", 1, 2) + ' ' + CopyStr("No.", 3, 2) + ' ' + CopyStr("No.", 5, 4) + ' ' + CopyStr("No.", 9, 3) + '-' + CopyStr("No.", 12, 1);
    end;

}