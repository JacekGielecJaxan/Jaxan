tableextension 50002 "Jax Approval Entry" extends "Approval Entry"
{
    fields
    {
        field(50000; Important; Boolean)
        {
            Caption = 'Important';
        }

        field(50001; "Kind of Document"; code[20])
        {
            Caption = 'Kind of Document';
            TableRelation = "Workflow Kind of Document";
        }
        field(50002; "Buy-from Contact No."; Code[20])
        {
            Caption = 'Buy-from Contact No.';
            TableRelation = Contact;
        }
        field(50003; "Buy-from Contact Name"; Text[100])
        {
            Caption = 'Buy-from Contact Name';
        }
        field(50004; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(50005; "External Doc. No."; Code[50])
        {
            Caption = 'External Doc. No.';
        }
    }
}