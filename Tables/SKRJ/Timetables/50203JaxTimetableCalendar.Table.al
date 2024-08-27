table 50203 "Timetable Calendar"
{
    Caption = 'Timetable Calendar';
    DataCaptionFields = "Timetable Code", "Order No.";
    DrillDownPageID = "Timetable Calendars";
    LookupPageID = "Timetable Calendars";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Timetable Code"; code[9])
        {
            Caption = 'Timetable Code';
            TableRelation = Timetable;
            Editable = false;

        }
        field(2; "Order No."; Integer)
        {
            Caption = 'Order No.';
            Editable = false;

        }
        field(3; "Train No."; code[10])
        {
            Caption = 'Train No.';
            Editable = false;
        }
        field(4; MC00; integer)
        {
            Caption = 'MC00';
            Editable = false;
        }
        field(5; MC01; integer)
        {
            Caption = 'MC01';
            Editable = false;
        }
        field(6; MC02; integer)
        {
            Caption = 'MC02';
            Editable = false;
        }
        field(7; MC03; integer)
        {
            Caption = 'MC03';
            Editable = false;
        }
        field(8; MC04; integer)
        {
            Caption = 'MC04';
            Editable = false;
        }
        field(9; MC05; integer)
        {
            Caption = 'MC05';
            Editable = false;
        }
        field(10; MC06; integer)
        {
            Caption = 'MC06';
            Editable = false;
        }
        field(11; MC07; integer)
        {
            Caption = 'MC07';
            Editable = false;
        }
        field(12; MC08; integer)
        {
            Caption = 'MC08';
            Editable = false;
        }
        field(13; MC09; integer)
        {
            Caption = 'MC09';
            Editable = false;
        }
        field(14; MC10; integer)
        {
            Caption = 'MC10';
            Editable = false;
        }
        field(15; MC11; integer)
        {
            Caption = 'MC11';
            Editable = false;
        }
        field(16; MC12; integer)
        {
            Caption = 'MC12';
            Editable = false;
        }

        field(17; M00; integer)
        {
            Caption = 'M00';
            Editable = false;
        }
        field(18; M01; integer)
        {
            Caption = 'M01';
            Editable = false;
        }
        field(19; M02; integer)
        {
            Caption = 'M02';
            Editable = false;
        }
        field(20; M03; integer)
        {
            Caption = 'M03';
            Editable = false;
        }
        field(21; M04; integer)
        {
            Caption = 'M04';
            Editable = false;
        }
        field(22; M05; integer)
        {
            Caption = 'M05';
            Editable = false;
        }
        field(23; M06; integer)
        {
            Caption = 'M06';
            Editable = false;
        }
        field(24; M07; integer)
        {
            Caption = 'M07';
            Editable = false;
        }
        field(25; M08; integer)
        {
            Caption = 'M08';
            Editable = false;
        }
        field(26; M09; integer)
        {
            Caption = 'M09';
            Editable = false;
        }
        field(27; M10; integer)
        {
            Caption = 'M10';
            Editable = false;
        }
        field(28; M11; integer)
        {
            Caption = 'M11';
            Editable = false;
        }
        field(29; M12; integer)
        {
            Caption = 'M12';
            Editable = false;
        }
        field(49; Type; Integer)
        {
            Caption = 'Type';
            Editable = false;
        }
        field(50; Terms; Text[403])
        {
            Caption = 'Terms';
            Editable = false;
        }
        //Ilosc dni kursowania
        field(51; "Running Days"; Integer)
        {
            Caption = 'Running Days';
            Editable = false;
        }
        //Kalendarz aktywny
        field(52; Open; Boolean)
        {
            Caption = 'Open';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Timetable Code", "Order No.", Type)
        {
            Clustered = true;
        }
        key(Key2; "Timetable Code", "Train No.", Open) { }
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