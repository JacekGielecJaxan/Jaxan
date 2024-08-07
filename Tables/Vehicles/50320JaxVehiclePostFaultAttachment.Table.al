/// <summary>
/// Zalczniki naprawionych, anulowanych usterek
/// </summary>
table 50320 "Vehicle Post Fault Attachment"
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