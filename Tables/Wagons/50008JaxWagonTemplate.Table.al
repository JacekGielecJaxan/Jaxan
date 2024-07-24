table 50007 "Wagon Template"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }

        /// <summary>
        /// Nr podmiotu wynajmujacego
        /// </summary>
        field(4; "Leasing Entity No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Leasing Entity No.';

            TableRelation = Vendor;
        }
        /// <summary>
        /// Nazwa podmiotu wynajmujacego
        /// </summary>
        field(5; "Leasing Entity Name"; text[150])
        {
            Caption = 'Leasing Entity Name';

            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = Field("Leasing Entity No.")));
        }

        /// <summary>
        /// Kod producenta
        /// </summary>
        field(18; "Producer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Producer No.';
            TableRelation = Vendor;


            trigger OnValidate()
            var
                vend: Record Vendor;
            begin
                if not vend.Get("Producer No.") then
                    clear(vend);

                "Producer Name" := vend.Name;
            end;
        }
        /// <summary>
        /// Nazwa producenta
        /// </summary>
        field(19; "Producer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Producer Name';
        }

        /// <summary>
        /// Cykl
        /// </summary>
        field(21; "Cycle"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cycle';
            BlankNumbers = BlankZero;
        }
        field(24; "DSU Code"; code[10])
        {
            Caption = 'DSU Code';
            TableRelation = DSU;
        }

        field(26; Description; text[250])
        {
            Caption = 'Description';
        }

        /// <summary>
        /// Typ nastawiacza
        /// </summary>
        field(50; "Brake Adjustment System Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Brake Adjustment System Code';
            TableRelation = "Wagon Brake Adjustment System";
        }

        /// <summary>
        /// Typ zaworu
        /// </summary>
        field(51; "Valve Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wagon Valve Type Code';
            TableRelation = "Wagon Valve Type";
        }

        /// <summary>
        /// Wstawka
        /// </summary>
        field(52; "Inset Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Inset Code';
            TableRelation = "Wagon Inset";
        }

        /// <summary>
        /// Wozek
        /// </summary>
        field(53; "Trolley Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Trolley Type Code';
            TableRelation = "Wagon Trolley Type";
        }

        /// <summary>
        ///Typ zestawu kolowego
        /// </summary>
        field(54; "Wheelset Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wheelset Type Code';
            TableRelation = "Wagon Wheelset Type";
        }
        /// <summary>
        ///Typ zderzaka
        /// </summary>
        field(55; "Bumper Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bumper Type Code';
            TableRelation = "Wagon Bumper Type";
        }

        field(100; VKM; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'VKM';
            TableRelation = "Wagon VKM";
        }
        field(101; Type; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Type';
            TableRelation = "Wagon Type";
        }
        field(102; Serie; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Serie';
            TableRelation = "Wagon serie";
        }
        field(103; Length; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Length';
            BlankNumbers = BlankZero;
        }
        /// <summary>
        /// Objetosc ładunku
        /// </summary>
        field(104; "Cargo Volume"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cargo Volume';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Powierzchnia ladowna
        /// </summary>
        field(105; "Loading Area"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Loading Area';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Masa własna
        /// </summary>
        field(106; "Own Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Own Weight';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Masaham.Postojowego
        /// </summary>
        field(107; "Mh.P"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mh.P';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Masaham.Prozny
        /// </summary>
        field(108; "Mh.Empty"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mh.Empty';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Masaham.Ladowny
        /// </summary>
        field(109; "Mh.Loaded"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mh.Empty';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// Masa przestawcza
        /// </summary>
        field(110; "Shifting Mass"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Shifting Mass';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// V max prozny
        /// </summary>
        field(111; "V Max Empty"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'V Max Empty';
            BlankNumbers = BlankZero;

        }
        /// <summary>
        /// V max ladowny
        /// </summary>
        field(112; "V Max Loaded"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'V Max Loaded';
            BlankNumbers = BlankZero;

        }
        field(113; "A"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'A';
            BlankNumbers = BlankZero;

        }
        field(114; "B1"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'B1';
            BlankNumbers = BlankZero;

        }
        field(115; "B2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'B2';
            BlankNumbers = BlankZero;

        }
        field(116; "C2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'C2';
            BlankNumbers = BlankZero;

        }
        field(117; "C3"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'C3';
            BlankNumbers = BlankZero;

        }
        field(118; "C4"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'C4';
            BlankNumbers = BlankZero;

        }
        field(119; "D2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'D2';
            BlankNumbers = BlankZero;

        }
        field(120; "D3"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'D3';
            BlankNumbers = BlankZero;

        }
        field(121; "D4"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'D4';
            BlankNumbers = BlankZero;

        }
        field(999; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
    }

    keys
    {
        key(Key1; code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

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

    procedure CopyFromTemplate(SourceItemTempl: Record "Wagon Template")
    begin
        CopyTemplate(SourceItemTempl);
        OnAfterCopyFromTemplate(SourceItemTempl, Rec);
    end;

    local procedure CopyTemplate(SourceItemTempl: Record "Wagon Template")
    var
        SavedItemTempl: Record "Wagon Template";
    begin
        SavedItemTempl := Rec;
        TransferFields(SourceItemTempl, false);
        Code := SavedItemTempl.Code;
        Description := SavedItemTempl.Description;
        OnCopyTemplateOnBeforeModify(SourceItemTempl, SavedItemTempl, Rec);
        Modify();
    end;

    procedure ValidateItemField(FieldId: Integer)
    var
        ItemRecordRef: RecordRef;
        ItemTemplRecordRef: RecordRef;
        ItemFieldRef: FieldRef;
        ItemTemplFieldRef: FieldRef;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeValidateItemField(Rec, FieldId, IsHandled);
        if IsHandled then
            exit;

        ItemTemplRecordRef.GetTable(Rec);
        ItemRecordRef.Open(Database::Item, true);
        TransferFieldValues(ItemTemplRecordRef, ItemRecordRef, false);
        ItemRecordRef.Insert();

        ItemFieldRef := ItemRecordRef.Field(FieldId);
        ItemTemplFieldRef := ItemTemplRecordRef.Field(FieldId);
        ItemFieldRef.Validate(ItemTemplFieldRef.Value);

        TransferFieldValues(ItemTemplRecordRef, ItemRecordRef, true);

        ItemTemplRecordRef.SetTable(Rec);
        Modify();
    end;

    local procedure TransferFieldValues(var SrcRecRef: RecordRef; var DestRecRef: RecordRef; Reverse: Boolean)
    var
        SrcFieldRef: FieldRef;
        DestFieldRef: FieldRef;
        i: Integer;
        IsHandled: Boolean;
    begin
        for i := 3 to SrcRecRef.FieldCount do begin
            SrcFieldRef := SrcRecRef.FieldIndex(i);
            DestFieldRef := DestRecRef.Field(SrcFieldRef.Number);
            IsHandled := false;
            OnTransferFieldValuesOnBeforeTransferFieldValue(SrcFieldRef, DestFieldRef, Reverse, IsHandled);
            if not IsHandled then
                if not Reverse then
                    DestFieldRef.Value := SrcFieldRef.Value
                else
                    SrcFieldRef.Value := DestFieldRef.Value();
        end;

        OnAfterTransferFieldValues(SrcRecRef, DestRecRef, Reverse);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyFromTemplate(SourceItemTempl: Record "Wagon Template"; var ItemTempl: Record "Wagon Template")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCopyTemplateOnBeforeModify(SourceItemTempl: Record "Wagon Template"; SavedItemTempl: Record "Wagon Template"; var ItemTempl: Record "Wagon Template")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateItemField(var ItemTempl: record "Wagon Template"; FieldId: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterTransferFieldValues(var SrcRecRef: RecordRef; var DestRecRef: RecordRef; Reverse: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnTransferFieldValuesOnBeforeTransferFieldValue(var SrcFieldRef: FieldRef; var DestFieldRef: FieldRef; Reverse: Boolean; var IsHandled: Boolean)
    begin
    end;
}