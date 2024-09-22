tableextension 50005 "Jobs Setup Ext" extends "Jobs Setup"
{
    fields
    {
        //suffix serii numeracji do zadan
        field(50000; "Job Task Serie No. Suffix"; code[10])
        {
            Caption = 'Job Task Serie No. Suffix';
        }
    }
}