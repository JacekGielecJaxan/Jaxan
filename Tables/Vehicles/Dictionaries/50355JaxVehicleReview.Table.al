/// <summary>
/// Slownik przeglodow, napraw wagonow
/// </summary>
table 50355 "Vehicle Review"
{
    Caption = 'Vehicle Review';
    DataCaptionFields = Code, Description;
    LookupPageID = "Vehicle Review List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(3; "Review Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Review Group Code';
            TableRelation = "Vehicle Review Group";
        }
        field(4; Exclusion; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Exclusion';
        }
        field(5; Level; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Level';
        }
        field(14; "Status 1"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status 1';
            TableRelation = "Vehicle Status Group";
        }
        field(15; "Status 2"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status 2';
            TableRelation = "Vehicle Status";

            //TODO: oprogramowac przy zalozeniu ze podany jest status 1 badz nie
            trigger OnLookup()
            begin

            end;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
}