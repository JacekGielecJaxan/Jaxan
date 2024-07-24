page 50064 "Wagon Fault List"
{
    Caption = 'Wagon Fault List';
    DataCaptionFields = "Code", "Short Description";
    PageType = List;
    SourceTable = "Wagon fault";
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Element Code"; rec."Element Code")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Code; rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Short Description"; Rec."Short Description")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field(Anomaly; Rec.Anomaly)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                field("Criteria"; Rec.Criteria)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                /// <summary>
                /// Wskazowki.
                /// </summary>
                field(Tips; rec.Tips)
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                /// <summary>
                /// Postepowanie.
                /// </summary>
                field("Procedure Text"; Rec."Procedure Text")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }
                /// <summary>
                /// Klasa bledu
                /// </summary>
                field("Error Class"; Rec."Error Class")
                {
                    ApplicationArea = all;
                    ToolTip = '';
                }

            }
        }
        area(factboxes)
        {
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
}

