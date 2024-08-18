codeunit 50005 "Jax Approvals Mgmt."
{
    Permissions = TableData "Approval Entry" = Rimd,
                  TableData "Approval Comment Line" = rimd,
                  TableData "Posted Approval Entry" = rimd,
                  TableData "Posted Approval Comment Line" = rimd,
                  TableData "Overdue Approval Entry" = rimd,
                  TableData "Notification Entry" = rimd;

    trigger OnRun()
    begin
    end;

    var
        WorkflowEventHandling: Codeunit "Jax Workflow Event Handling";
        WorkflowManagement: Codeunit "Workflow Management";

UserIdNotInSetupErr: Label 'User ID %1 does not exist in the Approval User Setup window.', Comment = 'User ID NAVUser does not exist in the Approval User Setup window.';
ApproverUserIdNotInSetupErr: Label 'You must set up an approver for user ID %1 in the Approval User Setup window.', Comment = 'You must set up an approver for user ID NAVUser in the Approval User Setup window.';
WFUserGroupNotInSetupErr: Label 'The workflow user group member with user ID %1 does not exist in the Approval User Setup window.', Comment = 'The workflow user group member with user ID NAVUser does not exist in the Approval User Setup window.';
SubstituteNotFoundErr: Label 'There is no substitute, direct approver, or approval administrator for user ID %1 in the Approval User Setup window.', Comment = 'There is no substitute for user ID NAVUser in the Approval User Setup window.';
        NoSuitableApproverFoundErr: Label 'No qualified approver was found.';
        DelegateOnlyOpenRequestsErr: Label 'You can only delegate open approval requests.';
        ApproveOnlyOpenRequestsErr: Label 'You can only approve open approval requests.';
        RejectOnlyOpenRequestsErr: Label 'You can only reject open approval entries.';
        ApprovalsDelegatedMsg: Label 'The selected approval requests have been delegated.';
        NoReqToApproveErr: Label 'There is no approval request to approve.';
        NoReqToRejectErr: Label 'There is no approval request to reject.';
        NoReqToDelegateErr: Label 'There is no approval request to delegate.';
        PendingApprovalMsg: Label 'An approval request has been sent.';
PurchaserUserNotFoundErr: Label 'The salesperson/purchaser user ID %1 does not exist in the Approval User Setup window for %2 %3.', Comment = 'Example: The salesperson/purchaser user ID NAVUser does not exist in the Approval User Setup window for Salesperson/Purchaser code AB.';
        NoApprovalRequestsFoundErr: Label 'No approval requests exist.';
        NoWFUserGroupMembersErr: Label 'A workflow user group with at least one member must be set up.';
DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.', Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
UnsupportedRecordTypeErr: Label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
SalesPrePostCheckErr: Label 'Sales %1 %2 must be approved and released before you can perform this action.', Comment = '%1=document type, %2=document no., e.g. Sales Order 321 must be approved...';
PurchPrePostCheckErr: Label 'Purchase %1 %2 must be approved and released before you can perform this action.', Comment = '%1=document type, %2=document no., e.g. Purchase Order 321 must be approved...';
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
        ApprovalReqCanceledForSelectedLinesMsg: Label 'The approval request for the selected record has been canceled.';
PendingJournalBatchApprovalExistsErr: Label 'An approval request already exists.', Comment = '%1 is the Document No. of the journal line';
        ApprovedJournalBatchApprovalExistsMsg: Label 'An approval request for this batch has already been sent and approved. Do you want to send another approval request?';
ApporvalChainIsUnsupportedMsg: Label 'Only Direct Approver is supported as Approver Limit Type option for %1. The approval request will be approved automatically.', Comment = 'Only Direct Approver is supported as Approver Limit Type option for Gen. Journal Batch DEFAULT, CASH. The approval request will be approved automatically.';
RecHasBeenApprovedMsg: Label '%1 has been approved.', Comment = '%1 = Record Id';
        NoPermissionToDelegateErr: Label 'You do not have permission to delegate one or more of the selected approval requests.';
        NothingToApproveErr: Label 'There is nothing to approve.';
        ApproverChainErr: Label 'No sufficient approver was found in the approver chain.';
PreventModifyRecordWithOpenApprovalEntryMsg: Label 'You can''t modify a record pending approval. Add a comment or reject the approval to modify the record.';
PreventInsertRecordWithOpenApprovalEntryForCurrUserMsg: Label 'You can''t insert a record for active batch approval request. To insert a record, you can Reject approval and document requested changes in approval comment lines.';
        PreventInsertRecordWithOpenApprovalEntryMsg: Label 'You can''t insert a record that has active approval request. Do you want to cancel the batch approval request first?';
        PreventDeleteRecordWithOpenApprovalEntryMsg: Label 'You can''t delete a record that has open approval entries. Do you want to cancel the approval request first?';
PreventDeleteRecordWithOpenApprovalEntryForCurrUserMsg: Label 'You can''t delete a record that has open approval entries. To delete a record, you can Reject approval and document requested changes in approval comment lines.';
        PreventDeleteRecordWithOpenApprovalEntryForSenderMsg: Label 'You can''t delete a record that has open approval entries. To delete a record, you need to Cancel approval request first.';
        ImposedRestrictionLbl: Label 'Imposed restriction';
        PendingApprovalLbl: Label 'Pending Approval';
        RestrictBatchUsageDetailsLbl: Label 'The restriction was imposed because the journal batch requires approval.';

    [IntegrationEvent(false, false)]
    procedure OnSendWorkflowDocForApproval(var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelWorkflowApprovalRequest(var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnDelegateApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnRenameRecordInApprovalRequest(OldRecordId: RecordID; NewRecordId: RecordID)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnDeleteRecordInApprovalRequest(RecordIDToApprove: RecordID)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    begin
    end;

    local procedure ShowWorkflowApprovalStatus(WorkflowHeader: Record "Workflow Header")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeShowWorkflowApprovalStatus(WorkflowHeader, IsHandled);
        if IsHandled then
            exit;

        WorkflowHeader.Find();

        case WorkflowHeader.Status of
            WorkflowHeader.Status::Released:
                Message(DocStatusChangedMsg, WorkflowHeader."Document Type", WorkflowHeader."No.", WorkflowHeader.Status);
            WorkflowHeader.Status::"Pending Approval":
                if ApprovalsMgt.HasOpenOrPendingApprovalEntries(WorkflowHeader.RecordId) then
                    Message(PendingApprovalMsg);
            WorkflowHeader.Status::"Pending Prepayment":
                Message(DocStatusChangedMsg, WorkflowHeader."Document Type", WorkflowHeader."No.", WorkflowHeader.Status);
        end;
    end;

    local procedure ShowCommonApprovalStatus(var RecRef: RecordRef; WorkflowInstanceId: Guid)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeShowCommonApprovalStatus(RecRef, IsHandled);
        if IsHandled then
            exit;

        ShowApprovalStatus(RecRef.RecordId, WorkflowInstanceId);
    end;

    local procedure ShowApprovalStatus(RecId: RecordID; WorkflowInstanceId: Guid)
    begin
        if HasPendingApprovalEntriesForWorkflow(RecId, WorkflowInstanceId) then
            Message(PendingApprovalMsg)
        else
            Message(RecHasBeenApprovedMsg, Format(RecId, 0, 1));
    end;



    procedure PopulateApprovalEntryArgument(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance"; var ApprovalEntryArgument: Record "Approval Entry"; ApprovalAmount: Decimal)
    var
        GenJournalBatch: Record "Gen. Journal Batch";
        GenJournalLine: Record "Gen. Journal Line";
        WorkflowHeader: Record "Workflow Header";
        Vendor: Record Vendor;
        EnumAssignmentMgt: Codeunit "Enum Assignment Management";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforePopulateApprovalEntryArgument(WorkflowStepInstance, ApprovalEntryArgument, IsHandled);
        if not IsHandled then begin
            ApprovalEntryArgument.Init();
            ApprovalEntryArgument."Table ID" := RecRef.Number;
            ApprovalEntryArgument."Record ID to Approve" := RecRef.RecordId;
            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
            ApprovalEntryArgument."Approval Code" := WorkflowStepInstance."Workflow Code";
            ApprovalEntryArgument."Workflow Step Instance ID" := WorkflowStepInstance.ID;

            case RecRef.Number of
                DATABASE::"Workflow Header":
                    begin
                        RecRef.SetTable(WorkflowHeader);
                        ApprovalEntryArgument."Document Type" := EnumAssignmentMgt.GetPurchApprovalDocumentType(WorkflowHeader."Document Type");
                        ApprovalEntryArgument."Document No." := WorkflowHeader."No.";
                        ApprovalEntryArgument.Amount := ApprovalAmount;
                        ApprovalEntryArgument."Currency Code" := WorkflowHeader."Currency Code";
                    end;
                else
                    OnPopulateApprovalEntryArgument(RecRef, ApprovalEntryArgument, WorkflowStepInstance);
            end;
        end;

        OnAfterPopulateApprovalEntryArgument(WorkflowStepInstance, ApprovalEntryArgument, IsHandled, RecRef);
    end;

    procedure CreateApprovalEntryNotification(ApprovalEntry: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowStepArgument: Record "Workflow Step Argument";
        NotificationEntry: Record "Notification Entry";
        IsNotificationRequiredForCurrentUser: Boolean;
        IsNotifySenderRequired: Boolean;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCreateApprovalEntryNotification(ApprovalEntry, IsHandled, WorkflowStepInstance);
        if not IsHandled then begin
            if not WorkflowStepArgument.Get(WorkflowStepInstance.Argument) then
                exit;

            IsNotificationRequiredForCurrentUser := (ApprovalEntry."Approver ID" <> UserId) or IsBackground();
            IsNotifySenderRequired := ((ApprovalEntry."Sender ID" <> UserId) or IsBackground()) and (ApprovalEntry."Sender ID" <> ApprovalEntry."Approver ID");

            ApprovalEntry.Reset();
            if IsNotificationRequiredForCurrentUser and (ApprovalEntry.Status <> ApprovalEntry.Status::Rejected) then
                NotificationEntry.CreateNotificationEntry(
                    NotificationEntry.Type::Approval, ApprovalEntry."Approver ID",
                    ApprovalEntry, WorkflowStepArgument."Link Target Page", WorkflowStepArgument."Custom Link", CopyStr(UserId(), 1, 50));
            if WorkflowStepArgument."Notify Sender" and IsNotifySenderRequired then
                NotificationEntry.CreateNotificationEntry(
                    NotificationEntry.Type::Approval, ApprovalEntry."Sender ID",
                    ApprovalEntry, WorkflowStepArgument."Link Target Page", WorkflowStepArgument."Custom Link", CopyStr(UserId(), 1, 50));
        end;

        OnAfterCreateApprovalEntryNotification(ApprovalEntry, WorkflowStepArgument);
    end;

    local procedure SetApproverType(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntry: Record "Approval Entry")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeSetApproverType(WorkflowStepArgument, ApprovalEntry, IsHandled);
        if IsHandled then
            exit;

        case WorkflowStepArgument."Approver Type" of
            WorkflowStepArgument."Approver Type"::"Salesperson/Purchaser":
                ApprovalEntry."Approval Type" := ApprovalEntry."Approval Type"::"Sales Pers./Purchaser";
            WorkflowStepArgument."Approver Type"::Approver:
                ApprovalEntry."Approval Type" := ApprovalEntry."Approval Type"::Approver;
            WorkflowStepArgument."Approver Type"::"Workflow User Group":
                ApprovalEntry."Approval Type" := ApprovalEntry."Approval Type"::"Workflow User Group";
        end;

        OnAfterSetApproverType(WorkflowStepArgument, ApprovalEntry);
    end;

    local procedure SetLimitType(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntry: Record "Approval Entry")
    begin
        case WorkflowStepArgument."Approver Limit Type" of
            WorkflowStepArgument."Approver Limit Type"::"Approver Chain",
            WorkflowStepArgument."Approver Limit Type"::"First Qualified Approver":
                ApprovalEntry."Limit Type" := ApprovalEntry."Limit Type"::"Approval Limits";
            WorkflowStepArgument."Approver Limit Type"::"Direct Approver":
                ApprovalEntry."Limit Type" := ApprovalEntry."Limit Type"::"No Limits";
            WorkflowStepArgument."Approver Limit Type"::"Specific Approver":
                ApprovalEntry."Limit Type" := ApprovalEntry."Limit Type"::"No Limits";
        end;

        if ApprovalEntry."Approval Type" = ApprovalEntry."Approval Type"::"Workflow User Group" then
            ApprovalEntry."Limit Type" := ApprovalEntry."Limit Type"::"No Limits";

        OnAfterSetLimitType(WorkflowStepArgument, ApprovalEntry);
    end;

    local procedure IsSufficientPurchApprover(UserSetup: Record "User Setup"; DocumentType: Enum "Purchase Document Type"; ApprovalAmount: Decimal): Boolean
    var
        WorkflowHeader: Record "Workflow Header";
        IsHandled: Boolean;
        IsSufficient: Boolean;
    begin
        IsHandled := false;
        OnBeforeIsSufficientWorkflowApprover(UserSetup, DocumentType, ApprovalAmount, IsSufficient, IsHandled);
        if IsHandled then
            exit(IsSufficient);

        if UserSetup."User ID" = UserSetup."Approver ID" then
            exit(true);

        if UserSetup."Unlimited Purchase Approval" or
           ((ApprovalAmount <= UserSetup."Purchase Amount Approval Limit") and (UserSetup."Purchase Amount Approval Limit" <> 0))
        then
            exit(true);

        exit(false);
    end;

    procedure IsSufficientApprover(UserSetup: Record "User Setup"; ApprovalEntryArgument: Record "Approval Entry"): Boolean
    var
        IsSufficient: Boolean;
        IsHandled: Boolean;
    begin
        OnBeforeIsSufficientApprover(UserSetup, ApprovalEntryArgument);
        IsSufficient := true;
        case ApprovalEntryArgument."Table ID" of
            DATABASE::"Workflow Header":
                IsSufficient := IsSufficientWorkflowApprover(UserSetup, ApprovalEntryArgument."Document Type", ApprovalEntryArgument."Amount (LCY)");
        end;

        IsHandled := false;
        OnAfterIsSufficientApprover(UserSetup, ApprovalEntryArgument, IsSufficient, IsHandled);

        exit(IsSufficient);
    end;

    local procedure IsSufficientWorkflowApprover(UserSetup: Record "User Setup"; DocumentType: Enum "Purchase Document Type"; ApprovalAmount: Decimal): Boolean
    var
        WorkflowHeader: Record "Workflow Header";
        IsHandled: Boolean;
        IsSufficient: Boolean;
    begin
        IsHandled := false;
        OnBeforeIsSufficientWorkflowApprover(UserSetup, DocumentType, ApprovalAmount, IsSufficient, IsHandled);
        if IsHandled then
            exit(IsSufficient);

        if UserSetup."User ID" = UserSetup."Approver ID" then
            exit(true);

        if UserSetup."Unlimited Purchase Approval" or
           ((ApprovalAmount <= UserSetup."Purchase Amount Approval Limit") and (UserSetup."Purchase Amount Approval Limit" <> 0))
        then
            exit(true);

        exit(false);
    end;


    procedure IsWorkflowApprovalsWorkflowEnabled(var WorkflowHeader: Record "Workflow Header") Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeIsWorkflowApprovalsWorkflowEnabled(WorkflowHeader, Result, IsHandled);
        if IsHandled then
            exit(Result);
        exit(WorkflowManagement.CanExecuteWorkflow(WorkflowHeader, WorkflowEventHandling.RunWorkflowOnSendWorkflowDocForApprovalCode()));
    end;

    procedure IsPWorkflowApprovalsWorkflowEnabled(var WorkflowHeader: Record "Workflow Header") Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeIsWorkflowApprovalsWorkflowEnabled(WorkflowHeader, Result, IsHandled);
        if IsHandled then
            exit(Result);
        exit(WorkflowManagement.CanExecuteWorkflow(WorkflowHeader, WorkflowEventHandling.RunWorkflowOnSendWorkflowDocForApprovalCode()));
    end;



    procedure IsWorkflowHeaderPendingApproval(var WorkflowHeader: Record "Workflow Header"): Boolean
    begin
        if WorkflowHeader.Status <> WorkflowHeader.Status::Open then
            exit(false);

        exit(IsWorkflowApprovalsWorkflowEnabled(WorkflowHeader));
    end;

    procedure CheckWorkflowApprovalPossible(var WorkflowHeader: Record "Workflow Header") Result: Boolean
    var
        IsHandled: Boolean;
        ShowNothingToApproveError: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckWorkflowApprovalPossible(WorkflowHeader, Result, IsHandled);
        if IsHandled then
            exit(Result);

        if not IsWorkflowApprovalsWorkflowEnabled(WorkflowHeader) then
            Error(NoWorkflowEnabledErr);


        OnAfterCheckWorkflowApprovalPossible(WorkflowHeader);

        exit(true);
    end;

    local procedure HasPendingApprovalEntriesForWorkflow(RecId: RecordID; WorkflowInstanceId: Guid): Boolean
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SetRange("Record ID to Approve", RecId);
        ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        ApprovalEntry.SetFilter("Workflow Step Instance ID", WorkflowInstanceId);
        OnHasPendingApprovalEntriesForWorkflowOnAfterApprovalEntrySetFilters(ApprovalEntry);
        exit(not ApprovalEntry.IsEmpty);
    end;

    procedure InformUserOnStatusChange(Variant: Variant; WorkflowInstanceId: Guid)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of
            DATABASE::"Workflow Header":
                ShowWorkflowApprovalStatus(Variant);
            else
                ShowCommonApprovalStatus(RecRef, WorkflowInstanceId);
        end;
    end;


    procedure OpenApprovalsWorkflow(WorkflowHeader: Record "Workflow Header")
    begin
        ApprovalsMgt.RunWorkflowEntriesPage(
            WorkflowHeader.RecordId(), DATABASE::"Workflow Header", WorkflowHeader."Document Type", WorkflowHeader."No.");
    end;

    local procedure IsBackground(): Boolean
    var
        ClientTypeManagement: Codeunit "Client Type Management";
    begin
        exit(ClientTypeManagement.GetCurrentClientType() in [ClientType::Background]);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckWorkflowApprovalPossible(var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPopulateApprovalEntryArgument(WorkflowStepInstance: Record "Workflow Step Instance"; var ApprovalEntryArgument: Record "Approval Entry"; var IsHandled: Boolean; var RecRef: RecordRef)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckWorkflowApprovalPossible(var WorkflowHeader: Record "Workflow Header"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateApprovalEntryNotification(ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean; WorkflowStepInstance: Record "Workflow Step Instance")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePopulateApprovalEntryArgument(WorkflowStepInstance: Record "Workflow Step Instance"; var ApprovalEntryArgument: Record "Approval Entry"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShowWorkflowApprovalStatus(var WorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeIsWorkflowApprovalsWorkflowEnabled(var WorkflowHeader: Record "Workflow Header"; var Result: Boolean; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeIsSufficientApprover(var UserSetup: Record "User Setup"; ApprovalEntry: Record "Approval Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeIsSufficientWorkflowApprover(UserSetup: Record "User Setup"; DocumentType: Enum "Purchase Document Type"; var ApprovalAmount: Decimal; var IsSufficient: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetLimitType(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntry: Record "Approval Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetApproverType(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntry: Record "Approval Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShowCommonApprovalStatus(var RecRef: RecordRef; var IsHandle: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterIsSufficientApprover(UserSetup: Record "User Setup"; ApprovalEntryArgument: Record "Approval Entry"; var IsSufficient: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetApproverType(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateApprovalEntryNotification(var ApprovalEntryArgument: Record "Approval Entry"; var WorkflowStepArgument: Record "Workflow Step Argument")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnHasPendingApprovalEntriesForWorkflowOnAfterApprovalEntrySetFilters(var ApprovalEntry: Record "Approval Entry")
    begin
    end;

    var
        ApprovalsMgt: Codeunit "Approvals Mgmt.";

}

