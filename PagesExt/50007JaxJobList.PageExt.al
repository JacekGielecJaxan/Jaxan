pageextension 50007 "Job List Ext" extends "Job List"
{
    layout
    {
        addafter(Description)
        {
            field("Def. Number of Wagons"; rec."Def. Number of Wagons")
            {
                ApplicationArea = all;
            }
            field("Schedule (Vehicle Type)"; rec."Schedule (Vehicle Type)")
            {
                ApplicationArea = all;
            }
            field("Schedule (Number of Wagons)"; rec."Schedule (Number of Wagons)")
            {
                ApplicationArea = all;
            }
            field("Usage (Vehicle Type)"; rec."Usage (Vehicle Type)")
            {
                ApplicationArea = all;
            }
            field("Usage (Number of Wagons)"; rec."Usage (Number of Wagons)")
            {
                ApplicationArea = all;
            }
            field("Object Name From"; rec."Object Name From")
            {
                ApplicationArea = all;
            }
            field("Object Name To"; rec."Object Name To")
            {
                ApplicationArea = all;
            }
            field("Jax Ship-to Code"; rec."Jax Ship-to Code")
            {
                ApplicationArea = all;
            }
        }
        modify("bill-to Customer No.")
        {
            Visible = false;
        }
    }
}