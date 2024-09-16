pageextension 50003 "Task Lines Subform Ext" extends "Job Task Lines Subform"
{
    layout
    {
        addbefore("Start Date")
        {
            // Na potrzeby modułu Planning
            field("Shuttle Start Date"; Rec."Shuttle Start Date")
            {
                ApplicationArea = Basic, Suite, Jobs;
                ToolTip = 'Specifies the start date for the shuttle';
            }
            // Na potrzeby modułu Planning
            field("Shuttle End Date"; Rec."Shuttle End Date")
            {
                ApplicationArea = Basic, Suite, Jobs;
                ToolTip = 'Specifies the end date for the shuttle';
            }
        }
    }
}