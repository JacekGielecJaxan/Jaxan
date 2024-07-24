pageextension 50002 "Vendor Card Ext" extends "Vendor Card"
{
    layout
    {
        addafter("search name")
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

        }

    }
}