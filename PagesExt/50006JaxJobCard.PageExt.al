pageextension 50006 "Job Card Ext" extends "Job Card"
{
    layout
    {
        addafter("Search Description")
        {
            field("Def. Number of Wagons"; rec."Def. Number of Wagons")
            {
                ApplicationArea = all;
            }
        }
        modify("Sell-to Customer No.")
        {
            Visible = false;
        }
        modify("Sell-to Customer Name")
        {
            Visible = false;
        }
        modify("Sell-to")
        {
            Visible = false;
        }
    }
}