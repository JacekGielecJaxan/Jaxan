/// <summary>
/// Zestaw kolowy
/// </summary>
table 50024 Wheelset
{
    Caption = 'Wheelset';
    DataCaptionFields = "No.";
    DrillDownPageID = "Wheelsets List";
    LookupPageID = "Wheelsets List";
    DataClassification = CustomerContent;

    fields
    {
        //short evn
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        /// <summary>
        /// Właściciel
        /// </summary>
        field(4; "Owner No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Owner No.';

            TableRelation = Vendor;
        }
        /// <summary>
        /// Nazwa podmiotu wynajmujacego
        /// </summary>
        field(5; "Owner Name"; text[150])
        {
            Caption = 'Owner Name';

            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = Field("Owner No.")));
        }
        /// <summary>
        /// Typ kola
        /// </summary>
        field(6; "Wheel Type"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wheel Type';

            TableRelation = "Wheel Type";
        }
        /// <summary>
        /// Typ zestawu
        /// </summary>
        field(7; "Wheelset Type"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wheelset Type';

            TableRelation = "Wheelset Type";
        }
        /// <summary>
        /// Typ maznicy
        /// </summary>
        field(8; "Axle Box Type"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Axle Box Type';

            TableRelation = "Axle Box Type";
        }
        /// <summary>
        /// Max. nacisk na oś
        /// </summary>
        field(9; "Max. Axle Load"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Max. Axle Load';
            DecimalPlaces = 0 : 2;
        }
        /// <summary>
        /// Status
        /// </summary>
        field(11; "Status"; enum "Wheelset Status")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
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
        field(21; "Cycle"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cycle';
            TableRelation = Cycle;
        }

        /// <summary>
        /// Zaklad naprawczy
        /// </summary>
        field(22; "Institute Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Institute Code';
            TableRelation = Institute;
        }
        field(24; "DSU Code"; code[10])
        {
            Caption = 'DSU Code';
            TableRelation = DSU;
        }
        field(26; Description; text[250])
        {
            Caption = 'Description';
        }
        field(28; "Last Date Modified"; date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }

        field(33; ECM; Code[20])
        {
            Caption = 'ECM';
            TableRelation = "Wagon ECM";
        }
        /// <summary>
        /// Dysponent
        /// </summary>
        field(34; "Dispatcher Code"; Code[20])
        {
            Caption = 'Dispatcher Code';
            TableRelation = Dispatcher;
        }
        /// <summary>
        /// Typ pojazdu
        /// </summary>
        field(35; "Vehicle Type"; enum "Vehicle Type")
        {
            Caption = 'Vehicle Type';

        }
        /// <summary>
        /// Producent lozysk
        /// </summary>
        field(149; "Bearing Producer No."; code[20])
        {
            Caption = 'Bearing Producer No.';
            TableRelation = Contact;
        }

        /// <summary>
        /// Pojazd na ktory zamontowano wozek
        /// </summary>
        field(150; "Vehicle No."; code[20])
        {
            Caption = 'Vehicle No.';
            //TODO: zrobic tablerelation ze wzgledu na typ pojazdu
        }
        /// <summary>
        /// Pozycja na pojezdzie
        /// </summary>
        field(151; "Position"; Integer)
        {
            Caption = 'Position';
        }
        /// <summary>
        /// Przebieg w kilometrach
        /// </summary>
        field(152; "Mileage"; Decimal)
        {
            Caption = 'Mileage (Km)';
            DecimalPlaces = 0 : 1;
        }
        /// <summary>
        /// Srednica zestawu
        /// </summary>
        field(153; "Set Diameter"; Integer)
        {
            Caption = 'Set Diameter';
        }
        /// <summary>
        /// Srednica czopu
        /// </summary>
        field(154; "Plug Diameter"; Integer)
        {
            Caption = 'Plug Diameter';
        }


        /// <summary>
        /// Kod ostatniego przegladu
        /// </summary>
        field(199; "Last Review Code"; Code[10])
        {
            Caption = 'Last Review Code';
            TableRelation = "Wheelset Review";
            Editable = false;
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
        key(key3; "Owner No.") { }
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