pageextension 50004 "Approval Entries Ext" extends "Approval Entries"
{
    layout
    {
        addafter(Overdue)
        {
            field("Kind of Document"; rec."Kind of Document")
            {
                ApplicationArea = all;
            }
            field(Important; rec.Important)
            {
                ApplicationArea = all;
            }
            field("Buy-from Contact No."; rec."Buy-from Contact No.")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Buy-from Contact Name"; rec."Buy-from Contact Name")
            {
                ApplicationArea = all;
            }
            field("External Doc. No."; rec."External Doc. No.")
            {
                ApplicationArea = all;
            }
        }

        addafter("Currency Code")
        {
            field(Amount; rec.Amount)
            {
                ApplicationArea = all;
            }
        }

        modify("Sequence No.")
        {
            Visible = false;
        }
        modify("Amount (LCY)")
        {
            Visible = false;
        }
        modify("Salespers./Purch. Code")
        {
            Visible = false;
        }
        modify("Limit Type")
        {
            Visible = false;
        }
        modify("Approval Type")
        {
            Visible = false;
        }
        modify(Details)
        {
            Visible = false;
        }
        modify("Available Credit Limit (LCY)")
        {
            Visible = false;
        }
    }
}