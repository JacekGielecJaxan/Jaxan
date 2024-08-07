table 50307 "Vehicle Template"
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
            TableRelation = "Vehicle Brake Adj. System";
        }

        /// <summary>
        /// Typ zaworu
        /// </summary>
        field(51; "Valve Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wagon Valve Type Code';
            TableRelation = "Vehicle Valve Type";
        }

        /// <summary>
        /// Wstawka
        /// </summary>
        field(52; "Inset Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Inset Code';
            TableRelation = "Vehicle Inset";
        }

        /// <summary>
        /// Wozek
        /// </summary>
        field(53; "Trolley Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Trolley Type Code';
            TableRelation = "Vehicle Trolley Type";
        }

        /// <summary>
        ///Typ zestawu kolowego
        /// </summary>
        field(54; "Wheelset Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wheelset Type Code';
            TableRelation = "Vehicle Wheelset Type";
        }
        /// <summary>
        ///Typ zderzaka
        /// </summary>
        field(55; "Bumper Type Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bumper Type Code';
            TableRelation = "Vehicle Bumper Type";
        }

        field(100; VKM; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'VKM';
            TableRelation = "Vehicle VKM";
        }
        field(101; Type; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Type';
            TableRelation = "Vehicle Type";
        }
        field(102; Serie; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Serie';
            TableRelation = "Vehicle serie";
        }
        field(103; Length; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Length';
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
        /// V max
        /// </summary>
        field(111; "V Max."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'V Max.';
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

    procedure CopyFromTemplate(SourceItemTempl: Record "Vehicle Template")
    begin
        CopyTemplate(SourceItemTempl);
        OnAfterCopyFromTemplate(SourceItemTempl, Rec);
    end;

    local procedure CopyTemplate(SourceItemTempl: Record "Vehicle Template")
    var
        SavedItemTempl: Record "Vehicle Template";
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
        ItemRecordRef.Open(Database::Vehicle, true);
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
    local procedure OnAfterCopyFromTemplate(SourceItemTempl: Record "Vehicle Template"; var ItemTempl: Record "Vehicle Template")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCopyTemplateOnBeforeModify(SourceItemTempl: Record "Vehicle Template"; SavedItemTempl: Record "Vehicle Template"; var ItemTempl: Record "Vehicle Template")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateItemField(var ItemTempl: record "Vehicle Template"; FieldId: Integer; var IsHandled: Boolean)
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