page 50295 "Workflow Doc. Check Factbox"
{
    PageType = ListPart;
    Caption = 'Document Check';
    Editable = false;
    LinksAllowed = false;
    SourceTable = "Workflow Header";

    layout
    {
        area(content)
        {
            cuegroup(Control1)
            {
                ShowCaption = false;
                field(NumberOfErrors; NumberOfErrors)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Issues Total';
                    ToolTip = 'Specifies the number of issues that have been found in the document.';
                    StyleExpr = TotalErrorsStyleTxt;

                    trigger OnDrillDown()
                    begin
                        TempErrorMessage.Reset();
                        TempErrorMessage.SetRange(Duplicate, false);
                        Page.Run(Page::"Error Messages", TempErrorMessage);
                    end;
                }
            }
            field(Refresh; RefreshTxt)
            {
                ApplicationArea = Basic, Suite;
                ShowCaption = false;
                trigger OnDrillDown()
                begin

                end;
            }
            group(Control2)
            {
                Caption = 'Issues';
                field(Error1; ErrorText[1])
                {
                    ShowCaption = false;
                    ApplicationArea = Basic, Suite;
                    StyleExpr = CurrentLineStyleTxt;
                }
                field(Error2; ErrorText[2])
                {
                    ShowCaption = false;
                    ApplicationArea = Basic, Suite;
                    StyleExpr = CurrentLineStyleTxt;
                }
            }
        }
    }

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    begin
        if TaskId = TaskIdCountErrors then
            IsHandled := true;
    end;

    var
        TempErrorMessage: Record "Error Message" temporary;
        TaskIdCountErrors: Integer;
        NumberOfErrors: Integer;
        TotalErrorsStyleTxt: Text;
        CurrentLineStyleTxt: Text;
        ErrorText: array[2] of Text;
OtherIssuesTxt: Label '(+%1 other issues)', comment = '%1 - number of issues';
        NoIssuesFoundTxt: Label 'No issues found.';
        RefreshTxt: Label 'Refresh';


    local procedure GetCurrentLineStyle(): Text
    begin
        if NumberOfErrors = 0 then
            exit('Standard')
        else
            exit('Attention');
    end;


}