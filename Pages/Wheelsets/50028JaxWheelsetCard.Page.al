page 50028 "Wheelset Card"
{
    Caption = 'Wheelset Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Wheelset;
    //AdditionalSearchTerms = 'Customer Profile, Client Details, Buyer Information, Customer Data, Customer View, Client Profile, Customer Detail, Client Info';

    AboutTitle = 'About wheelset details';
    AboutText = 'With the **Wheelset Card** you manage information about a wheelset. From here you can also drill down on past and ongoing activity.';

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
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = all;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = '';
                    Visible = false;
                }
                field("Wheelset Type"; Rec."Wheelset Type")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Wheel Type"; Rec."Wheel Type")
                {
                    ApplicationArea = Basic, Suite;
                }


                field("Axle Box Type"; Rec."Axle Box Type")
                {
                    ApplicationArea = basic, suite;
                }

                field("Max. Axle Load"; Rec."Max. Axle Load")
                {
                    ApplicationArea = all;
                }

                field("Status"; Rec."Status")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    StyleExpr = StyleTxt;
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
            group(Owner)
            {
                Caption = 'Owner';

                field("Owner No."; Rec."Owner No.")
                {
                    ApplicationArea = all;
                }
                field("Owner Name"; Rec."Owner Name")
                {
                    ApplicationArea = all;
                }

            }
            group("Contractor")
            {
                Caption = 'Contractor';
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
                group(BearingProducer)
                {
                    Caption = 'Bearing Producer';
                    field("Bearing Producer No."; Rec."Bearing Producer No.")
                    {
                        ApplicationArea = all;
                    }
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

                group(WhereIs)
                {
                    field("Vehicle No."; Rec."Vehicle No.")
                    {
                        ApplicationArea = all;
                    }
                    field(Position; Rec.Position)
                    {
                        ApplicationArea = all;
                    }
                    field(Mileage; Rec.Mileage)
                    {
                        ApplicationArea = all;
                    }
                }
                group(Review)
                {
                    Caption = 'Review';
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
                }
                group(Measurement)
                {
                    Caption = 'Measurement';
                    field("Set Diameter"; Rec."Set Diameter")
                    {
                        ApplicationArea = all;
                    }
                    field("Plug Diameter"; Rec."Plug Diameter")
                    {
                        ApplicationArea = all;
                    }
                }

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::Wagon),
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
                        ToolTip = 'View the history of transactions that have been posted for the selected record.';
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
                    Caption = 'Wheelset Statistics';
                    Image = "Report";

                }
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
    begin

    end;

    local procedure OnAfterGetCurrRecordFuncBackground()
    begin
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

    [IntegrationEvent(true, false)]
    local procedure OnAfterActivateFields(var Wheelset: Record Wheelset)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterOnOpenPage(var Wheelset: Record Wheelset; xWheelset: Record Wheelset)
    begin
    end;

    [IntegrationEvent(false, false)]
    [Scope('OnPrem')]
    procedure SetCaption(var InText: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateWagonFromTemplate(var NewMode: Boolean; var Wheelset: Record Wheelset)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCreateWagonFromTemplateOnBeforeCurrPageUpdate(var Wheelset: Record Wheelset)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeOnOpenPage(var Wheelset: Record Wheelset)
    begin
    end;
}

