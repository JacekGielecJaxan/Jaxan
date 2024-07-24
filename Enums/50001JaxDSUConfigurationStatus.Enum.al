enum 50001 "DSU Configuration Status"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "New") { Caption = 'New'; }
    value(1; "In Development") { Caption = 'In Development'; }
    value(2; "Approved") { Caption = 'Approved'; }
    value(3; "Blocked") { Caption = 'Blocked'; }
}