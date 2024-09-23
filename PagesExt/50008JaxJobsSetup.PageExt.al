pageextension 50008 "Jobs Setup Ext" extends "Jobs Setup"
{
    layout
    {
        addafter(General)
        {
            group(Periodicity)
            {
                field("Def. No. Days For Shuttle"; rec."Def. No. Days For Shuttle")
                {
                    ApplicationArea = basic, suite, jobs;
                }
                field("Default Start Hour"; rec."Default Start Hour")
                {
                    ApplicationArea = basic, suite, jobs;
                }
            }
        }
        addafter("Job Nos.")
        {
            field("Job Task Serie No. Suffix"; rec."Job Task Serie No. Suffix")
            {
                ApplicationArea = jobs;
            }
        }
    }
}