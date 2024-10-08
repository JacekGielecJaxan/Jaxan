/// <summary>
/// Zapisy przyjec i zdan pojazdow
/// </summary>
table 50324 "Pick And Drop Vehicle Entry"
{
    Caption = 'Pick And Drop Vehicle Entry';
    DrillDownPageID = "Pick And Drop Vehicle Entries";
    LookupPageID = "Pick And Drop Vehicle Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
        }
        field(2; "Vehicle No."; Code[12])
        {
            Caption = 'Vehicle No.';
            TableRelation = Vehicle;

            trigger OnValidate()
            var
                vehicle: Record Vehicle;
            begin
                vehicle.Get(rec."Vehicle No.");
                rec."Vehicle No. 2" := vehicle."No. 2";
            end;
        }

        field(3; "Vehicle No. 2"; Code[12])
        {
            Caption = 'Vehicle No. 2';
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; "Time"; Time)
        {
            Caption = 'Time';
        }
        //poziom paliwa
        field(6; "Fuel Level"; enum Level)
        {
            Caption = 'Fuel Level';
        }
        //czystosc kabiny
        field(7; "Cabin Cleanliness"; Boolean)
        {
            Caption = 'Cabin Cleanliness';
        }
        //czystosc przedzialu kabinowego
        field(8; "Engine Compartment Cleanliness"; Boolean)
        {
            Caption = 'Engine Compartment Cleanliness';
        }
        //Ilosc oleju silnikowego
        field(9; "Engine Oil (L)"; Integer)
        {
            Caption = 'Engine Oil (L)';
        }
        //Ilosc oleju silnikowego - rezerwa
        field(10; "Engine Oil (L) - Reserve"; Integer)
        {
            Caption = 'Engine Oil (L) - Reserve';
        }
        //Ilosc plynu chlodzacego
        field(11; "Coolant (L)"; Integer)
        {
            Caption = 'Coolant Oil (L)';
        }
        //Ilosc plynu chlodzacego - rezerwa
        field(12; "Coolant (L) - Reserve"; Integer)
        {
            Caption = 'Coolant (L) - Reserve';
        }
        //Poziom piasku w piasecznicach
        field(13; "Sand Level"; Enum Level)
        {
            Caption = 'Sand Level';
        }
        //Poziom piasku w piasecznicach - rezerwa
        field(14; "Sand Level - Reserve"; Integer)
        {
            Caption = 'Sand Level - Reserve';
        }
        //ilosc klockow hamulcowych do wymiany
        field(15; "Brake Pads To Be Replaced"; Integer)
        {
            Caption = 'Brake Pads To Be Replaced';
        }
        //stan obreczy
        field(16; "Rim Condition"; enum "Component Condition")
        {
            Caption = 'Component Condition';
        }
        //przesuniecie paskow na obreczach
        field(17; "Belt Shift On Rims"; Boolean)
        {
            Caption = 'Belt Shift On Rims';
        }
        //luzy na zderzakach
        field(18; "Bumper Loose"; enum "Component Condition")
        {
            Caption = 'Bumper Loose';
        }
        //luzy na sprzegu
        field(19; "Coupling Loose"; Enum "Component Condition")
        {
            Caption = 'Coupling Loose';
        }
        //stan oleju na widlach wozniczych
        field(20; "Oil Level On Axle Forks"; Enum "Component Condition")
        {
            Caption = 'Oil Level On Axle Forks';
        }
        //stan oleju podpory pudla (slizgi boczne)
        field(21; "Oil Level of Body Support"; Enum "Component Condition")
        {
            Caption = 'Oil Level of Body Support (Side Slides)';
        }
        //stan oleju czopa skretu
        field(22; "Oil Level of Pivot Pin"; Enum "Component Condition")
        {
            Caption = 'Oil Level of Pivot Pin';
        }
        field(23; Open; Boolean)
        {
            Caption = 'Open';
        }
        /// <summary>
        /// Data zdania
        /// </summary>
        field(24; "Drop Date"; date)
        {
            Caption = 'Drop Date';
        }
        /// <summary>
        /// Godzina zdania
        /// </summary>
        field(25; "Drop Time"; Time)
        {
            Caption = 'Drop Time';
        }
        /// <summary>
        /// Przez kogo zdany pojazd
        /// </summary>
        field(26; "Dropped By"; Code[50])
        {
            Caption = 'Dropped By';
        }

        field(300; Type; enum "Vehicle Pick And Drop Type")
        {
            Caption = 'Type';
        }
        field(500; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(501; "User ID"; code[100])
        {
            Caption = 'User Id';
        }
        //nr karty pracy
        field(502; "Document No."; code[20])
        {
            Caption = 'Document No.';
        }
        field(503; "Station Code"; code[20])
        {
            Caption = 'Station Code';
            TableRelation = Station;
        }
        field(504; "Track No."; code[5])
        {
            Caption = 'Track No.';
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
        key(Key2; "Vehicle No.", Date)
        {
        }
        key(Key3; Date, "Vehicle No.")
        {
        }
        key(Key4; "Vehicle No. 2", Date)
        {
        }
        key(Key5; "User ID", Open, "Vehicle No.") { }
        key(Key6; "User ID", "Vehicle No.", Open, Date) { }
    }

    trigger OnInsert()
    var

    begin
        TestField(Date);
        TestField("User ID");
        TestField(Time);
        TestField("Vehicle No.");

        "Entry No." := GetLastEntryNo();

        if Type = type::Pick then begin
            if HasOpen("User ID", "Vehicle No.", Date) then
                error(Err01);
            CloseEntry();
            Open := true
        end else begin
            CloseEntry();
        end;

    end;

    var
        Err01: Label 'The vehicle is already received';



    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;

    local procedure CloseEntry()
    var
        pick: Record "Pick And Drop Vehicle Entry";

    begin
        pick.SetRange("Vehicle No.", "Vehicle No.");
        if not pick.IsEmpty then begin
            ModifyAll(open, false);
            ModifyAll("Drop Date", Date);
            ModifyAll("Drop Time", Time);
            ModifyAll("Dropped By", "User ID");
        end;
    end;

    procedure HasOpen(userid: code[50]; vehicleno: code[20]; date: date): Boolean
    var
        pick: Record "Pick And Drop Vehicle Entry";

    begin
        pick.SetCurrentKey("User ID", "Vehicle No.", Open, Date);
        pick.SetRange("User ID", userid);
        pick.SetRange("Vehicle No.", "Vehicle No.");
        pick.SetRange(Open, true);
        pick.SetRange(Date, date);
        EXIT(not pick.IsEmpty);

    end;
}