pageextension 50001 "Vendor List Ext" extends "Vendor List"
{
    layout
    {

        addafter(Name)
        {
            field("VAT Registration No."; rec."VAT Registration No.")
            {
                ApplicationArea = all;
            }
        }
        addafter("Search Name")
        {
            field("Vendor Type"; Rec."Vendor Type")
            {
                ApplicationArea = all;
            }
            field("Active Contract No."; Rec."Active Contract No.")
            {
                ApplicationArea = all;
            }
            field("Contract Due Date"; Rec.GetDueDateActiveContract())
            {
                ApplicationArea = all;
            }
            field(Balance; Rec.Balance)
            {
                ApplicationArea = all;
            }
            field("Balance Due"; Rec."Balance Due")
            {
                ApplicationArea = all;
            }
        }

        modify("Location Code")
        {
            Visible = false;
        }
        modify("Balance Due (LCY)")
        {
            Visible = false;
        }
        modify("Balance (LCY)")
        {
            Visible = false;
        }
        modify("Payments (LCY)")
        {
            Visible = false;
        }
    }
}