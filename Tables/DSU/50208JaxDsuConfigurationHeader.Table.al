table 50208 "DSU Configuration Header"
{
    Caption = 'DSU Configuration Header';
    DataCaptionFields = "dsu code", "date from", description;
    LookupPageID = "DSU Configuration List";


    fields
    {
        field(1; "DSU Code"; Text[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = DSU;
            Caption = 'DSU Code';
        }

        field(2; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }

        field(3; "Document No."; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
        }

        field(4; "Date From"; date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date From';
        }

        field(5; "Status"; enum "DSU Configuration Status")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';

            trigger OnValidate()
            begin
                line.SetRange("DSU Code", Rec."DSU Code");
                line.SetRange("Date From", rec."Date From");

                if not line.IsEmpty() then
                    line.modifyall(Status, Rec.Status);

            end;
        }
    }

    keys
    {
        key(Key1; "DSU Code", "Date From")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        line: Record "DSU Configuration Line";

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

    procedure GetStatusStyleText() StatusStyleText: Text
    begin
        if Status = Status::Approved then
            StatusStyleText := 'Favorable'
        else
            StatusStyleText := 'Strong';

    end;
}