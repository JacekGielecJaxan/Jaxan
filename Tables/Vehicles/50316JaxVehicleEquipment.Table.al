/// <summary>
/// Wyposazenie pojazdu
/// </summary>
table 50316 "Vehicle Equipment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }
}