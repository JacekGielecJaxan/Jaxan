pageextension 50003 "Task Lines Subform Ext" extends "Job Task Lines Subform"
{
    layout
    {
        addafter(Description)
        {
            // Na potrzeby modułu Planning
            field("Shuttle Start Date"; Rec.GetShuttleStartDateTime())
            {
                ApplicationArea = Basic, Suite, Jobs;
                ToolTip = 'Specifies the start date for the shuttle';
            }
            // Na potrzeby modułu Planning
            field("Shuttle End Date"; Rec.GetShuttleEndDateTime())
            {
                ApplicationArea = Basic, Suite, Jobs;
                ToolTip = 'Specifies the end date for the shuttle';
            }
            field("Contract (Vehicle Type)"; rec."Contract (Vehicle Type)")
            {
                ApplicationArea = basic, suite, jobs;
            }
            field("Contract (Number of Wagons)"; rec."Contract (Number of Wagons)")
            {
                ApplicationArea = basic, suite, jobs;
            }
            field("Schedule (Vehicle Type)"; rec."Schedule (Vehicle Type)")
            {
                ApplicationArea = basic, suite, jobs;
            }
            field("Schedule (Number of Wagons)"; rec."Schedule (Number of Wagons)")
            {
                ApplicationArea = basic, suite, jobs;
            }
            field("Usage (Vehicle Type)"; rec."Usage (Vehicle Type)")
            {
                ApplicationArea = basic, suite, jobs;
            }
            field("Sell-to Customer Name"; rec."Sell-to Customer Name")
            {
                ApplicationArea = basic, suite, jobs;
            }
            field("Ship-to Code"; rec."Ship-to Code")
            {
                ApplicationArea = basic, suite, jobs;
            }

        }
        modify("Sell-to Customer No.")
        {
            Visible = true;
        }

        modify("Job Task Type")
        {
            Visible = false;
        }
        modify("Start Date")
        {
            Visible = false;
        }
        modify("End Date")
        {
            Visible = false;
        }
        modify("EAC (Total Cost)")
        {
            Visible = false;
        }
        modify("EAC (Total Price)")
        {
            Visible = false;
        }
        modify("Contract (Invoiced Cost)")
        {
            Visible = false;
        }
        modify("Contract (Invoiced Price)")
        {
            Visible = false;
        }
        modify("Contract (Total Cost)")
        {
            Visible = false;
        }
        modify("Contract (Total Price)")
        {
            Visible = false;
        }
        modify("Schedule (Total Cost)")
        {
            Visible = false;
        }
        modify("Usage (Total Cost)")
        {
            Visible = false;
        }
    }
}