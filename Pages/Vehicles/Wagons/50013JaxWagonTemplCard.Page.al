page 50013 "Wagon Templ. Card"
{
    Caption = 'Wagon Template';
    PageType = Card;
    SourceTable = "Wagon Template";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the template.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the description of the template.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example an item that is placed in quarantine.';
                }
            }
            group(Wagon)
            {
                Caption = 'Wagon';

                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether the item card represents a physical inventory unit (Inventory), a labor time unit (Service), or a physical unit that is not tracked in inventory (Non-Inventory).';
                }
                field(Serie; Rec.Serie)
                {
                    ApplicationArea = basic, suite;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = basic, suite;
                }
                field("Leasing Entity No."; Rec."Leasing Entity No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Leasing Entity Name"; Rec."Leasing Entity Name")
                {
                    ApplicationArea = basic, suite;
                }
                field("Producer No."; Rec."Producer No.")
                {
                    ApplicationArea = basic, suite;
                }
                field("Producer Name"; Rec."Producer Name")
                {
                    ApplicationArea = besic, suite;
                }
            }
            group(attributes)
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
                field("V Max Empty"; Rec."V Max Empty")
                {
                    ApplicationArea = basic, suite;
                }
                field("V Max Loaded"; Rec."V Max Loaded")
                {
                    ApplicationArea = basic, suite;
                }
                field("Cargo Volume"; Rec."Cargo Volume")
                {
                    ApplicationArea = basic, suite;
                }
                group(mass)
                {
                    field("Mh.P"; Rec."Mh.P")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Mh.Empty"; Rec."Mh.Empty")
                    {
                        ApplicationArea = basic, suite;
                    }
                    field("Mh.Loaded"; Rec."Mh.Loaded")
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
        }
    }

    actions
    {
        area(Navigation)
        {

            action(CopyTemplate)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Copy Template';
                Image = Copy;
                ToolTip = 'Copies all information to the current template from the selected one.';

                trigger OnAction()
                var
                    ItemTempl: Record "Wagon template";
                    ItemTemplList: Page "Wagon Templ. List";
                begin
                    Rec.TestField(Code);
                    ItemTempl.SetFilter(Code, '<>%1', Rec.Code);
                    ItemTemplList.LookupMode(true);
                    ItemTemplList.SetTableView(ItemTempl);
                    if ItemTemplList.RunModal() = Action::LookupOK then begin
                        ItemTemplList.GetRecord(ItemTempl);
                        Rec.CopyFromTemplate(ItemTempl);
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(CopyTemplate_Promoted; CopyTemplate)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        WagonSetup: Record "Wagon Setup";
    begin
        if Rec.Code <> '' then
            exit;

    end;

    trigger OnInit()
    begin
        InitControls();
    end;

    trigger OnOpenPage()
    begin
        EnablePlanningControls();
    end;

    var

    local procedure InitControls()
    begin

    end;

    local procedure EnablePlanningControls()
    var
    //PlanningParameters: Record "Planning Parameters";
    //PlanningGetParameters: Codeunit "Planning-Get Parameters";
    begin
        /*
        PlanningParameters."Reordering Policy" := Rec."Reordering Policy";
        PlanningParameters."Include Inventory" := Rec."Include Inventory";
        PlanningGetParameters.SetPlanningParameters(PlanningParameters);

        TimeBucketEnable := PlanningParameters."Time Bucket Enabled";
        SafetyLeadTimeEnable := PlanningParameters."Safety Lead Time Enabled";
        SafetyStockQtyEnable := PlanningParameters."Safety Stock Qty Enabled";
        ReorderPointEnable := PlanningParameters."Reorder Point Enabled";
        ReorderQtyEnable := PlanningParameters."Reorder Quantity Enabled";
        MaximumInventoryEnable := PlanningParameters."Maximum Inventory Enabled";
        MinimumOrderQtyEnable := PlanningParameters."Minimum Order Qty Enabled";
        MaximumOrderQtyEnable := PlanningParameters."Maximum Order Qty Enabled";
        OrderMultipleEnable := PlanningParameters."Order Multiple Enabled";
        IncludeInventoryEnable := PlanningParameters."Include Inventory Enabled";
        ReschedulingPeriodEnable := PlanningParameters."Rescheduling Period Enabled";
        LotAccumulationPeriodEnable := PlanningParameters."Lot Accum. Period Enabled";
        DampenerPeriodEnable := PlanningParameters."Dampener Period Enabled";
        DampenerQtyEnable := PlanningParameters."Dampener Quantity Enabled";
        OverflowLevelEnable := PlanningParameters."Overflow Level Enabled";
        */
    end;
}
