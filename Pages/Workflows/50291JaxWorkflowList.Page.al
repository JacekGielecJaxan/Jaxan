page 50291 "Workflow List"
{
    Caption = 'Workflow List';
    DataCaptionFields = "Document Type";
    Editable = false;
    PageType = List;
    SourceTable = "Workflow Header";

    ApplicationArea = Basic, Suite;
    CardPageID = "Workflow Card";
    UsageCategory = Lists;

    AboutTitle = 'About Vehicles';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    //ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Kind of Document"; rec."Kind of Document")
                {
                    ApplicationArea = basic, suite;
                }
                field(Important; rec.Important)
                {
                    ApplicationArea = all;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the contact person at the vendor who delivered the items.';
                    Visible = false;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = basic, suite;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the currency of the amounts on the purchase lines.';
                    Visible = false;
                }
                field("Amount Including VAT"; rec."Amount Including VAT")
                {
                    ApplicationArea = basic, suite;
                }
                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = basic, suite;
                }
                field("Comment Exists"; rec."Comment Exists")
                {
                    ApplicationArea = suite;
                }
            }
        }
        area(factboxes)
        {
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Basic, Suite;
                ShowFilter = false;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(reporting)
        {
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

}

