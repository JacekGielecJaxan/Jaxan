codeunit 50006 "Jax Workflow Event Handling"
{

    trigger OnRun()
    begin
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";

        WorkflowDocSendForApprovalEventDescTxt: Label 'Approval of a workflow document is requested.';
        WorkflowDocApprReqCancelledEventDescTxt: Label 'An approval request for a purchase document is canceled.';
        WorkflowDocReleasedEventDescTxt: Label 'A purchase document is released.';
        ApprReqApprovedEventDescTxt: Label 'An approval request is approved.';
        ApprReqRejectedEventDescTxt: Label 'An approval request is rejected.';
        ApprReqDelegatedEventDescTxt: Label 'An approval request is delegated.';
        EventAlreadyExistErr: Label 'An event with description %1 already exists.';
        SendOverdueNotifTxt: Label 'The overdue approval notifications batch job will be run.';
        JobQueueEntryApprovalEventDescTxt: Label 'Approval of a job queue entry is requested.';
        JobQueueEntryApprReqCancelledEventDescTxt: Label 'Approval of a job queue entry is cancelled.';

    procedure CreateEventsLibrary()
    begin
        AddEventToLibrary(
          RunWorkflowOnSendWorkflowDocForApprovalCode(), DATABASE::"Workflow Header", WorkflowDocSendForApprovalEventDescTxt, 0, false);
        AddEventToLibrary(RunWorkflowOnCancelWorkflowApprovalRequestCode(), DATABASE::"Workflow Header",
          WorkflowDocApprReqCancelledEventDescTxt, 0, false);

        AddEventToLibrary(RunWorkflowOnAfterReleaseWorkflowDocCode(), DATABASE::"Purchase Header",
          WorkflowDocReleasedEventDescTxt, 0, false);
        AddEventToLibrary(RunWorkflowOnApproveApprovalRequestCode(), DATABASE::"Approval Entry", ApprReqApprovedEventDescTxt, 0, false);
        AddEventToLibrary(RunWorkflowOnRejectApprovalRequestCode(), DATABASE::"Approval Entry", ApprReqRejectedEventDescTxt, 0, false);
        AddEventToLibrary(RunWorkflowOnDelegateApprovalRequestCode(), DATABASE::"Approval Entry", ApprReqDelegatedEventDescTxt, 0, false);

        AddEventToLibrary(RunWorkflowOnSendOverdueNotificationsCode(), DATABASE::"Approval Entry", SendOverdueNotifTxt, 0, false);

        AddEventToLibrary(RunWorkflowOnSendJobQueueEntryForApprovalCode(), Database::"Job Queue Entry", JobQueueEntryApprovalEventDescTxt, 0, false);
        AddEventToLibrary(RunWorkflowOnCancelJobQueueEntryApprovalRequestCode(), Database::"Job Queue Entry", JobQueueEntryApprReqCancelledEventDescTxt, 0, false);

        OnAddWorkflowEventsToLibrary();
        OnAddWorkflowTableRelationsToLibrary();
    end;

    local procedure AddEventPredecessors(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelWorkflowApprovalRequestCode():
                AddEventPredecessor(RunWorkflowOnCancelWorkflowApprovalRequestCode(), RunWorkflowOnSendWorkflowDocForApprovalCode());
            RunWorkflowOnApproveApprovalRequestCode():
                begin
                    AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendWorkflowDocForApprovalCode());
                    AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendJobQueueEntryForApprovalCode());
                end;
            RunWorkflowOnRejectApprovalRequestCode():
                begin
                    AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendWorkflowDocForApprovalCode());
                    AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendJobQueueEntryForApprovalCode());
                end;
            RunWorkflowOnDelegateApprovalRequestCode():
                begin
                    AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode(), RunWorkflowOnSendWorkflowDocForApprovalCode());
                    AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode(), RunWorkflowOnSendJobQueueEntryForApprovalCode());
                end;
            RunWorkflowOnCancelJobQueueEntryApprovalRequestCode():
                AddEventPredecessor(RunWorkflowOnCancelJobQueueEntryApprovalRequestCode(), RunWorkflowOnSendJobQueueEntryForApprovalCode());
        end;

        OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName);
    end;

    procedure AddEventToLibrary(FunctionName: Code[128]; TableID: Integer; Description: Text[250]; RequestPageID: Integer; UsedForRecordChange: Boolean)
    var
        WorkflowEvent: Record "Workflow Event";
        SystemInitialization: Codeunit "System Initialization";
    begin
        OnBeforeAddEventToLibrary(FunctionName, Description);

        if WorkflowEvent.Get(FunctionName) then
            exit;

        WorkflowEvent.SetRange(Description, Description);
        if not WorkflowEvent.IsEmpty() then begin
            if SystemInitialization.IsInProgress() or (GetExecutionContext() <> ExecutionContext::Normal) then
                exit;
            Error(EventAlreadyExistErr, Description);
        end;

        WorkflowEvent.Init();
        WorkflowEvent."Function Name" := FunctionName;
        WorkflowEvent."Table ID" := TableID;
        WorkflowEvent.Description := Description;
        WorkflowEvent."Request Page ID" := RequestPageID;
        WorkflowEvent."Used for Record Change" := UsedForRecordChange;
        WorkflowEvent.Insert();

        AddEventPredecessors(WorkflowEvent."Function Name");
    end;

    procedure AddEventPredecessor(FunctionName: Code[128]; PredecessorFunctionName: Code[128])
    var
        WFEventResponseCombination: Record "WF Event/Response Combination";
    begin
        WFEventResponseCombination.Init();
        WFEventResponseCombination.Type := WFEventResponseCombination.Type::"Event";
        WFEventResponseCombination."Function Name" := FunctionName;
        WFEventResponseCombination."Predecessor Type" := WFEventResponseCombination."Predecessor Type"::"Event";
        WFEventResponseCombination."Predecessor Function Name" := PredecessorFunctionName;
        if WFEventResponseCombination.Insert() then;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAddWorkflowTableRelationsToLibrary()
    begin
    end;


    procedure RunWorkflowOnSendWorkflowDocForApprovalCode(): Code[128]
    begin
        exit('RUNWORKFLOWONSENDPURCHASEDOCFORAPPROVAL');
    end;


    procedure RunWorkflowOnCancelWorkflowApprovalRequestCode(): Code[128]
    begin
        exit('RUNWORKFLOWONCANCELWORKFLOWAPPROVALREQUEST');
    end;

    procedure RunWorkflowOnAfterReleaseWorkflowDocCode(): Code[128]
    begin
        exit('RUNWORKFLOWONAFTERRELEASEWORKFLOWDOC');
    end;

    procedure RunWorkflowOnAfterPostWORKFLOWDocCode(): Code[128]
    begin
        exit('RUNWORKFLOWONAFTERPOSTWORKFLOWDOC');
    end;

    procedure RunWorkflowOnApproveApprovalRequestCode(): Code[128]
    begin
        exit('RUNWORKFLOWONAPPROVEAPPROVALREQUEST');
    end;

    procedure RunWorkflowOnDelegateApprovalRequestCode(): Code[128]
    begin
        exit('RUNWORKFLOWONDELEGATEAPPROVALREQUEST');
    end;

    procedure RunWorkflowOnRejectApprovalRequestCode(): Code[128]
    begin
        exit('RUNWORKFLOWONREJECTAPPROVALREQUEST');
    end;

    procedure RunWorkflowOnSendOverdueNotificationsCode(): Code[128]
    begin
        exit('RUNWORKFLOWONSENDOVERDUENOTIFICATIONS');
    end;


    procedure RunWorkflowOnSendJobQueueEntryForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendJobQueueEntryForApproval'));
    end;

    procedure RunWorkflowOnCancelJobQueueEntryApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelJobQueueEntryApprovalRequest'));
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Jax Approvals Mgmt.", 'OnSendWorkflowDocForApproval', '', false, false)]
    procedure RunWorkflowOnSendWorkflowDocForApproval(var WorkflowHeader: Record "Workflow Header")
    begin
        OnBeforeRunWorkflowOnSendWorkflowDocForApproval(WorkflowHeader);
        WorkflowManagement.HandleEvent(RunWorkflowOnSendWorkflowDocForApprovalCode(), WorkflowHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Jax Approvals Mgmt.", 'OnCancelWorkflowApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelWorkflowApprovalRequest(var WorkflowHeader: Record "Workflow Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelWorkflowApprovalRequestCode(), WorkflowHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Workflow Document", 'OnAfterReleaseWorkflowDoc', '', false, false)]
    procedure RunWorkflowOnAfterReleaseWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean)
    begin
        //if not PreviewMode then
        //    WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseWorkflowDocCode(), WorkflowHeader);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
        OnBeforeRunWorkflowOnApproveApprovalRequest(ApprovalEntry);

        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestCode(),
          ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateApprovalRequestCode(),
          ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestCode(),
          ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [EventSubscriber(ObjectType::Report, Report::"Send Overdue Appr. Notif.", 'OnSendOverdueNotifications', '', false, false)]
    procedure RunWorkflowOnSendOverdueNotifications()
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Created, ApprovalEntry.Status::Open);
        ApprovalEntry.SetFilter("Due Date", '<%1', Today);
        if not ApprovalEntry.FindSet() then
            ApprovalEntry.Init();

        WorkflowManagement.HandleEvent(RunWorkflowOnSendOverdueNotificationsCode(), ApprovalEntry);
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeAddEventToLibrary(FunctionName: Code[128]; Description: Text[250])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRunWorkflowOnSendWorkflowDocForApproval(var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendJobQueueEntryForApproval', '', true, true)]
    local procedure RunWorkflowOnOnSendJobQueueEntryForApproval(var JobQueueEntry: Record "Job Queue Entry")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendJobQueueEntryForApprovalCode(), JobQueueEntry);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCancelJobQueueEntryApprovalRequest', '', true, true)]
    local procedure RunWorkflowOnCancelJobQueueEntryApprovalRequest(var JobQueueEntry: Record "Job Queue Entry")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelJobQueueEntryApprovalRequestCode(), JobQueueEntry);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRunWorkflowOnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
    end;

}

