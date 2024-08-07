/// <summary>
/// Slownik usterek wagonow
/// </summary>
table 50364 "Vehicle Fault"
{
    Caption = 'Vehicle Faults';
    DataCaptionFields = "Code", Anomaly;
    DrillDownPageID = "Vehicle Fault List";
    LookupPageID = "Vehicle Fault List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Element Code"; code[20])
        {
            Caption = 'Element Code';
            TableRelation = "Vehicle Element";
        }
        field(2; Code; Code[10])
        {
            Caption = 'Code';
        }
        field(3; "Short Description"; Text[200])
        {
            Caption = 'Short Description';
        }
        field(4; Anomaly; Text[500])
        {
            Caption = 'Anomaly';
        }
        field(5; "Criteria"; Text[100])
        {
            Caption = 'Criteria';
        }
        /// <summary>
        /// Wskazowki.
        /// </summary>
        field(6; Tips; text[250])
        {
            Caption = 'Tips';
        }
        /// <summary>
        /// Postepowanie.
        /// </summary>
        field(7; "Procedure Text"; text[250])
        {
            Caption = 'Procedure Text';
        }
        /// <summary>
        /// Klasa bledu
        /// </summary>
        field(8; "Error Class"; Integer)
        {
            Caption = 'Error Class';
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