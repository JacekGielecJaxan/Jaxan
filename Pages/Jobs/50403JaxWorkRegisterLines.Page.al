page 50403 "Work Register Lines"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Work Register Lines';
    Editable = true;
    PageType = List;
    SourceTable = "Work Register Line";
    SourceTableView = sorting("Entry No.");
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Job Type Code"; rec."Job Type Code")
                {
                    ApplicationArea = basic, suite;
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
                field("End Date"; rec."End Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("End Time"; rec."End Time")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Task Duration"; rec."Task Duration")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = basic, suite;
                }
                field("Start Object Name"; rec."Start Object Name")
                {
                    ApplicationArea = basic, suite;
                }
                field("End Object Name"; rec."End Object Name")
                {
                    ApplicationArea = basic, suite;
                }
                field("Train No."; rec."Train No.")
                {
                    ApplicationArea = basic, suite;
                }
                field("Declaration of Readiness"; rec."Declaration of Readiness")
                {
                    ApplicationArea = basic, suite;
                }
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Job Task No."; rec."Job Task No.")
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

                field(Longitude; rec.Longitude)
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
                    Visible = false;
                }
                field(Latitude; rec.Latitude)
                {
                    ApplicationArea = basic, suite;
                    Editable = false;
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

