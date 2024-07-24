table 50209 "DSU Configuration Line"
{
    Caption = 'DSU Configuration Line';
    DrillDownPageID = "DSU Configuration Lines";
    LookupPageID = "DSU Configuration Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "DSU Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'DSU Code';
        }

        field(2; "Date From"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date From';
        }

        field(3; Position; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Position';
        }

        field(4; Priority; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Priority';
        }

        field(5; "Review Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Review Code';
            TableRelation = "Wagon Review";

            trigger OnValidate()
            begin
                SetReviewGoupCode("Review Code");
            end;
        }

        field(6; "Review Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Review Group Code';
            TableRelation = "Wagon Review Group";
        }

        field(7; Status; enum "DSU Configuration Status")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }

        field(8; Period; enum "DSU Configuration Period")
        {
            DataClassification = ToBeClassified;
            Caption = 'Period';
        }

        field(9; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity';
        }
        field(10; "Next Position"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Next Position';
        }

        field(11; "Km Limit"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Km Limit';
        }

        field(12; "Warning Days 1"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Warning Days 1';
        }

        field(13; "Warning Days 2"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Warning Days 2';
        }

        field(14; "Warning Km"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Warning Km';
        }

        field(15; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "dsu code", "Date From", Position)
        {
            Clustered = true;
        }

        key(Key2; "dsu code", "Date From", "Review Code", Status)
        {
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        dsuconfheader: Record "DSU Configuration Header";

    trigger OnInsert()
    begin
        TestStatusOpen();
    end;

    trigger OnModify()
    begin
        TestStatusOpen;
    end;

    trigger OnDelete()
    begin
        TestStatusOpen;
    end;

    trigger OnRename()
    begin
        Error(Text001, TableCaption);
    end;

    var
        Text000: Label 'You cannot delete the order line because it is associated with purchase order %1 line %2.';
        Text001: Label 'You cannot rename a %1.';
        Text002: Label 'have to be New or In Development';

    procedure InitRec()
    begin
        GetHeader();
        Status := dsuconfheader.Status;
    end;

    procedure GetHeader()
    begin
        if not dsuconfheader.Get("dsu code", "date from") then
            exit;

    end;

    procedure TestStatusOpen()
    begin
        GetHeader();

        if (dsuconfheader.Status <> dsuconfheader.Status::New) and (dsuconfheader.Status <> dsuconfheader.Status::"In Development") then
            fielderror(Status, Text002);
    end;

    local procedure SetReviewGoupCode(code: code[10])
    var
        review: Record "Wagon Review";
    begin
        if review.get(code) then
            "Review Group Code" := review."Review Group Code";
    end;

}