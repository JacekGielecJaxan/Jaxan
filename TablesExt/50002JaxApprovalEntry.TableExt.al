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
    }
}