codeunit 50003 "Vehicle Templ. Mgt."
{
    trigger OnRun()
    begin
    end;

    var
        UpdateExistingValuesQst: Label 'You are about to apply the template to selected records. Data from the template will replace data for the records in fields that do not already contain data.\\Do you want also data from the template to replace data for the records in fields that already contain data?';
        OpenBlankCardQst: Label 'Do you want to open the blank Vehicle card?';

    procedure CreateItemFromTemplate(var Item: Record Vehicle; var IsHandled: Boolean; ItemTemplCode: Code[20]) Result: Boolean
    var
        ItemTempl: Record "Vehicle Template";
        VehicleSetup: Record "Vehicle Setup";
    begin
        IsHandled := false;
        OnBeforeCreateItemFromTemplate(Item, Result, IsHandled);
        if IsHandled then
            exit(Result);

        IsHandled := true;

        OnCreateItemFromTemplateOnBeforeSelectItemTemplate(Item, ItemTempl);
        if ItemTemplCode = '' then begin
            if not SelectItemTemplate(ItemTempl) then
                exit(false);
        end
        else
            ItemTempl.Get(ItemTemplCode);

        Item.Init();
        InitItemNo(Item, ItemTempl);


        Item.Insert(true);

        ApplyItemTemplate(Item, ItemTempl, true);

        OnAfterCreateItemFromTemplate(Item, ItemTempl);
        exit(true);
    end;

    procedure CreateItemFromTemplate(var Item: Record Vehicle; var IsHandled: Boolean): Boolean
    begin
        exit(CreateItemFromTemplate(Item, IsHandled, ''));
    end;

    procedure ApplyItemTemplate(var Item: Record Vehicle; ItemTempl: Record "Vehicle template")
    begin
        ApplyItemTemplate(Item, ItemTempl, false);
    end;

    procedure ApplyItemTemplate(var Item: Record Vehicle; ItemTempl: Record "Vehicle template"; UpdateExistingValues: Boolean)
    begin
        ApplyTemplate(Item, ItemTempl, UpdateExistingValues);
        OnApplyItemTemplateOnBeforeItemGet(Item, ItemTempl, UpdateExistingValues);
        Item.Get(Item."No.");
    end;

    internal procedure InitFromTemplate(var Item: Record Vehicle; ItemTempl: Record "Vehicle template"; UpdateExistingValues: Boolean)
    var
        TempItem: Record Vehicle temporary;
        ItemRecRef: RecordRef;
        EmptyItemRecRef: RecordRef;
        ItemTemplRecRef: RecordRef;
        EmptyItemTemplRecRef: RecordRef;
        ItemFldRef: FieldRef;
        EmptyItemFldRef: FieldRef;
        ItemTemplFldRef: FieldRef;
        EmptyItemTemplFldRef: FieldRef;
        i: Integer;
        FieldExclusionList: List of [Integer];
        FieldValidationList: List of [Integer];
    begin
        ItemRecRef.GetTable(Item);
        TempItem.Init();
        EmptyItemRecRef.GetTable(TempItem);
        ItemTemplRecRef.GetTable(ItemTempl);
        EmptyItemTemplRecRef.Open(Database::"Vehicle template");
        EmptyItemTemplRecRef.Init();

        FillFieldExclusionList(FieldExclusionList);

        for i := 3 to ItemTemplRecRef.FieldCount do begin
            ItemTemplFldRef := ItemTemplRecRef.FieldIndex(i);
            if TemplateFieldCanBeProcessed(ItemTemplFldRef.Number, FieldExclusionList) then begin
                ItemFldRef := ItemRecRef.Field(ItemTemplFldRef.Number);
                EmptyItemFldRef := EmptyItemRecRef.Field(ItemTemplFldRef.Number);
                EmptyItemTemplFldRef := EmptyItemTemplRecRef.Field(ItemTemplFldRef.Number);
                if (not UpdateExistingValues and (ItemFldRef.Value = EmptyItemFldRef.Value) and (ItemTemplFldRef.Value <> EmptyItemTemplFldRef.Value)) or
                   (UpdateExistingValues and (ItemTemplFldRef.Value <> EmptyItemTemplFldRef.Value))
                then begin
                    ItemFldRef.Value := ItemTemplFldRef.Value();
                    FieldValidationList.Add(ItemTemplFldRef.Number);
                end;
            end;
        end;

        OnApplyTemplateOnBeforeValidateFields(ItemRecRef, ItemTemplRecRef, FieldExclusionList, FieldValidationList);

        OnInitFromTemplateOnBeforeValidateFields(ItemRecRef, ItemTemplRecRef, FieldExclusionList, FieldValidationList);

        for i := 1 to FieldValidationList.Count do begin
            ItemTemplFldRef := ItemTemplRecRef.Field(FieldValidationList.Get(i));
            ItemFldRef := ItemRecRef.Field(ItemTemplFldRef.Number);
            ItemFldRef.Validate(ItemTemplFldRef.Value);
        end;

        ItemRecRef.SetTable(Item);


        //Item.Validate("Item Category Code", ItemTempl."Item Category Code");
        //Item.Validate("Indirect Cost %", ItemTempl."Indirect Cost %");
    end;

    local procedure ApplyTemplate(var Item: Record Vehicle; ItemTempl: Record "Vehicle template"; UpdateExistingValues: Boolean)
    var
        IsHandled: Boolean;
    begin
        InitFromTemplate(Item, ItemTempl, UpdateExistingValues);

        IsHandled := false;
        OnApplyTemplateOnBeforeItemModify(Item, ItemTempl, IsHandled, UpdateExistingValues);
        if not IsHandled then
            Item.Modify(true);
    end;

    local procedure SelectItemTemplate(var ItemTempl: Record "Vehicle template"): Boolean
    var
        SelectItemTemplList: Page "Select Vehicle Templ. List";
        IsHandled: Boolean;
        Result: Boolean;
    begin
        IsHandled := false;
        OnBeforeSelectItemTemplate(ItemTempl, IsHandled, Result);
        if IsHandled then
            exit(Result);

        if ItemTempl.Count = 1 then begin
            ItemTempl.FindFirst();
            exit(true);
        end;

        if (ItemTempl.Count > 1) and GuiAllowed then begin
            SelectItemTemplList.SetTableView(ItemTempl);
            SelectItemTemplList.LookupMode(true);
            if SelectItemTemplList.RunModal() = Action::LookupOK then begin
                SelectItemTemplList.GetRecord(ItemTempl);
                exit(true);
            end;
        end;

        exit(false);
    end;

    procedure ItemTemplatesAreNotEmpty(var IsHandled: Boolean): Boolean
    var
        ItemTempl: Record "Vehicle template";
        TemplateFeatureMgt: Codeunit "Template Feature Mgt.";
    begin
        if not TemplateFeatureMgt.IsEnabled() then
            exit(false);

        IsHandled := true;
        exit(not ItemTempl.IsEmpty);
    end;

    procedure InsertItemFromTemplate(var Item: Record Vehicle) Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnInsertItemFromTemplate(Item, Result, IsHandled);
        if IsHandled then
            exit(Result);

        Result := CreateItemFromTemplate(Item, IsHandled);
    end;

    procedure TemplatesAreNotEmpty() Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnTemplatesAreNotEmpty(Result, IsHandled);
        if IsHandled then
            exit(Result);

        Result := ItemTemplatesAreNotEmpty(IsHandled);
    end;

    procedure IsEnabled() Result: Boolean
    var
        TemplateFeatureMgt: Codeunit "Template Feature Mgt.";
    begin
        Result := TemplateFeatureMgt.IsEnabled();

        OnAfterIsEnabled(Result);
    end;

    procedure UpdateItemFromTemplate(var Item: Record Vehicle)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnUpdateItemFromTemplate(Item, IsHandled);
        if IsHandled then
            exit;

        UpdateFromTemplate(Item, IsHandled);
    end;

    local procedure UpdateFromTemplate(var Item: Record Vehicle; var IsHandled: Boolean)
    var
        ItemTempl: Record "Vehicle template";
    begin
        IsHandled := false;
        OnBeforeUpdateFromTemplate(Item, IsHandled);
        if IsHandled then
            exit;

        if not CanBeUpdatedFromTemplate(ItemTempl, IsHandled) then
            exit;

        ApplyItemTemplate(Item, ItemTempl, GetUpdateExistingValuesParam());
    end;

    procedure UpdateItemsFromTemplate(var Item: Record Vehicle)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnUpdateItemsFromTemplate(Item, IsHandled);
        if IsHandled then
            exit;

        UpdateMultipleFromTemplate(Item, IsHandled);
    end;

    local procedure UpdateMultipleFromTemplate(var Item: Record Vehicle; var IsHandled: Boolean)
    var
        ItemTempl: Record "Vehicle template";
    begin
        IsHandled := false;
        OnBeforeUpdateMultipleFromTemplate(Item, IsHandled);
        if IsHandled then
            exit;

        if not CanBeUpdatedFromTemplate(ItemTempl, IsHandled) then
            exit;

        if Item.FindSet() then
            repeat
                ApplyItemTemplate(Item, ItemTempl, GetUpdateExistingValuesParam());
            until Item.Next() = 0;
    end;

    local procedure CanBeUpdatedFromTemplate(var ItemTempl: Record "Vehicle template"; var IsHandled: Boolean): Boolean
    begin
        IsHandled := true;

        if not SelectItemTemplate(ItemTempl) then
            exit(false);

        exit(true);
    end;

    procedure SaveAsTemplate(Item: Record Vehicle)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnSaveAsTemplate(Item, IsHandled);
        if IsHandled then
            exit;

        CreateTemplateFromItem(Item, IsHandled);
    end;

    procedure CreateTemplateFromItem(Item: Record Vehicle; var IsHandled: Boolean)
    var
        ItemTempl: Record "Vehicle template";
    begin
        IsHandled := false;
        OnBeforeCreateTemplateFromItem(Item, IsHandled);
        if IsHandled then
            exit;

        IsHandled := true;

        InsertTemplateFromItem(ItemTempl, Item);
        OnCreateTemplateFromItemOnBeforeItemTemplGet(Item, ItemTempl);
        ItemTempl.Get(ItemTempl.Code);
        ShowItemTemplCard(ItemTempl);
    end;

    local procedure InsertTemplateFromItem(var ItemTempl: Record "Vehicle template"; Item: Record Vehicle)
    var
        SavedItemTempl: Record "Vehicle Template";
    begin
        ItemTempl.Init();
        ItemTempl.Code := GetItemTemplCode();
        SavedItemTempl := ItemTempl;
        ItemTempl.TransferFields(Item);
        ItemTempl.Code := SavedItemTempl.Code;
        ItemTempl.Description := SavedItemTempl.Description;
        OnInsertTemplateFromItemOnBeforeItemTemplInsert(ItemTempl, Item);
        ItemTempl.Insert();
    end;

    local procedure GetItemTemplCode() ItemTemplCode: Code[20]
    var
        Item: Record Item;
        ItemTempl: Record "Item Templ.";
    begin
        if ItemTempl.FindLast() and (IncStr(ItemTempl.Code) <> '') then
            ItemTemplCode := ItemTempl.Code
        else
            ItemTemplCode := CopyStr(Item.TableCaption(), 1, 4) + '000001';

        while ItemTempl.Get(ItemTemplCode) do
            ItemTemplCode := IncStr(ItemTemplCode);
    end;

    local procedure ShowItemTemplCard(ItemTempl: Record "Vehicle Template")
    var
        ItemTemplCard: Page "Vehicle Templ. Card";
    begin
        if not GuiAllowed then
            exit;

        Commit();
        ItemTemplCard.SetRecord(ItemTempl);
        ItemTemplCard.LookupMode := true;
        if ItemTemplCard.RunModal() = Action::LookupCancel then begin
            ItemTempl.Get(ItemTempl.Code);
            ItemTempl.Delete(true);
        end;
    end;

    procedure ShowTemplates()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnShowTemplates(IsHandled);
        if IsHandled then
            exit;

        ShowItemTemplList(IsHandled);
    end;

    local procedure ShowItemTemplList(var IsHandled: Boolean)
    begin
        IsHandled := true;
        Page.Run(Page::"Item Templ. List");
    end;

    local procedure InitItemNo(var Item: Record Vehicle; ItemTempl: Record "Vehicle template")
    var
        NoSeries: Codeunit "No. Series";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInitItemNo(Item, ItemTempl, IsHandled);
        if IsHandled then
            exit;

        //TODO: wlasciwie obsluzyc
        Item."No." := '';
    end;

    local procedure TemplateFieldCanBeProcessed(FieldNumber: Integer; FieldExclusionList: List of [Integer]): Boolean
    var
        ItemField: Record Field;
        ItemTemplateField: Record Field;
    begin
        if FieldExclusionList.Contains(FieldNumber) or (FieldNumber > 2000000000) then
            exit(false);

        if not (ItemField.Get(Database::Item, FieldNumber) and ItemTemplateField.Get(Database::"Item Templ.", FieldNumber)) then
            exit(false);

        if (ItemField.Class <> ItemField.Class::Normal) or (ItemTemplateField.Class <> ItemTemplateField.Class::Normal) or
            (ItemField.Type <> ItemTemplateField.Type) or (ItemField.FieldName <> ItemTemplateField.FieldName) or
            (ItemField.Len <> ItemTemplateField.Len) or
            (ItemField.ObsoleteState = ItemField.ObsoleteState::Removed) or
            (ItemTemplateField.ObsoleteState = ItemTemplateField.ObsoleteState::Removed)
        then
            exit(false);

        exit(true);
    end;

    local procedure FillFieldExclusionList(var FieldExclusionList: List of [Integer])
    var
        ItemTempl: Record "Vehicle template";
    begin
        /*
        FieldExclusionList.Add(ItemTempl.FieldNo("Base Unit of Measure"));
        FieldExclusionList.Add(ItemTempl.FieldNo("No. Series"));
        FieldExclusionList.Add(ItemTempl.FieldNo("VAT Bus. Posting Gr. (Price)"));
        FieldExclusionList.Add(ItemTempl.FieldNo("Item Category Code"));
        */
        OnAfterFillFieldExclusionList(FieldExclusionList);
    end;

    local procedure GetUpdateExistingValuesParam() Result: Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeGetUpdateExistingValuesParam(Result, IsHandled);
        if not IsHandled then
            Result := ConfirmManagement.GetResponseOrDefault(UpdateExistingValuesQst, false);
    end;

    procedure IsOpenBlankCardConfirmed(): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
    begin
        exit(ConfirmManagement.GetResponse(OpenBlankCardQst, false));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterIsEnabled(var Result: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnApplyTemplateOnBeforeItemModify(var Item: Record Vehicle; ItemTempl: Record "Vehicle Template"; var IsHandled: Boolean; UpdateExistingValues: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnApplyItemTemplateOnBeforeItemGet(var Item: Record Vehicle; ItemTempl: Record "Vehicle Template"; UpdateExistingValues: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCreateItemFromTemplateOnBeforeSelectItemTemplate(Item: Record Vehicle; var ItemTempl: Record "Vehicle Template")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInsertItemFromTemplate(var Item: Record Vehicle; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnTemplatesAreNotEmpty(var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnUpdateItemFromTemplate(var Item: Record Vehicle; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnUpdateItemsFromTemplate(var Item: Record Vehicle; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnSaveAsTemplate(Item: Record Vehicle; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnShowTemplates(var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFillFieldExclusionList(var FieldExclusionList: List of [Integer])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateItemFromTemplate(var Item: Record Vehicle; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateFromTemplate(var Item: Record Vehicle; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateMultipleFromTemplate(var Item: Record Vehicle; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateTemplateFromItem(Item: Record Vehicle; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInsertTemplateFromItemOnBeforeItemTemplInsert(var ItemTempl: Record "Vehicle Template"; Item: Record Vehicle)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetUpdateExistingValuesParam(var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetBaseUoM(var Item: Record Vehicle; var ItemTempl: Record "Vehicle Template"; var IsHandled: Boolean)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Config. Template Management", 'OnBeforeInsertRecordWithKeyFields', '', false, false)]
    local procedure OnBeforeInsertRecordWithKeyFieldsHandler(var RecRef: RecordRef; ConfigTemplateHeader: Record "Config. Template Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInitItemNo(var Item: Record Vehicle; ItemTempl: Record "Vehicle Template"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCreateTemplateFromItemOnBeforeItemTemplGet(Item: Record Vehicle; ItemTempl: Record "Vehicle Template")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateItemFromTemplate(var Item: Record Vehicle; ItemTempl: Record "Vehicle Template");
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnApplyTemplateOnBeforeValidateFields(var ItemRecRef: RecordRef; var ItemTemplRecRef: RecordRef; FieldExclusionList: List of [Integer]; var FieldValidationList: List of [Integer])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInitFromTemplateOnBeforeValidateFields(var ItemRecRef: RecordRef; var ItemTemplRecRef: RecordRef; FieldExclusionList: List of [Integer]; var FieldValidationList: List of [Integer])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSelectItemTemplate(ItemTempl: Record "Vehicle Template"; var IsHandled: Boolean; var Result: Boolean)
    begin
    end;
}