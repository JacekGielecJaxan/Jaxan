page 50011 "Wagon Card"
{
    Caption = 'Wagon Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Wagon;
    AdditionalSearchTerms = 'Customer Profile, Client Details, Buyer Information, Customer Data, Customer View, Client Profile, Customer Detail, Client Info';

    AboutTitle = 'About wagon details';
    AboutText = 'With the **Wagon Card** you manage information about a wagon. From here you can also drill down on past and ongoing activity.';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the wagon.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the wagon''s name. This name will appear on all documents for the wagon.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = '';
                    Visible = false;
                }
                field("No. 2"; Rec."No. 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field(EVN; Rec.EVN)
                {
                    ApplicationArea = Basic, Suite;
                    StyleExpr = StyleTxt;
                    ToolTip = '';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Serie; Rec.Serie)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = basic, suite;
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
                field("Status"; Rec."Status")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    StyleExpr = StyleTxt;
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
                    Importance = Additional;
                    ToolTip = 'Specifies when the wagon card was last modified.';
                    Editable = false;
                }
            }
            group("Contractor")
            {
                Caption = 'Contractor';
                group(DispatcherDetails)
                {
                    Caption = 'Dispatcher Details';
                    field("Dispatcher Code"; Rec."Dispatcher Code")
                    {
                        ApplicationArea = basic, suite;
                    }
                }
                group(ProducerDetails)
                {
                    Caption = 'Producer Details';
                    field("Producer No."; Rec."Producer No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = '';
                    }
                    field("Producer Name"; Rec."Producer Name")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = '';
                    }
                    field("Production Year"; Rec."Production Year")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = '';
                    }
                    field("Serial Number"; Rec."Serial Number")
                    {
                        ApplicationArea = all;
                    }
                }

                group(LeasingDetail)
                {
                    ShowCaption = false;
                    field("Leasing Entity No."; Rec."Leasing Entity No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = '';
                    }
                    field("Leasing Entity Name"; Rec."Leasing Entity Name")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }

            }


            group(Invoicing)
            {
                Caption = 'Invoicing';
                AboutTitle = 'Manage the wagon''s invoicing';
                AboutText = '';



            }
            group(attributes2)
            {
                Caption = 'Attributes';

                field(Length; Rec.Length)
                {
                    ApplicationArea = basic, suite;
                }
                field("Own Weight"; Rec."Own Weight")
                {
                    ApplicationArea = basic, suite;
                }
                field("V Max Empty"; Rec."V. Max. Empty")
                {
                    ApplicationArea = basic, suite;
                }
                field("V Max Loaded"; Rec."V. Max. Loaded")
                {
                    ApplicationArea = basic, suite;
                }
                field("Cargo Volume"; Rec."Cargo Volume")
                {
                    ApplicationArea = basic, suite;
                }
                group(mass)
                {
                    field("Mh.P"; Rec."Mh. P")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Mh.Empty"; Rec."Mh. Empty")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Mh.Loaded"; Rec."Mh. Loaded")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Shifting Mass"; Rec."Shifting Mass")
                    {
                        ApplicationArea = basic, suite;
                    }

                }
                group(mass2)
                {
                    field(A; Rec.A)
                    {
                        ApplicationArea = basic, suite;
                    }
                    field(B1; Rec.B1)
                    {
                        ApplicationArea = basic, suite;
                    }
                    field(B2; Rec.B2)
                    {
                        ApplicationArea = basic, suite;
                    }
                    field(C2; Rec.C2)
                    {
                        ApplicationArea = basic, suite;
                    }
                    field(C3; Rec.C3)
                    {
                        ApplicationArea = basic, suite;
                    }
                    field(C4; Rec.C4)
                    {
                        ApplicationArea = basic, suite;
                    }
                    field(D2; Rec.D2)
                    {
                        ApplicationArea = basic, suite;
                    }
                    field(D3; Rec.D3)
                    {
                        ApplicationArea = basic, suite;
                    }
                    field(D4; Rec.D4)
                    {
                        ApplicationArea = basic, suite;
                    }
                }

            }
            group(components)
            {
                Caption = 'Components';
                field("Brake Adjustment System Code"; Rec."Brake Adjustment System Code")
                {
                    ApplicationArea = basic, suite;
                }
                field("Valve Type Code"; Rec."Valve Type Code")
                {
                    ApplicationArea = basic, suite;
                }
                field("Inset Code"; Rec."Inset Code")
                {
                    ApplicationArea = basic, suite;
                }
                field("Trolley Type Code"; Rec."Trolley Type Code")
                {
                    ApplicationArea = basic, suite;
                }
                field("Wheelset Type Code"; Rec."Wheelset Type Code")
                {
                    ApplicationArea = basic, suite;
                }
                field("Bumper Type Code"; Rec."Bumper Type Code")
                {
                    ApplicationArea = basic, suite;
                }
            }
            group(Planning)
            {
                Caption = 'Planning';
                field("DSU Code"; Rec."DSU Code")
                {
                    ApplicationArea = DSU, Planning;
                    Caption = 'DSU Code';
                }

                field(Cycle; Rec.Cycle)
                {
                    ApplicationArea = basic, suite;
                }
            }
            group(Statistics)
            {
                Caption = 'Statistics';
                Editable = false;

            }
        }
        area(factboxes)
        {
            part(Control149; "Wagon Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::Wagon),
                              "No." = field("No.");
            }
            part(WagonStatisticsFactBox; "Wagon Statistics FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
            }
            part(Control1905532107; "Dimensions FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Table ID" = const(18),
                              "No." = field("No.");
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
            group(Wagon)
            {
                Caption = 'Wagon';
                Image = DataEntry;
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
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
                action("&Exclusion Entries")
                {
                    ApplicationArea = Suite;
                    Caption = '&Exclusion Entries';
                    Image = BinLedger;
                    RunObject = Page "Wagon Exclusion Entries";
                    RunPageLink = "Wagon No." = field("No.");
                    RunPageView = sorting("Wagon No.");
                    ToolTip = '';
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
                Caption = 'Item';

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
                action("Ca&talog Items")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ca&talog Items';
                    Image = NonStockItem;
                    RunObject = Page "Catalog Item List";
                    ToolTip = 'View the list of items that you do not carry in inventory. ';
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
    begin
        if GuiAllowed() then
            OnAfterGetCurrRecordFunc()
        else
            OnAfterGetCurrRecordFuncBackground();
    end;

    local procedure OnAfterGetCurrRecordFunc()
    var
        WorkflowStepInstance: Record "Workflow Step Instance";
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
    begin
        if NewMode then
            CreateWagonFromTemplate()
        else
            StartBackgroundCalculations();
        ActivateFields();

    end;

    local procedure OnAfterGetCurrRecordFuncBackground()
    begin
        //Rec.CalcFields("Sales (LCY)", "Profit (LCY)", "Inv. Discounts (LCY)", "Payments (LCY)");
        //CustomerMgt.CalculateStatisticsWithCurrentCustomerValues(Rec, AdjmtCostLCY, AdjCustProfit, AdjProfitPct, CustInvDiscAmountLCY, CustPaymentsLCY, CustSalesLCY, CustProfit);
    end;

    trigger OnInit()
    begin

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
    end;

    trigger OnOpenPage()
    begin
        OnBeforeOnOpenPage(Rec);

        if Rec.GetFilter("Date Filter") = '' then
            Rec.SetRange("Date Filter", 0D, WorkDate());
        if GuiAllowed() then
            OnOpenPageFunc()
        else
            OnOpenBackground();
        OnAfterOnOpenPage(Rec, xRec);
    end;

    local procedure OnOpenPageFunc()
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        EnvironmentInfo: Codeunit "Environment Information";
    begin

        SetNoFieldVisible();


        IsSaaS := EnvironmentInfo.IsSaaS();

        //SetWorkFlowEnabled();
    end;

    local procedure OnOpenBackground()
    begin
        //Rec.SetAutoCalcFields("Sales (LCY)", "Profit (LCY)", "Inv. Discounts (LCY)", "Payments (LCY)");
    end;

    local procedure StartBackgroundCalculations()
    var
        //WagonCardCalculations: Codeunit "Wagon Card Calculations";
        Args: Dictionary of [Text, Text];
    begin
        if Rec."No." = PrevWagonNo then
            exit;
        PrevWagonNo := Rec."No.";
        if (BackgroundTaskId <> 0) then
            CurrPage.CancelBackgroundTask(BackgroundTaskId);

        //CurrPage.EnqueueBackgroundTask(BackgroundTaskId, Codeunit::"Wagon Card Calculations", Args);

        //Session.LogMessage('0000D4Q', StrSubstNo(PageBckGrndTaskStartedTxt, Rec."No."), Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', WagonCardServiceCategoryTxt);
    end;


    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        //        WagonCardCalculations: Codeunit "Wagon Card Calculations";
        DictionaryValue: Text;
    begin
        if (TaskId = BackgroundTaskId) then begin
            if Results.Count() = 0 then
                exit;

            //if TryGetDictionaryValueFromKey(Results, WagonCardCalculations.GetAvgDaysPastDueDateLabel(), DictionaryValue) then
            //    Evaluate(DaysPastDueDate, DictionaryValue);


            //AttentionToPaidDay := DaysPastDueDate > 0;
            //TotalMoneyOwed := Rec."Balance (LCY)" + ExpectedMoneyOwed;

            //Session.LogMessage('0000D4R', PageBckGrndTaskCompletedTxt, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', CustomerCardServiceCategoryTxt);
        end;
    end;

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


    local procedure ActivateFields()
    begin
        OnAfterActivateFields(Rec);
    end;


    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
    end;

    procedure RunReport(ReportNumber: Integer; WagonNumber: Code[20])
    var
        Wagon: Record Wagon;
    begin
        Wagon.SetRange("No.", WagonNumber);
        REPORT.RunModal(ReportNumber, true, true, Wagon);
    end;

    local procedure CreateWagonFromTemplate()
    var
        Wagon: Record Wagon;
        WagonTemplMgt: Codeunit "Wagon Templ. Mgt.";
    begin
        OnBeforeCreateWagonFromTemplate(NewMode, Wagon);

        if not NewMode then
            exit;
        NewMode := false;
        Rec.Copy(Wagon);
        OnCreateWagonFromTemplateOnBeforeCurrPageUpdate(Rec);
        CurrPage.Update();
    end;

    local procedure InitPowerAutomateTemplateVisibility()
    var
        FeatureKey: Record "Feature Key";
    begin
        //    PowerAutomateTemplatesEnabled := true;
        //    if FeatureKey.Get(PowerAutomateTemplatesFeatureLbl) then
        //        if FeatureKey.Enabled <> FeatureKey.Enabled::"All Users" then
        //            PowerAutomateTemplatesEnabled := false;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterActivateFields(var Wagon: Record Wagon)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterOnOpenPage(var Wagon: Record Wagon; xWagon: Record Wagon)
    begin
    end;

    [IntegrationEvent(false, false)]
    [Scope('OnPrem')]
    procedure SetCaption(var InText: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateWagonFromTemplate(var NewMode: Boolean; var Wagon: Record Wagon)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCreateWagonFromTemplateOnBeforeCurrPageUpdate(var Wagon: Record Wagon)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeOnOpenPage(var Wagon: Record Wagon)
    begin
    end;
}

