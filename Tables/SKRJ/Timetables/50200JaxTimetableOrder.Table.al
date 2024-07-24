table 50200 "Timetable Order"
{
    Caption = 'Timetable Order';
    DataCaptionFields = "Timetable Code", "Order No.";
    DrillDownPageID = "Timetable Order List";
    LookupPageID = "Timetable Order List";
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
        field(3; "Order Group No."; Integer)
        {
            Caption = 'Order Group No.';
            Editable = false;

        }
        field(4; "Prev. Order No."; Integer)
        {
            Caption = 'Prev. Order No.';
            Editable = false;
        }
        field(5; "Changing Parameters Order No."; Integer)
        {
            Caption = 'Changing Parameters Order No.';
            Editable = false;
        }
        field(6; "Closing Organization Cycle No."; Integer)
        {
            Caption = 'Closing Organization Cycle No.';
            Editable = false;
        }
        field(7; "Application Date"; DateTime)
        {
            Caption = 'Application Date';
            Editable = false;
        }
        field(8; "Status No."; Integer)
        {
            Caption = 'Status No.';
            Editable = false;
        }
        field(9; "Start Object No."; Integer)
        {
            Caption = 'Start Object No.';
            Editable = false;
        }
        field(10; "Start Object Pos."; Integer)
        {
            Caption = 'Start Object Pos.';
            Editable = false;
        }
        field(11; "Start Object Name"; Text[100])
        {
            Caption = 'Start Object Name';
            Editable = false;
        }
        field(12; "Departure Time"; Time)
        {
            Caption = 'Departure Time';
            Editable = false;
        }
        field(13; "Start Offset Arrival"; Integer)
        {
            Caption = 'Start Offset Arrival';
            Editable = false;
        }
        field(14; "Start Offset Departure"; Integer)
        {
            Caption = 'Start Offset Departure';
            Editable = false;
        }
        field(15; "End Object No."; Integer)
        {
            Caption = 'End Object No.';
            Editable = false;
        }
        field(16; "End Object Pos."; Integer)
        {
            Caption = 'End Object Pos.';
            Editable = false;
        }
        field(17; "End Object Name"; Text[100])
        {
            Caption = 'End Object Name';
            Editable = false;
        }
        field(18; "Arrival Time"; Time)
        {
            Caption = 'Arrival Time';
            Editable = false;
        }
        field(19; "End Offset Arrival"; Integer)
        {
            Caption = 'End Offset Arrival';
            Editable = false;
        }
        field(20; "End Offset Departure"; Integer)
        {
            Caption = 'End Offset Departure';
            Editable = false;
        }
        field(33; "International Relation"; Text[250])
        {
            Caption = 'International Relation';
            Editable = false;
        }
        field(34; "Operator No."; Integer)
        {
            Caption = 'Operator No.';
            Editable = false;
        }
        field(35; "Carrier Authorization Date"; DateTime)
        {
            Caption = 'Carrier Authorization Date';
            Editable = false;
        }
        field(36; "Carrier Authoriz. Operator No."; Integer)
        {
            Caption = 'Carrier Authorization Operator No.';
            Editable = false;
        }
        field(37; "Req. Headquarters Authoriz."; Boolean)
        {
            Caption = 'Requires Headquarters Authorization';
            Editable = false;
        }
        field(38; "Headquarters Authoriz. Date"; DateTime)
        {
            Caption = 'Headquarters Authorization Date';
            Editable = false;
        }
        field(39; "Headq. Authoriz. Operator No."; Integer)
        {
            Caption = 'Headquarters Authorization Operator No.';
            Editable = false;
        }
        field(40; "Decree No."; Text[50])
        {
            Caption = 'Decree No.';
            Editable = false;
        }
        field(41; "Timetable Decree Of"; DateTime)
        {
            Caption = 'Timetable Decree Of';
            Editable = false;
        }
        field(42; "Designer Comments"; Text[1000])
        {
Caption = 'Designer Comments';
            Editable = false;
        }
        field(43; "Rejection Reason No."; Integer)
        {
            Caption = 'Rejection Reason No.';
            Editable = false;
        }
        field(44; "Order Type Code"; Code[1])
        {
            Caption = 'Order Type Code';
            Editable = false;
        }
        field(45; "Constr. Route Approval Date"; DateTime)
        {
            Caption = 'Construction Route Approval Date';
            Editable = false;
        }
        field(46; "Applicant No."; Integer)
        {
            Caption = 'Applicant No.';
            Editable = false;
        }
        field(47; "Not Run"; Boolean)
        {
            Caption = 'Not Run';
            Editable = false;
        }
        field(48; "Approval Operator No."; Integer)
        {
            Caption = 'Approval Operator No.';
            Editable = false;
        }
        field(49; "Application Authorization Date"; DateTime)
        {
            Caption = 'Application Authorization Date';
            Editable = false;
        }
        field(50; "Rejection Operator No."; Integer)
        {
            Caption = 'Rejection Operator No.';
            Editable = false;
        }
        field(51; "Rejection Date"; DateTime)
        {
            Caption = 'Rejection Date';
            Editable = false;
        }
        field(52; "Rejection Description"; Text[1000])
        {
            Caption = 'Rejection Description';
            Editable = false;
        }
        field(53; "Traction Calculation Date"; DateTime)
        {
            Caption = 'Traction Calculation Date';
            Editable = false;
        }
        field(54; "Carrier No."; Integer)
        {
            Caption = 'Carrier No.';
            Editable = false;
        }
        field(55; "Schedule No."; Integer)
        {
            Caption = 'Schedule No.';
            Editable = false;
        }
        field(56; "Application No."; Text[50])
        {
            Caption = 'Application No.';
            Editable = false;
        }
        field(58; "Train No."; Text[20])
        {
            Caption = 'Train No.';
            Editable = false;
        }
        field(60; "Train Name"; Text[100])
        {
            Caption = 'Train Name';
            Editable = false;
        }
        field(64; Restrictions; Integer)
        {
            Caption = 'Restrictions';
            Editable = false;
        }
        /// <summary>
        /// Nr telegramu skrajniowego
        /// </summary>
        field(65; "Gauge Telegram No."; Text[50])
        {
            Caption = 'Gauge Telegram No.';
            Editable = false;
        }
        field(66; "Requires Carrier Authorization"; Boolean)
        {
            Caption = 'Requires Carrier Authorization';
            Editable = false;
        }
        field(67; "Timetable Type No."; Integer)
        {
            Caption = 'Timetable Type No.';
            Editable = false;
        }
        field(68; "Transport Type No."; Integer)
        {
            Caption = 'Transport Type No.';
            Editable = false;
        }
        field(69; "Leading Hour Pos."; Integer)
        {
            Caption = 'Leading Hour Pos.';
            Editable = false;
        }
        field(70; "Leading Hour"; Text[10])
        {
            Caption = 'Leading Hour';
            Editable = false;
        }
        field(71; "Leading Hour Description"; Text[100])
        {
            Caption = 'Leading Hour Description';
            Editable = false;
        }
        field(72; "Receiving Order Branch No."; Integer)
        {
            Caption = 'Receiving Order Branch No.';
            Editable = false;
        }
        field(73; "Leading Hour Tolerance Plus"; Integer)
        {
            Caption = 'Leading Hour Tolerance Plus';
            Editable = false;
        }
        field(74; "Leading Hour Tolerance Minus"; Integer)
        {
            Caption = 'Leading Hour Tolerance Minus';
            Editable = false;
        }
        field(75; "Stop Time Tolerance"; Integer)
        {
            Caption = 'Stop Time Tolerance';
            Editable = false;
        }
        field(76; "Wide Tracks"; Boolean)
        {
            Caption = 'Wide Tracks';
            Editable = false;
        }
        field(77; "Cargo Type No."; Integer)
        {
            Caption = 'Cargo Type No.';
            Editable = false;
        }
        field(78; "Variant"; Boolean)
        {
            Caption = 'Variant';
            Editable = false;
        }
        field(79; "Train Order No."; Integer)
        {
            Caption = 'Train Order No.';
            Editable = false;
        }
        field(80; "Email Copy Application"; Text[100])
        {
            Caption = 'Email Copy Application';
            Editable = false;
        }
        field(81; "Language Copy Application"; Text[2])
        {
            Caption = 'Language Copy Application';
            Editable = false;
        }
        field(82; "Carrier Notes"; Text[1000])
        {
            Caption = 'Carrier Notes';
            Editable = false;
        }
        field(83; "Timetable Notes"; Text[1000])
        {
            Caption = 'Timetable Notes';
            Editable = false;
        }
        field(84; "Responsible Entity No."; Integer)
        {
            Caption = 'Responsible Entity No.';
            Editable = false;
        }
        field(85; "Train Character No."; Integer)
        {
            Caption = 'Train Character No.';
            Editable = false;
        }
        field(86; "Authorizing Department Id"; Integer)
        {
            Caption = 'Authorizing Department Id';
            Editable = false;
        }
        field(87; "Schedule Unpublished"; Boolean)
        {
            Caption = 'Schedule Unpublished';
            Editable = false;
        }
        field(88; "Active"; Boolean)
        {
            Caption = 'Active';
            Editable = false;
        }
        field(89; "Operation Days"; Integer)
        {
            Caption = 'Operation Days';
            Editable = false;
        }
        field(95; "Order Vehicles"; Code[50])
        {
            Caption = 'Order Vehicles';
            Editable = false;
        }
        field(96; "Train Types"; code[50])
        {
            Caption = 'Train Types';
            Editable = false;
        }
        field(98; "Last History"; DateTime)
        {
            Caption = 'Last History';
            Editable = false;
        }
        field(200; "Job No."; Code[20])
        {
            Caption = 'Project No.';
            TableRelation = Job;
            Editable = false;
        }
        field(201; "Job Task No."; code[20])
        {
            Caption = 'Project Task No.';

            trigger OnValidate();
            var
                Job: Record Job;
                JobTask: Record "Job Task";
            begin
                JobTask.SetRange("Job Task No.", "Job Task No.");
                JobTask.FindSet();
                job.Get(JobTask."Job No.");
                Job.TestBlocked();
                "Job No." := JobTask."Job No.";
            end;
        }
    }

    keys
    {
        key(Key1; "Timetable Code", "Order No.")
        {
            Clustered = true;
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