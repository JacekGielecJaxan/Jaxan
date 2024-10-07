/// <summary>
/// Sytyacja pojazdowa
/// </summary>
table 50041 "Situation Line"
{
    Caption = 'Situation Entry';
    DrillDownPageID = "Situation Lines";
    LookupPageID = "Situation Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Object No."; Integer)
        {
            Caption = 'Object No.';
        }
        field(3; "Object Name"; text[100])
        {
            Caption = 'Object Name';
        }
        field(4; "Track No."; code[10])
        {
            Caption = 'Track No.';
        }
        field(5; Position; Integer)
        {
            Caption = 'Position';
        }
        field(6; "Vehicle Type"; Enum "Vehicle Type")
        {
            Caption = 'Vehicle Type';

            trigger OnValidate()
            var
                TempSituationLine: Record "Situation Line" temporary;
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateType(Rec, xRec, CurrFieldNo, IsHandled);
                if IsHandled then
                    exit;

                // Dodac wszystkie testy

                if "Vehicle Type" <> xRec."Vehicle Type" then begin
                    case xRec."Vehicle Type" of
                        "Vehicle Type"::Vehicle:
                            begin

                            end;
                        "Vehicle Type"::"Wagon":
                            begin

                            end;
                    end;

                    OnValidateTypeOnAfterVerifyChange(Rec, xRec);
                end;

                OnValidateTypeOnBeforeInitRec(Rec, xRec, CurrFieldNo);
                TempSituationLine := Rec;
                Init();
                SystemId := TempSituationLine.SystemId;

                "Vehicle Type" := TempSituationLine."Vehicle Type";
                "System-Created Entry" := TempSituationLine."System-Created Entry";

                OnValidateTypeOnCopyFromTempSituationLine(Rec, TempSituationLine);
            end;
        }
        field(7; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';

            TableRelation = if ("Vehicle Type" = const(Vehicle)) Vehicle
            else
            if ("Vehicle Type" = const(Wagon)) Wagon;

            ValidateTableRelation = false;
            trigger OnValidate()
            var
                TempSituationLine: Record "Situation Line" temporary;
                IsHandled: Boolean;
                ShouldStopValidation: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateVehicleNo(Rec, xRec, CurrFieldNo, IsHandled);
                if IsHandled then
                    exit;

                GetVehicleSetup();

                "Vehicle No." := FindOrCreateRecordByNo("Vehicle No.");

                TestStatusOpen();

                if (xRec."Vehicle No." <> "Vehicle No.") then begin

                    OnValidateNoOnAfterVerifyChange(Rec, xRec);
                end;

                //Tutaj dopisac testfieldy
                OnValidateNoOnBeforeInitRec(Rec, xRec, CurrFieldNo);
                TempSituationLine := Rec;
                Init();
                SystemId := TempSituationLine.SystemId;
                "Vehicle Type" := TempSituationLine."Vehicle Type";
                "Vehicle No." := TempSituationLine."Vehicle No.";
                OnValidateNoOnCopyFromTempSituationLine(Rec, TempSituationLine, xRec, CurrFieldNo);
                ShouldStopValidation := "Vehicle No." = '';
                OnValidateNoOnAfterCalcShouldStopValidation(Rec, xRec, CurrFieldNo, ShouldStopValidation);
                if ShouldStopValidation then
                    exit;

                "System-Created Entry" := TempSituationLine."System-Created Entry";

                case "Vehicle Type" of
                    "Vehicle Type"::Vehicle:
                        CopyFromVehicle(TempSituationLine);
                    "Vehicle Type"::Wagon:
                        CopyFromWagon();
                end;

                OnAfterAssignFieldsForNo(Rec, xRec);


            end;
        }

        field(8; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(9; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = "Job";
        }
        field(10; "Job Task No."; code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task";
        }

        field(12; "Train No."; code[10])
        {
            Caption = 'Train No.';
        }
        field(13; "Train Name"; Text[100])
        {
            Caption = 'Train Name';
        }
        field(100; TimetableCode; code[9])
        {
            Caption = 'Timetable Code';
            TableRelation = Timetable;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                if TimetableCode = xRec.TimetableCode then
                    exit;

                IsHandled := false;
                OnBeforeValidateSkrjOrderNo(Rec, xRec, IsHandled);

                if IsHandled then
                    exit;

                Validate("SKRJ Order No", 0);
            end;
        }
        field(101; "SKRJ Order No"; Integer)
        {
            Caption = 'SKRJ Order No.';
        }
        field(102; "SEPE Order No."; Integer)
        {
            Caption = 'SEPE Order No.';

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeGetSepeData(Rec, xRec, IsHandled);

                if IsHandled then
                    exit;
                GetSepeData();
            end;
        }
        field(103; "Planned Departure Date"; Date)
        {
            Caption = 'Planned Departure Date';
        }
        field(104; "Planned Departure Time"; Time)
        {
            Caption = 'Planned Departure time';
        }
        field(105; "Start Object No."; Integer)
        {
            Caption = 'Start Object No.';
        }
        field(106; "Start Object Name"; Text[100])
        {
            Caption = 'Start Object Name';
        }
        field(107; "End Object No."; Integer)
        {
            Caption = 'End Object No.';
        }
        field(108; "End Object Name"; Text[100])
        {
            Caption = 'End Object Name';
        }
        field(501; "User ID"; code[100])
        {
            Caption = 'User Id';
        }
        field(1000; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
        }
        field(1001; "Briefcase-Created Entry"; Boolean)
        {
            Caption = 'Briefcase-Created Entry';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Object No.", Position) { }
        key(Key5; "Train No.")
        {
        }
        key(Key6; TimetableCode, "SEPE Order No.")
        {
        }

    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    local procedure ClearAllValues()
    begin
        Error('Procedure ClearAllValues not implemented.');
    end;

    local procedure GetVehicleSetup()
    begin
        Error('Procedure GetVehicleSetup not implemented.');
    end;

    local procedure FindOrCreateRecordByNo(VehicleNo: Code[20]): Code[20]
    begin
        Error('Procedure FindOrCreateRecordByNo not implemented.');
    end;

    local procedure TestStatusOpen()
    begin
        Error('Procedure TestStatusOpen not implemented.');
    end;

    local procedure CopyFromVehicle(var TempSituationLine: Record "Situation Line" temporary)
    begin
        Error('Procedure CopyFromVehicle not implemented.');
    end;

    local procedure CopyFromWagon()
    begin
        Error('Procedure CopyFromWagon not implemented.');
    end;

    local procedure GetSepeData()
    begin
        if "SEPE Order No." = 0 then
            ClearTrainData()
        else
            GetSEPEData("SEPE Order No.")
    end;

    local procedure GetSEPEData(OrderNo: Integer)
    var
        sepe: Record "Sepe Order";
    begin
        sepe.SetCurrentKey("SEPE Entry No.");
        sepe.SetRange("SEPE Entry No.", OrderNo);
        if not sepe.FindSet() then begin
            ClearTrainData();
            exit;
        end;

        "Train No." := sepe."Train No.";
        "Train Name" := sepe."Train Name";
        "Start Object No." := sepe."Start Object No.";
        "Start Object Name" := sepe."Start Object Name";
        "End Object No." := sepe."End Object No.";
        "End Object Name" := sepe."End Object Name";
        "Planned Departure Date" := DT2Date(sepe."Departure Date");
        "Planned Departure Time" := DT2Time(sepe."Departure Date");
        "SKRJ Order No" := sepe."Order No.";
    end;

    local procedure ClearTrainData()
    begin
        "Train No." := '';
        "Train Name" := '';
        "Start Object No." := 0;
        "Start Object Name" := '';
        "End Object No." := 0;
        "End Object Name" := '';
        "SEPE Order No." := 0;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateType(Rec: Record "Situation Line"; xRec: Record "Situation Line"; CurrFieldNo: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateTypeOnAfterVerifyChange(Rec: Record "Situation Line"; xRec: Record "Situation Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateTypeOnBeforeInitRec(Rec: Record "Situation Line"; xRec: Record "Situation Line"; CurrFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateTypeOnCopyFromTempSituationLine(Rec: Record "Situation Line"; var TempSituationLine: Record "Situation Line" temporary)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateVehicleNo(Rec: Record "Situation Line"; xRec: Record "Situation Line"; CurrFieldNo: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateNoOnAfterVerifyChange(Rec: Record "Situation Line"; xRec: Record "Situation Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateNoOnBeforeInitRec(Rec: Record "Situation Line"; xRec: Record "Situation Line"; CurrFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateNoOnCopyFromTempSituationLine(Rec: Record "Situation Line"; var TempSituationLine: Record "Situation Line" temporary; xRec: Record "Situation Line"; CurrFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateNoOnAfterCalcShouldStopValidation(Rec: Record "Situation Line"; xRec: Record "Situation Line"; CurrFieldNo: Integer; ShouldStopValidation: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterAssignFieldsForNo(Rec: Record "Situation Line"; xRec: Record "Situation Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeClearTrainData(Rec: Record "Situation Line"; xRec: Record "Situation Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateSkrjOrderNo(Rec: Record "Situation Line"; xRec: Record "Situation Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetSepeData(Rec: Record "Situation Line"; xRec: Record "Situation Line"; var IsHandled: Boolean)
    begin
    end;

}