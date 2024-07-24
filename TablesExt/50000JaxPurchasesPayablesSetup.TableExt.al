tableextension 50000 "Purchases & Payables Setup Ext" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "Contract Nos."; code[20])
        {
            Caption = 'Contract Nos.';
            TableRelation = "No. Series";
        }
    }
}