pageextension 50009 "Contact List Ext" extends "Contact List"
{
    layout
    {
        addafter("Company Name")
        {
            field("VAT Registration No."; rec."VAT Registration No.")
            {
                ApplicationArea = all;
            }
        }
    }
}