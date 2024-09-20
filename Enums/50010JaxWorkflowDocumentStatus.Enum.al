enum 50010 "Workflow Document Status"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; Open) { Caption = 'Open'; }
    value(1; "Pending Approval") { Caption = 'Pending Approval'; }
    value(2; "Accepted") { Caption = 'Accepted'; }
    value(4; "Cancelled") { Caption = 'Cancelled'; }
}