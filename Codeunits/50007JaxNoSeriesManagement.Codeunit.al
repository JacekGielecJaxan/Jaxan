codeunit 50007 "Jax NoSeriesManagement"
{
    trigger OnRun()
    begin

    end;

    procedure AddNewSeries(Code: code[10]; JobNo: Code[10]; Desc: Text[100])
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
        Year, i, LineNo : Integer;
    begin
        NoSeries.Init();
        NoSeries.Code := Code;
        NoSeries.Description := Desc;
        NoSeries."Default Nos." := true;
        NoSeries.Insert(true);

        Year := Date2DMY(WorkDate(), 3);
        LineNo := 10000;
        for i := 0 to 5 do begin
            Year := Year + i;


            NoSeriesLine.Init();
            NoSeriesLine."Line No." := LineNo + (LineNo * i);
            NoSeriesLine."Series Code" := Code;
            NoSeriesLine."Starting Date" := DMY2Date(1, 1, Year);
            NoSeriesLine."Starting No." := JobNo + '/' + CopyStr(Format(Year), 3, 2) + '/' + '0001';
            NoSeriesLine.Insert(true);
        end;
    end;
}