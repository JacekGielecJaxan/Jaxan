/// <summary>
/// 
/// </summary>
enum 50006 "Fault Status"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "New") { Caption = 'New'; }
    value(1; "Accepted") { Caption = 'Accepted'; }
    value(2; "Reported") { Caption = 'Reported'; }
    value(3; "Fixed") { Caption = 'Fixed'; }
    value(4; "Canceled") { Caption = 'Canceled'; }
}