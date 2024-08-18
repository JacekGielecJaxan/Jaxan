/// <summary>
/// Zapisy przyjec i zdan pojazdow
/// </summary>
table 50324 "R/D Vehicle Entry"
{
    Caption = 'Receipt and Delivery Vehicle Entry';
    DrillDownPageID = "R/D Vehicle Entries";
    LookupPageID = "R/D Vehicle Entries";
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


}