pageextension 50000 "Purchases & Payables Setup Ext" extends "Purchases & Payables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Contract Nos."; Rec."Contract Nos.")
            {
                ApplicationArea = basic, suite;
            }
        }
    }


}