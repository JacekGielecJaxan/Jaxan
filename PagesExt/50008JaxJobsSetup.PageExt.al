pageextension 50008 "Jobs Setup Ext" extends "Jobs Setup"
{
    layout
    {
        addafter("Job Nos.")
        {
            field("Job Task Serie No. Suffix"; rec."Job Task Serie No. Suffix")
            {
                ApplicationArea = jobs;
            }
        }
    }
}