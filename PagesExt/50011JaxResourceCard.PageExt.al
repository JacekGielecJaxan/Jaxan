pageextension 50011 "Resource Card Ext" extends "Resource Card"
{
    layout
    {
        addafter(Name)
        {
            field(Email; Rec.Email)
            {
                ApplicationArea = Basic, Suite, Jobs;
            }
        }
        addafter("Privacy Blocked")
        {
            field(PIN; Rec.PIN)
            {
                ApplicationArea = Basic, Suite, Jobs;
                Importance = Additional;
            }

        }
    }
}