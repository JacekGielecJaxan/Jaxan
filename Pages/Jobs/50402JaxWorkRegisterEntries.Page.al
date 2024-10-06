page 50402 "Work Register Entries"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Work Register Entries';
    Editable = true;
    PageType = List;
    SourceTable = "Work Register";
    SourceTableView = sorting("Document No.");
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = Basic, Suite;
                }

                field("Source No."; rec."Source No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Source Name"; rec."Source Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Start Date"; rec."Start Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Start Time"; rec."Start Time")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Planned End Date"; rec."Planned End Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Planned End Time"; rec."Planned End Time")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Planned Time"; rec."Planned Time")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Last Date"; rec."Last Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Last Time"; rec."Last Time")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Remaining Time"; rec."Remaining Time")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Creation Date"; rec."Creation Date")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Creation Time"; rec."Creation Time")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Creation User Id"; rec."Creation User Id")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }

            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Register")
            {
                Caption = '&Register';
                Image = Register;
            }
        }
        area(processing)
        {
        }
        area(reporting)
        {
        }
    }


    trigger OnOpenPage()
    begin
        if Rec.FindSet() then;
    end;

    trigger OnAfterGetRecord()
    begin
    end;

}

