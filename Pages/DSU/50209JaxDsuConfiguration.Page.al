page 50209 "DSU Configuration"
{
    Caption = 'DSU Configuration';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Dsu Configuration Header";

    //TODO: zmienic odpowiendio teksty
    //AboutTitle = 'About sales order details';
    //AboutText = 'Choose the order details and fill in order lines with quantities of what you are selling. Post the order when you are ready to ship or invoice. This creates posted sales shipments and posted sales invoices.';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("DSU Code"; Rec."DSU Code")
                {
                    ApplicationArea = DSU;
                    ToolTip = '';
                }
                field("Date From"; Rec."Date From")
                {
                    ApplicationArea = DSU;
                    NotBlank = true;
                    ToolTip = '';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = DSU;
                    ToolTip = '';

                    //TODO: zmienic tekst
                    //AboutTitle = 'Who are you selling to?';
                    //AboutText = 'You can choose existing customers, or add new customers when you create orders. Orders can automatically choose special prices and discounts that you have set for each customer.';


                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = DSU;
                    ToolTip = '';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = DSU;
                    StyleExpr = StatusStyleTxt;
                    ToolTip = '';
                }

            }
            part(Lines; "DSU Configuration Subform")
            {
                ApplicationArea = DSU;
                SubPageLink = "dsu code" = field("dsu code"), "Date From" = field("Date From");
                UpdatePropagation = Both;
            }
        }

    }


    var
        StatusStyleTxt: Text;


    trigger OnAfterGetCurrRecord()
    begin
        StatusStyleTxt := Rec.GetStatusStyleText();
    end;
}