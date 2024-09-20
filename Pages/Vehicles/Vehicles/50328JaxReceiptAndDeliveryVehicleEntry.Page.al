page 50328 "Pick And Drop Vehicle Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Receipt and Delivery Vehicle Entries';
    DataCaptionFields = "Vehicle No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Pick And Drop Vehicle Entry" = m;
    SourceTable = "Pick And Drop Vehicle Entry";
    SourceTableView = sorting("Vehicle No.", "Date") order(descending);
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Date"; Rec."Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Time"; Rec."Time")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Vehicle No. 2"; Rec."Vehicle No. 2")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }

                //poziom paliwa
                field("Fuel Level"; rec."Fuel Level")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //czystosc kabiny
                field("Cabin Cleanliness"; rec."Cabin Cleanliness")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //czystosc przedzialu kabinowego
                field("Engine Compartment Cleanliness"; rec."Engine Compartment Cleanliness")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //Ilosc oleju silnikowego
                field("Engine Oil (L)"; rec."Engine Oil (L)")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //Ilosc oleju silnikowego - rezerwa
                field("Engine Oil (L) - Reserve"; rec."Engine Oil (L) - Reserve")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //Ilosc plynu chlodzacego
                field("Coolant (L)"; rec."Coolant (L)")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //Ilosc plynu chlodzacego - rezerwa
                field("Coolant (L) - Reserve"; rec."Coolant (L) - Reserve")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //Poziom piasku w piasecznicach
                field("Sand Level"; rec."Sand Level")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //Poziom piasku w piasecznicach - rezerwa
                field("Sand Level - Reserve"; rec."Sand Level - Reserve")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //ilosc klockow hamulcowych do wymiany
                field("Brake Pads To Be Replaced"; rec."Brake Pads To Be Replaced")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //stan obreczy
                field("Rim Condition"; rec."Rim Condition")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //przesuniecie paskow na obreczach
                field("Belt Shift On Rims"; rec."Belt Shift On Rims")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //luzy na zderzakach
                field("Bumper Loose"; rec."Bumper Loose")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //luzy na sprzegu
                field("Coupling Loose"; rec."Coupling Loose")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //stan oleju na widlach wozniczych
                field("Oil Level On Axle Forks"; rec."Oil Level On Axle Forks")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //stan oleju podpory pudla (slizgi boczne)
                field("Oil Level of Body Support"; rec."Oil Level of Body Support")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //stan oleju czopa skretu
                field("Oil Level of Pivot Pin"; rec."Oil Level of Pivot Pin")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }

                field("User ID"; rec."User ID")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                //nr karty pracy
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies a description of the customer entry.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
            }
        }

    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;

                action(Vehicle)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vehicle';
                    Image = Customer;
                    RunObject = Page "Vehicle Card";
                    RunPageLink = "No." = field("Vehicle No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = '';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";

            }
            action("&Navigate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find entries...';
                Image = Navigate;
                Scope = Repeater;
                ShortCutKey = 'Ctrl+Alt+Q';
                ToolTip = '';

                //TODO:Oprogramowac
                trigger OnAction()
                begin
                    //Navigate.SetDoc(Rec."Date", Rec."Transaction No.");
                    Navigate.Run();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("&Navigate_Promoted"; "&Navigate")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Entry', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Vehicle_Promoted; Vehicle)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
    begin
    end;

    trigger OnAfterGetRecord()
    begin
        //StyleTxt := Rec.SetStyle();
    end;

    trigger OnInit()
    begin
    end;

    trigger OnModifyRecord(): Boolean
    begin
    end;

    trigger OnOpenPage()
    begin
        SetControlVisibility();

        if (Rec.GetFilters() <> '') and not Rec.Find() then
            if Rec.FindFirst() then;
    end;

    var
        Navigate: Page Navigate;

        StyleTxt: Text;

    local procedure SetControlVisibility()
    var
    begin
    end;

}
