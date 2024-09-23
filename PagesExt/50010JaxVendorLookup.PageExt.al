pageextension 50010 "Vendor Lookup Ext" extends "Vendor Lookup"
{
    layout
    {
        addafter("Name")
        {
            field("VAT Registration No."; rec."VAT Registration No.")
            {
                ApplicationArea = all;
            }
        }
    }
}