tableextension 50005 "Jobs Setup Ext" extends "Jobs Setup"
{
    fields
    {
        //suffix serii numeracji do zadan
        field(50000; "Job Task Serie No. Suffix"; code[10])
        {
            Caption = 'Job Task Serie No. Suffix';
        }
        /// <summary>
        /// Domysla ilosc dni dla wahadla
        /// </summary>
        field(50001; "Def. No. Days For Shuttle"; DateFormula)
        {
            Caption = 'Def. No. Days For Shuttle';
        }
        /// <summary>
        /// Domysla godzina rozpoczecia pracy wahadla
        /// </summary>
        field(50002; "Default Start Hour"; Time)
        {
            Caption = 'Default Start Hour';
        }
        /// <summary>
        /// Domysla ilosc wagonow dla wahadla
        /// </summary>
        field(50003; "Def. Number of Wagons"; Integer)
        {
            Caption = 'Def. Number of Wagons';
        }
    }
}