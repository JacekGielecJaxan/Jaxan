enum 50016 "Job Task Status"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "New") { Caption = 'New'; }
    //do realizacji
    value(1; "To Be Implemented") { Caption = 'To Be Implemented'; }
    /// <summary>
    /// zaplanowane
    /// </summary>
    value(2; "Scheduled") { Caption = 'Scheduled'; }
    value(3; "In Progress") { Caption = 'In Progress'; }
    value(4; Finished) { Caption = 'Finished'; }
    value(5; Canceled) { Caption = 'Canceled'; }
    value(6; Invoiced) { Caption = 'Invoiced'; }
}