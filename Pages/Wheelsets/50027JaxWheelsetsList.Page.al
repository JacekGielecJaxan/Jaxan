page 50027 "Wheelsets List"
{
    //AdditionalSearchTerms = 'Product, Finished Good, Component, Raw Material, Assembly Item, Product Details, Merchandise Profile, Item Info, Commodity Info, Product Data, Article Details, Goods Profile, Item Detail';
    //AdditionalSearchTerms = 'Product, Finished Good, Component, Raw Material, Assembly Item, Product Details, Merchandise Profile, Item Info, Commodity Info, Product Data, Article Details, Goods Profile, Item Detail';
    ApplicationArea = Basic, Suite;
    Caption = 'Wheelsets';
    CardPageID = "Wheelset Card";
    Editable = false;
    PageType = List;
    QueryCategory = 'Wheelsets List';
    SourceTable = Wheelset;
    UsageCategory = Lists;

    AboutTitle = 'About wheelset';
    //TODO: poprawic tekst
    //AboutText = '**Wagons** represent the Vehicles and services you buy and sell. For each item, you can manage the default sales and purchase prices used when creating documents, as well as track inventory numbers. With [Item Templates](?page=1383 "Opens the Item Templates") you can quickly create new items having common details defined by the template.';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Caption = 'Wheelset';
                field(EVN; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = '';
                    Visible = false;
                }

                field("Wheelset Type"; Rec."Wheelset Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = '';
                }
                field("Wheel Type"; Rec."Wheel Type")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Axle Box Type"; Rec."Axle Box Type")
                {
                    ApplicationArea = basic, suite;
                }
                /// <summary>
                /// max nacisk osi
                /// </summary>
                field("Max. Axle Load"; Rec."Max. Axle Load")
                {
                    ApplicationArea = basic, suite;
                }
                /// <summary>
                /// srednica zestawu
                /// </summary>
                field("Set Diameter"; Rec."Set Diameter")
                {
                    ApplicationArea = basic, suite;
                }
                /// <summary>
                /// srednica czopu
                /// </summary>
                field("Plug Diameter"; Rec."Plug Diameter")
                {
                    ApplicationArea = basic, suite;
                }
                field(Mileage; Rec.Mileage)
                {
                    ApplicationArea = basic, suite;
                }
                field("Owner No."; Rec."Owner No.")
                {
                    ApplicationArea = basic, suite;
                }
                field("Bearing Producer No."; Rec."Bearing Producer No.")
                {
                    ApplicationArea = basic, suite;
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
                field("Last Review Code"; Rec."Last Review Code")
                {
                    ApplicationArea = all;
                }
                field("Next Review Date"; Rec."Next Review Date")
                {
                    ApplicationArea = all;
                }

                field("DSU Code"; Rec."DSU Code")
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

                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies when the item card was last modified.';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Wheelset)
            {
                Caption = 'Wheelset';
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
                        RunObject = Page "Wheelset Entries";
                        RunPageLink = "Wheelset No." = field("No.");
                        RunPageView = sorting("Wheelset No.")
                                      order(descending);
                        Scope = Repeater;
                        ShortCutKey = 'Ctrl+F7';
                        //ToolTip = 'View the history of transactions that have been posted for the selected record.';
                    }
                    action("&Kilometers Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = '&Kilometers Entries';
                        Image = PhysicalInventoryLedger;
                        RunObject = Page "Wheelset Km Entries";
                        RunPageLink = "Wheelset No." = field("No.");
                        RunPageView = sorting("Wheelset No.");
                        Scope = Repeater;
                        ToolTip = '';
                    }
                    action("&Review Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = '&Review Entries';
                        Image = ReservationLedger;
                        RunObject = Page "Wheelset Review Entries";
                        RunPageLink = "Wheelset No." = field("No.");
                        RunPageView = sorting("Wheelset No.", "Date");
                        ToolTip = '';
                    }
                    action("Review &Plan Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Review &Plan Entries';
                        Image = ItemTrackingLedger;
                        RunObject = Page "Wheelset Plan Review Entries";
                        RunPageLink = "Wheelset No." = field("No.");
                        RunPageView = sorting("Wheelset No.", "Planned Date");

                        ToolTip = '';
                    }
                    action("&Approval Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = '&Approval Entries';
                        Image = BinLedger;
                        RunObject = Page "Wheelset Approval Entries";
                        RunPageLink = "Wheelset No." = field("No.");
                        RunPageView = sorting("Wheelset No.");
                        ToolTip = '';
                    }
                }
            }
            action("Wheelset Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Wheelset Journal';
                Image = Journals;
                //TODO:Oprogramowac
                //RunObject = Page "Wagon Journal";
                ToolTip = 'Open a list of journals.';
            }

        }
    }

    trigger OnAfterGetCurrRecord()
    var
        FilteredItem: Record Item;
    begin
        //SetWorkflowManagementEnabledState();

        CurrPage.SetSelectionFilter(FilteredItem);
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

    var
        WagonSetup: Record "Wheelset Setup";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        LinkedResourceNo: Code[20];
        StyleTxt: Text;
        BlockedFilterApplied: Boolean;
        NoFieldVisible: Boolean;
        NewMode: Boolean;
        CaptionTxt: Text;
        IsSaaS: Boolean;
        PrevWagonNo: Code[20];
        BackgroundTaskId: Integer;
        TempItemFilteredFromAttributes: Record Wheelset temporary;
        TempItemFilteredFromPickItem: Record Wheelset temporary;
        ClientTypeManagement: Codeunit "Client Type Management";
        RunOnTempRec: Boolean;
        EventFilter: Text;

    procedure GetSelectionFilter(): Text
    var
        Wheelset: Record Wheelset;
        SelectionFilterManagement: Codeunit "Selection Filter Mgt Jax";
    begin
        CurrPage.SetSelectionFilter(Wheelset);
        exit(SelectionFilterManagement.GetSelectionFilterForWheelset(Wheelset));
    end;

    procedure SetSelection(var Wheelset: Record Wheelset)
    begin
        CurrPage.SetSelectionFilter(Wheelset);
    end;



    procedure SetTempFilteredItemRec(var Wheelset: Record Wheelset)
    begin
        TempItemFilteredFromAttributes.Reset();
        TempItemFilteredFromAttributes.DeleteAll();

        TempItemFilteredFromPickItem.Reset();
        TempItemFilteredFromPickItem.DeleteAll();

        RunOnTempRec := true;

        if Wheelset.FindSet() then
            repeat
                TempItemFilteredFromAttributes := Wheelset;
                TempItemFilteredFromAttributes.Insert();
                TempItemFilteredFromPickItem := Wheelset;
                TempItemFilteredFromPickItem.Insert();
            until Wheelset.Next() = 0;
    end;
}

