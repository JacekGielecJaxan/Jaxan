/// <summary>
/// ECM
/// </summary>
table 50219 "Wagon ECM"
{
    Caption = 'Wagon ECM';
    DataCaptionFields = "Code", Name;
    DrillDownPageID = "Wagon ECM List";
    LookupPageID = "Wagon ECM List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(3; "Vendor No."; code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(4; "In Group"; Boolean)
        {
            Caption = 'In Group';
        }
    }

    keys
    {
        key(Key1; Code)
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