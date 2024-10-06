pageextension 50005 "Job Task Card Ext" extends "Job Task Card"
{
    layout
    {
        addafter(Description)
        {
            field("Contract (Vehicle Type)"; rec."Contract (Vehicle Type)")
            {
                ApplicationArea = basic, suite, jobs;
            }
            field("Contract (Number of Wagons)"; rec."Contract (Number of Wagons)")
            {
                ApplicationArea = basic, suite, jobs;
            }
            field(Status; rec.Status)
            {
                ApplicationArea = basic, suite, jobs;
            }
        }

        addafter(General)
        {
            group(Customer)
            {
                Caption = 'Customer';

            }

            group(Objects)
            {
                field("Object No. From"; rec."Object No. From")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                }
                field("Object Name From"; rec."Object Name From")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                }
                field("Object No. To"; rec."Object No. To")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                }
                field("Object Name To"; rec."Object Name To")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                }
                field("Mine Code"; rec."Mine Code")
                {
                    ApplicationArea = basic, suite, jobs;
                }
            }
            group(Dates)
            {
                // Na potrzeby modułu Planning
                field("Shuttle Start Date"; rec."Shuttle Start Date")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    ToolTip = 'Specifies the start date for the shuttle';
                }
                field("Shuttle Start Time"; rec."Shuttle Start Time")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    ToolTip = 'Specifies the start time for the shuttle';
                }

                // Na potrzeby modułu Planning
                field("Shuttle End Date"; rec."Shuttle End Date")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    ToolTip = 'Specifies the end date for the shuttle';
                }
                field("Shuttle End Time"; rec."Shuttle End Time")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    ToolTip = 'Specifies the end time for the shuttle';
                }
            }
        }

        movefirst(Customer; "Sell-to Customer No.")
        moveafter("Sell-to Customer No."; "Sell-to Customer Name")
        moveafter("Sell-to Customer Name"; "Ship-to")
        //moveafter("Ship-to"; "Ship-to Code")


        modify("Sell-to Customer No.")
        {
            Visible = true;
        }
        modify("Sell-to Customer Name")
        {
            Visible = true;
        }
        modify("Ship-to")
        {

            Visible = true;
        }
        //modify("Ship-to Code")
        //{
        //    Visible = true;
        //    Caption = 'Ship-to Code';
        //Editable = true;
        //}
        modify(Totaling)
        {
            Visible = false;
        }
        modify("New Page")
        {
            Visible = false;
        }
        modify("No. of Blank Lines")
        {
            Visible = false;
        }

        modify("Job Task Type")
        {
            Visible = false;
        }

    }

    trigger OnAfterGetCurrRecord()
    begin
        if GuiAllowed() then begin
            if rec."job task No." = '' then begin
                rec.InitJobTaskNo();
            end;
        end;
    end;



}