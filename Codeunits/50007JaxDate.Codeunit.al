codeunit 50008 "Date Management"
{
    procedure GetFirstDateOfMonth(Date: Date): Date
    begin
        exit(DMY2Date(1, Date2DMY(Date, 2), Date2DMY(Date, 3)))
    end;

    internal procedure Date2YYYYMMDD(Date: Date): Code[8]
    var
        i: Integer;
        YT, MT, DT : text[4];
    begin
        yt := format(Date2DMY(Date, 3));
        i := Date2DMY(Date, 1);

        if i < 10 then
            dt := '0';
        dt := dt + format(i);

        i := Date2DMY(Date, 2);

        if i < 10 then
            mt := '0';
        mt := mt + format(i);

        exit(yt + mt + dt);
    end;


}