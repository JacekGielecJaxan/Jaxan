page 50070 "Purchase Contract List"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Contracts';
    CardPageID = "Purchase Contract Card";
    Editable = false;
    PageType = List;
    QueryCategory = 'Purchase Contract List';
    SourceTable = "Purchase Contract Header";
    UsageCategory = Lists;

    AboutTitle = 'About purchase contract';
    //TODO: poprawic tekst
    //AboutText = '**Wagons** represent the Vehicles and services you buy and sell. For each item, you can manage the default sales and purchase prices used when creating documents, as well as track inventory numbers. With [Item Templates](?page=1383 "Opens the Item Templates") you can quickly create new items having common details defined by the template.';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Caption = 'Contract';
                field(Type; Rec."Contract Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a number to identify the contract.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Name; Rec."Contract Subject")
                {
                    ApplicationArea = All;
                    ToolTip = '';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("External No."; Rec."External No.")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies when the contract card was last modified.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::Wagon), "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Contract)
            {
                Caption = 'Contract';
                Image = DataEntry;
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                group("E&ntries")
                {
                    Caption = 'E&ntries';
                    Image = Entries;
                    action("Ledger E&ntries")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Ledger E&ntries';
                        Image = ItemLedger;
                        Scope = Repeater;
                        ShortCutKey = 'Ctrl+F7';
                        ToolTip = 'View the history of transactions that have been posted for the selected record.';
                    }
                }
            }
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
            }
        }
        area(Promoted)
        {

            group(Category_Category5)
            {
Caption = 'History', Comment = 'Generated from the PromotedActionCategories property index 4.';
            }
            group(Category_Category8)
            {
Caption = 'Periodic Activities', Comment = 'Generated from the PromotedActionCategories property index 7.';
            }
            group(Category_Category9)
            {
Caption = 'Inventory', Comment = 'Generated from the PromotedActionCategories property index 8.';

            }
            group(Category_Report)
            {
Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
    begin
    end;

    trigger OnAfterGetRecord()
    begin
        //EnableControls();
    end;

    trigger OnFindRecord(Which: Text): Boolean
    var
        Found: Boolean;
    begin
        if RunOnTempRec then begin
            TempItemFilteredFromAttributes.Copy(Rec);
            Found := TempItemFilteredFromAttributes.Find(Which);
            if Found then
                Rec := TempItemFilteredFromAttributes;
            exit(Found);
        end;
        exit(Rec.Find(Which));
    end;

    trigger OnInit()
    begin
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    var
        ResultSteps: Integer;
    begin
        if RunOnTempRec then begin
            TempItemFilteredFromAttributes.Copy(Rec);
            ResultSteps := TempItemFilteredFromAttributes.Next(Steps);
            if ResultSteps <> 0 then
                Rec := TempItemFilteredFromAttributes;
            exit(ResultSteps);
        end;
        exit(Rec.Next(Steps));
    end;

    trigger OnOpenPage()
    var
    begin
    end;

    var
        TempItemFilteredFromAttributes: Record "Purchase Contract Header" temporary;
        TempItemFilteredFromPickItem: Record "Purchase Contract Header" temporary;
        ClientTypeManagement: Codeunit "Client Type Management";
        RunOnTempRec: Boolean;
        EventFilter: Text;

    procedure SelectActiveItems(): Text
    var
        Contract: Record "Purchase Contract Header";
    begin
        Contract.SetRange(Status, Rec.Status::Active);
        exit(SelectInItemList(Contract));
    end;

    procedure SelectNewItems(): Text
    var
        Contract: Record "Purchase Contract Header";
    begin
        Contract.SetRange(Status, Rec.Status::New);
        exit(SelectInItemList(Contract));
    end;

    procedure GetSelectionFilter(): Text
    var
        Contract: Record "Purchase Contract Header";
        SelectionFilterManagement: Codeunit "Selection Filter Mgt Jax";
    begin
        CurrPage.SetSelectionFilter(Contract);
        exit(SelectionFilterManagement.GetSelectionFilterForContract(Contract));
    end;

    procedure SetSelection(var Contract: Record "Purchase Contract Header")
    begin
        CurrPage.SetSelectionFilter(Contract);
    end;



    procedure SetTempFilteredItemRec(var Contract: Record "Purchase Contract Header")
    begin
        TempItemFilteredFromAttributes.Reset();
        TempItemFilteredFromAttributes.DeleteAll();

        TempItemFilteredFromPickItem.Reset();
        TempItemFilteredFromPickItem.DeleteAll();

        RunOnTempRec := true;

        if Contract.FindSet() then
            repeat
                TempItemFilteredFromAttributes := Contract;
                TempItemFilteredFromAttributes.Insert();
                TempItemFilteredFromPickItem := Contract;
                TempItemFilteredFromPickItem.Insert();
            until Contract.Next() = 0;
    end;

    procedure SelectInItemList(var Contract: Record "Purchase Contract Header"): Text
    var
        ContractListPage: Page "purchase contract List";
    begin
        Contract.SetRange(Blocked, false);
        ContractListPage.SetTableView(Contract);
        ContractListPage.LookupMode(true);
        if ContractListPage.RunModal() = ACTION::LookupOK then
            exit(ContractListPage.GetSelectionFilter());
    end;
}

