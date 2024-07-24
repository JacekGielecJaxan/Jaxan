page 50010 "Wagon List"
{
    //AdditionalSearchTerms = 'Product, Finished Good, Component, Raw Material, Assembly Item, Product Details, Merchandise Profile, Item Info, Commodity Info, Product Data, Article Details, Goods Profile, Item Detail';
    AdditionalSearchTerms = 'Product, Finished Good, Component, Raw Material, Assembly Item, Product Details, Merchandise Profile, Item Info, Commodity Info, Product Data, Article Details, Goods Profile, Item Detail';
    ApplicationArea = Basic, Suite;
    Caption = 'Wagons';
    CardPageID = "Wagon Card";
    Editable = false;
    PageType = List;
    QueryCategory = 'Wagon List';
    SourceTable = Wagon;
    UsageCategory = Lists;

    AboutTitle = 'About wagons';
    //TODO: poprawic tekst
    //AboutText = '**Wagons** represent the Vehicles and services you buy and sell. For each item, you can manage the default sales and purchase prices used when creating documents, as well as track inventory numbers. With [Item Templates](?page=1383 "Opens the Item Templates") you can quickly create new items having common details defined by the template.';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Caption = 'Wagon';
                field(EVN; Rec.EVN)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a number to identify the wagon.';
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("No. 2"; Rec."No. 2")
                {
                    ApplicationArea = All;
                    ToolTip = '';
                    Visible = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = '';
                    Visible = false;
                }

                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field(Serie; Rec.Serie)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Operating Status Group Code"; Rec."Operating Status Group Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ToolTip = '';
                }
                field("Operating Status Code"; Rec."Operating Status Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ToolTip = '';
                }
                field("Status TM Code"; Rec."Status TM Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ToolTip = '';
                }
                field("Dispatcher Code"; Rec."Dispatcher Code")
                {
                    ApplicationArea = all;
                }
                field(ECM; Rec.ECM)
                {
                    ApplicationArea = all;
                }
                field(Cycle; Rec.Cycle)
                {
                    ApplicationArea = all;
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = all;
                }
                field("Next Review Date"; Rec."Next Review Date")
                {
                    ApplicationArea = all;
                }
                field("Prorogation Code"; Rec."Prorogation Code")
                {
                    ApplicationArea = all;
                }

                field("DSU Code"; Rec."DSU Code")
                {
                    ApplicationArea = all;
                }

                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = all;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = all;
                }
                field("Leasing Entity No."; Rec."Leasing Entity No.")
                {
                    ApplicationArea = all;
                }
                field("Leasing Entity Name"; Rec."Leasing Entity Name")
                {
                    ApplicationArea = all;
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = all;
                }
                field("Contract Validity Date"; Rec."Contract Validity Date")
                {
                    ApplicationArea = all;
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = all;
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = all;
                }
                field("Institute Code"; Rec."Institute Code")
                {
                    ApplicationArea = all;
                }
                field("Station Code"; Rec."Station Code")
                {
                    ApplicationArea = all;
                }
                field("Track No."; Rec."Track No.")
                {
                    ApplicationArea = all;
                }

                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = basic, suite;
                    ToolTip = '';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a default text to describe the wagon on related documents.';
                    Visible = false;
                }
                field("Created From Template Code"; Rec."Created From Template Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the item was created from a template.';
                    Visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that transactions with the item cannot be posted, for example, because the item is in quarantine.';
                    Visible = true;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies when the item card was last modified.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(PowerBIEmbeddedReportPart; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            /*
            part(Control1901314507; "Wagon Invoicing FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter");
            }
            */
            /*
                        part(Control1903326807; "Wagon Replenishment FactBox")
                        {
                            ApplicationArea = Basic, Suite;
                            SubPageLink = "No." = field("No."),
                                          "Date Filter" = field("Date Filter");
                            Visible = false;
                        }
                        */
            /*
            part(Control1906840407; "Wagon Planning FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter");
            }
            */
            /*
            part(Control1901796907; "Wagon Warehouse FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter");
                Visible = false;
            }
            */
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::Wagon), "No." = field("No.");
            }
            /*
            part(ItemAttributesFactBox; "Wagon Attributes Factbox")
            {
                ApplicationArea = Basic, Suite;
            }
            */
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
            group(Wagon)
            {
                Caption = 'Wagon';
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
                        RunObject = Page "Wagon Entries";
                        RunPageLink = "Wagon No." = field("No.");
                        RunPageView = sorting("Wagon No.")
                                      order(descending);
                        Scope = Repeater;
                        ShortCutKey = 'Ctrl+F7';
                        ToolTip = 'View the history of transactions that have been posted for the selected record.';
                    }
                    action("&Kilometers Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = '&Kilometers Entries';
                        Image = PhysicalInventoryLedger;
                        RunObject = Page "Wagon Km Entries";
                        RunPageLink = "Wagon No." = field("No.");
                        RunPageView = sorting("Wagon No.");
                        Scope = Repeater;
                        ToolTip = '';
                    }
                    action("&Review Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = '&Review Entries';
                        Image = ReservationLedger;
                        RunObject = Page "Wagon Review Entries";
                        RunPageLink = "Wagon No." = field("No.");
                        RunPageView = sorting("Wagon No.", "Date");
                        ToolTip = '';
                    }
                    action("&Status Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = '&Status Entries';
                        Image = ValueLedger;
                        RunObject = Page "Wagon Status Entries";
                        RunPageLink = "Wagon No." = field("No.");
                        RunPageView = sorting("Wagon No.");
                        ToolTip = '';
                    }
                    action("Review &Plan Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Review &Plan Entries';
                        Image = ItemTrackingLedger;
                        RunObject = Page "Wagon Plan Review Entries";
                        RunPageLink = "Wagon No." = field("No.");
                        RunPageView = sorting("Wagon No.", "Planned Date");

                        ToolTip = '';
                    }
                    action("&Prorogation Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = '&Prorogation Entries';
                        Image = BinLedger;
                        RunObject = Page "Wagon Prorogation Entries";
                        RunPageLink = "Wagon No." = field("No.");
                        RunPageView = sorting("Wagon No.");
                        ToolTip = '';
                    }
                    action("&Approval Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = '&Approval Entries';
                        Image = BinLedger;
                        RunObject = Page "Wagon Approval Entries";
                        RunPageLink = "Wagon No." = field("No.");
                        RunPageView = sorting("Wagon No.");
                        ToolTip = '';
                    }
                }
            }
            group(FaultsDetails)
            {
                Caption = 'Faults';
                Image = FaultDefault;
                action(Faults)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Faults';
                    Image = Price;
                    RunObject = Page "Wagon Fault Entries";
                    RunPageLink = "Wagon No." = field("No.");
                    RunPageView = sorting("Wagon No.");
                    ToolTip = '';
                }
                action(PostFaults)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Faults';
                    Image = Price;
                    RunObject = Page "Wagon Post Fault Entries";
                    RunPageLink = "Wagon No." = field("No.");
                    RunPageView = sorting("Wagon No.");
                    ToolTip = '';
                }
            }
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";

                action(CopyItem)
                {
                    AccessByPermission = TableData Wagon = I;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Copy Wagon';
                    Image = Copy;
                    ToolTip = 'Create a copy of the current wagon.';

                    trigger OnAction()
                    begin
                        //TODO: Oprogramowac
                        //       CODEUNIT.Run(CODEUNIT::"Copy Wagon", Rec);
                    end;
                }
            }
            action("Wagon Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Wagon Journal';
                Image = Journals;
                //TODO:Oprogramowac
                //RunObject = Page "Wagon Journal";
                ToolTip = 'Open a list of journals.';
            }
            action(ApplyTemplate)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Apply Template';
                Image = ApplyTemplate;
                ToolTip = 'Apply a template to update one or more entities with your standard settings for a certain type of entity.';

                trigger OnAction()
                var
                    Wagon: Record Wagon;
                    WagonTemplMgt: Codeunit "Wagon Templ. Mgt.";
                begin
                    CurrPage.SetSelectionFilter(Wagon);
                    WagonTemplMgt.UpdateItemsFromTemplate(Wagon);
                end;
            }
        }
        area(reporting)
        {
            action(PrintLabel)
            {
                AccessByPermission = TableData Item = I;
                ApplicationArea = Basic, Suite;
                Image = Print;
                Caption = 'Print Label';
                ToolTip = 'Print Label';
                /*
                                trigger OnAction()
                                var
                                    Item: Record Item;
                                    ItemGTINLabel: Report "Item GTIN Label";
                                begin
                                    Item := Rec;
                                    CurrPage.SetSelectionFilter(Item);
                                    ItemGTINLabel.SetTableView(Item);
                                    ItemGTINLabel.RunModal();
                                end;
                                */
            }

            group(Inventory)
            {
                Caption = 'Inventory';

                group(Reports)
                {
                    Caption = 'Wagon Statistics';
                    Image = "Report";

                }
                group("Finance Reports")
                {
                    Caption = 'Finance Reports';
                    Image = "Report";

                }
            }
        }
        area(navigation)
        {
            group(Action126)
            {
                Caption = 'Wagon';

                action(Attributes)
                {
                    AccessByPermission = TableData "Item Attribute" = R;
                    ApplicationArea = Suite;
                    Caption = 'Attributes';
                    Image = Category;
                    Scope = Repeater;
                    ToolTip = 'View or edit the item''s attributes, such as color, size, or other characteristics that help to describe the item.';

                    /*
                    trigger OnAction()
                    begin
                        PAGE.RunModal(PAGE::"Item Attribute Value Editor", Rec);
                        CurrPage.SaveRecord();
                        CurrPage.ItemAttributesFactBox.PAGE.LoadItemAttributesData(Rec."No.");
                    end;
                    */
                }

            }
            group(Availability)
            {
                Caption = 'Availability';
                Image = Item;
                action("Items b&y Location")
                {
                    AccessByPermission = TableData Location = R;
                    ApplicationArea = Location;
                    Caption = 'Items b&y Location';
                    Image = ItemAvailbyLoc;
                    ToolTip = 'Show a list of items grouped by location.';
                    /*
                                        trigger OnAction()
                                        begin
                                            PAGE.Run(PAGE::"Items by Location", Rec);
                                        end;
                                        */
                }
                group("&Item Availability by")
                {
                    Caption = '&Item Availability by';
                    Image = ItemAvailability;

                    action("<Action5>")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Event';
                        Image = "Event";
                        ToolTip = 'View how the actual and the projected available balance of an item will develop over time according to supply and demand events.';
                        /*
                                                trigger OnAction()
                                                begin
                                                    ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByEvent());
                                                end;
                                                */
                    }
                    action(Period)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Period';
                        Image = Period;
                        /*
                        RunObject = Page "Item Availability by Periods";
                        RunPageLink = "No." = field("No."),
                                      "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                      "Location Filter" = field("Location Filter"),
                                      "Drop Shipment Filter" = field("Drop Shipment Filter"),
                                      "Variant Filter" = field("Variant Filter");
                        */
                        ToolTip = 'Show the projected quantity of the item over time according to time periods, such as day, week, or month.';
                    }
                    action(Variant)
                    {
                        ApplicationArea = Planning;
                        Caption = 'Variant';
                        Image = ItemVariant;
                        /*
                        RunObject = Page "Item Availability by Variant";
                        RunPageLink = "No." = field("No."),
                                      "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                      "Location Filter" = field("Location Filter"),
                                      "Drop Shipment Filter" = field("Drop Shipment Filter"),
                                      "Variant Filter" = field("Variant Filter");
                        */
                        ToolTip = 'View the current and projected quantity of the item for each variant.';
                    }
                    action(Location)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Location';
                        Image = Warehouse;
                        /*
                        RunObject = Page "Item Availability by Location";
                        RunPageLink = "No." = field("No."),
                                      "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                      "Location Filter" = field("Location Filter"),
                                      "Drop Shipment Filter" = field("Drop Shipment Filter"),
                                      "Variant Filter" = field("Variant Filter");
                        */
                        ToolTip = 'View the actual and projected quantity of the item per location.';
                    }
                }
            }
            group(Sales)
            {
                Caption = 'S&ales';
                Image = Sales;
                /*
                action(Sales_Prices)
                {
                    ApplicationArea = Suite;
                    Visible = false;
                    Caption = 'Sales Prices';
                    Image = Price;
                    ToolTip = 'View or set up sales prices for the item. An item price is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '18.0';

                    trigger OnAction()
                    begin
                        
                    end;
                }
                action(Sales_LineDiscounts)
                {
                    ApplicationArea = Suite;
                    Visible = false;
                    Caption = 'Sales Discounts';
                    Image = LineDiscount;
                    ToolTip = 'View or set up sales discounts for the item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '18.0';

                    trigger OnAction()
                    begin
                        
                    end;
                }
                */
            }
            group(Purchases)
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action("Ven&dors")
                {
                    ApplicationArea = Planning;
                    Caption = 'Ven&dors';
                    Image = Vendor;
                    RunObject = Page "Item Vendor Catalog";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'View the list of vendors who can supply the item, and at which lead time.';
                }
                action(Prices)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Purchase Prices';
                    Image = Price;
                    Visible = false;
                    RunObject = Page "Purchase Prices";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'View or set up purchase prices for the item. An item price is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
                }
                action("Line Discounts")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Purchase Discounts';
                    Image = LineDiscount;
                    Visible = false;
                    RunObject = Page "Purchase Line Discounts";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'View or set up purchase discounts for the item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '18.0';
                }
                action(Action40)
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Orders';
                    Image = Document;
                    RunObject = Page "Purchase Orders";
                    RunPageLink = Type = const(Item),
                                  "No." = field("No.");
                    RunPageView = sorting("Document Type", Type, "No.");
                    ToolTip = 'View a list of ongoing purchase orders for the item.';
                }
            }

            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
                action("Ser&vice Items")
                {
                    ApplicationArea = Service;
                    Caption = 'Ser&vice Items';
                    Image = ServiceItem;
                    //RunObject = Page "Service Items";
                    //RunPageLink = "Item No." = field("No.");
                    //RunPageView = sorting("Item No.");
                    ToolTip = 'View instances of the item as service items, such as machines that you maintain or repair for customers through service orders. ';
                }
                action(Troubleshooting)
                {
                    AccessByPermission = TableData "Service Header" = R;
                    ApplicationArea = Service;
                    Caption = 'Troubleshooting';
                    Image = Troubleshoot;
                    ToolTip = 'View or edit information about technical problems with a service item.';
                    /*
                                        trigger OnAction()
                                        var
                                            TroubleshootingHeader: Record "Troubleshooting Header";
                                        begin
                                            TroubleshootingHeader.ShowForItem(Rec);
                                        end;
                                        */
                }
                action("Troubleshooting Setup")
                {
                    ApplicationArea = Service;
                    Caption = 'Troubleshooting Setup';
                    Image = Troubleshoot;
                    //RunObject = Page "Troubleshooting Setup";
                    //RunPageLink = Type = const(Item),
                    //              "No." = field("No.");
                    ToolTip = 'View or edit your settings for troubleshooting service items.';
                }
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
        FilteredItem: Record Item;
    begin
        //SetWorkflowManagementEnabledState();

        CurrPage.SetSelectionFilter(FilteredItem);
        CurrPage.PowerBIEmbeddedReportPart.PAGE.SetFilterToMultipleValues(FilteredItem, FilteredItem.FieldNo("No."));
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
        CurrPage.PowerBIEmbeddedReportPart.PAGE.InitPageRatio(PowerBIServiceMgt.GetFactboxRatio());
        CurrPage.PowerBIEmbeddedReportPart.PAGE.SetPageContext(CurrPage.ObjectId(false));
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

    var
        WagonSetup: Record "Wagon Setup";
        CalendarMgmt: Codeunit "Calendar Management";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //WagonMgt: Codeunit "Wagon Mgt.";
        LinkedResourceNo: Code[20];
        StyleTxt: Text;
        BlockedFilterApplied: Boolean;
        NoFieldVisible: Boolean;
        NewMode: Boolean;
        CaptionTxt: Text;
        IsSaaS: Boolean;
        PrevWagonNo: Code[20];
        BackgroundTaskId: Integer;
        TempItemFilteredFromAttributes: Record Wagon temporary;
        TempItemFilteredFromPickItem: Record Wagon temporary;
        PowerBIServiceMgt: Codeunit "Power BI Service Mgt.";
        ClientTypeManagement: Codeunit "Client Type Management";
        RunOnTempRec: Boolean;
        EventFilter: Text;

    procedure SelectActiveItems(): Text
    var
        Wagon: Record Wagon;
    begin
        Wagon.SetRange(Status, Rec.Status::Active);
        exit(SelectInItemList(Wagon));
    end;

    procedure SelectActiveItemsForService(var Wagon: Record Wagon): Text
    begin
        Wagon.SetRange("Service Blocked", false);
        exit(SelectInItemList(Wagon));
    end;

    procedure SelectNewItems(): Text
    var
        Wagon: Record Wagon;
    begin
        Wagon.SetRange(Status, Rec.Status::New);
        exit(SelectInItemList(Wagon));
    end;

    procedure GetSelectionFilter(): Text
    var
        Wagon: Record Wagon;
        SelectionFilterManagement: Codeunit "Selection Filter Mgt Jax";
    begin
        CurrPage.SetSelectionFilter(Wagon);
        exit(SelectionFilterManagement.GetSelectionFilterForWagon(Wagon));
    end;

    procedure SetSelection(var Wagon: Record Wagon)
    begin
        CurrPage.SetSelectionFilter(Wagon);
    end;



    procedure SetTempFilteredItemRec(var Wagon: Record Wagon)
    begin
        TempItemFilteredFromAttributes.Reset();
        TempItemFilteredFromAttributes.DeleteAll();

        TempItemFilteredFromPickItem.Reset();
        TempItemFilteredFromPickItem.DeleteAll();

        RunOnTempRec := true;

        if Wagon.FindSet() then
            repeat
                TempItemFilteredFromAttributes := Wagon;
                TempItemFilteredFromAttributes.Insert();
                TempItemFilteredFromPickItem := Wagon;
                TempItemFilteredFromPickItem.Insert();
            until Wagon.Next() = 0;
    end;

    procedure SelectInItemList(var Wagon: Record Wagon): Text
    var
        WagonListPage: Page "Wagon List";
    begin
        Wagon.SetRange(Blocked, false);
        WagonListPage.SetTableView(Wagon);
        WagonListPage.LookupMode(true);
        if WagonListPage.RunModal() = ACTION::LookupOK then
            exit(WagonListPage.GetSelectionFilter());
    end;
}

