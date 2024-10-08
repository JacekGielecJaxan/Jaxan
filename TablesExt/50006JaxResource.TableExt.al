tableextension 50006 "Resource Ext" extends Resource
{
    fields
    {
        field(50000; "PIN"; Code[4])
        {
            Caption = 'PIN';
            FieldClass = Normal;
        }
        field(50001; "Email"; Text[250])
        {
            Caption = 'Email';
            FieldClass = Normal;
        }
    }
}