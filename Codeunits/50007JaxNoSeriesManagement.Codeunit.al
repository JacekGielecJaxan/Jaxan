codeunit 50007 "Jax NoSeriesManagement"
{
    trigger OnRun()
    begin

    end;
    /// <summary>
    /// AddNewSeries.
    /// Gdy jest dopisywane pierwsze zadanie do projektu system sprawdza, czy jest odpowiednia seria numeracji dla zadan.
    /// Przy braku serii numeracji numeracja jest dopisywana
    /// </summary>
    /// <param name="Code">code[10].</param>
    /// <param name="JobNo">Code[10].</param>
    /// <param name="Desc">Text[100].</param>
    procedure AddNewSeries(Code: code[10]; JobNo: Code[10]; Desc: Text[100])
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
        Year, Year2, i, LineNo : Integer;
    begin
        NoSeries.Init();
        NoSeries.Code := Code;
        NoSeries.Description := Desc;
        NoSeries."Default Nos." := true;
        NoSeries.Insert(true);

        Year2 := Date2DMY(WorkDate(), 3);
        LineNo := 10000;
        for i := 0 to 5 do begin
            Year := Year2 + i;


            NoSeriesLine.Init();
            NoSeriesLine."Line No." := LineNo + (LineNo * i);
            NoSeriesLine."Series Code" := Code;
            NoSeriesLine."Starting Date" := DMY2Date(1, 1, Year);
            NoSeriesLine."Starting No." := JobNo + '/' + CopyStr(Format(Year), 3, 2) + '/' + '0001';
            NoSeriesLine.Insert(true);
        end;
    end;

    procedure CheckWorkRegisterSerie(Code: code[10]; Prefix: code[5]; Date: Date)
    var
        DateMgt: Codeunit "Date Management";
        NoSeriesLine: Record "No. Series Line";
        LineNo: Integer;
    begin
        NoSeriesLine.SetRange("Series Code", Code);
        NoSeriesLine.SetRange("Starting Date", Date);

        if NoSeriesLine.FindSet() then
            exit;

        NoSeriesLine.SetRange("Starting Date");
        if NoSeriesLine.FindLast() then
            LineNo := NoSeriesLine."Line No."
        else
            LineNo := 0;

        NoSeriesLine.Init();
        NoSeriesLine."Line No." := LineNo + 10000;
        NoSeriesLine."Series Code" := Code;
        NoSeriesLine."Starting Date" := Date;
        NoSeriesLine."Starting No." := Prefix + '/' + DateMgt.Date2YYYYMMDD(Date) + '/' + '0001';
        NoSeriesLine.Insert(true);
    end;
}