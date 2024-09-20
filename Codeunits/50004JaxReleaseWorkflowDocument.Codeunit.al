codeunit 50004 "Release Workflow Document"
{
    TableNo = "Workflow Header";
    Permissions = TableData "Workflow Header" = rm;

    trigger OnRun()
    begin
        WorkflowHeader.Copy(Rec);
        WorkflowHeader.SetHideValidationDialog(Rec.GetHideValidationDialog());
        Code();
        Rec := WorkflowHeader;
    end;

    var
        Text001: Label 'There is nothing to release for the document of type %1 with the number %2.';
        WorkflowSetup: Record "Workflow Setup";
        WorkflowHeader: Record "Workflow Header";
        Text002: Label 'This document can only be released when the approval process is complete.';
        Text003: Label 'The approval process must be cancelled or completed to reopen this document.';
        Text005: Label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';
        PreviewMode: Boolean;
        SkipCheckReleaseRestrictions: Boolean;

    local procedure "Code"() LinesWereModified: Boolean
    var
        IsHandled: Boolean;
    begin
        if WorkflowHeader.Status = WorkflowHeader.Status::"Pending Approval" then
            exit;

        IsHandled := false;
        OnBeforeReleaseWorkflowDoc(WorkflowHeader, PreviewMode, SkipCheckReleaseRestrictions, IsHandled);
        if IsHandled then
            exit;

        if not SkipCheckReleaseRestrictions then
            Check(WorkflowHeader);

        IsHandled := false;
        OnCodeOnAfterCheckWorkflowReleaseRestrictions(WorkflowHeader, IsHandled);
        if IsHandled then
            exit;


        OnCodeOnAfterCheck(WorkflowHeader);

        IsHandled := false;

        OnBeforeModifyWorkflowDoc(WorkflowHeader, PreviewMode, IsHandled);
        if IsHandled then
            exit;
        WorkflowHeader.Status := WorkflowHeader.Status::"Pending Approval";

        SendApprovalRequest(WorkflowHeader);

        OnCodeOnBeforeModifyHeader(WorkflowHeader, PreviewMode);

        WorkflowHeader.Modify(true);


        OnAfterReleaseWorkflowDoc(WorkflowHeader, PreviewMode);
    end;

    local procedure Check(WorkflowHeader: Record "Workflow Header")
    var
        WorkflowSetup: Record "Workflow Setup";
        KindOf: Record "Workflow Kind of Document";
    begin
        WorkflowSetup.Get();
        WorkflowHeader.TestField("Kind of Document");
        WorkflowHeader.TestField("No.");
        WorkflowHeader.Testfield("Receipt Date");
        WorkflowHeader.TestField("Document Date");

        if WorkflowSetup."Description Mandatory" then
            WorkflowHeader.TestField(Description);

        if WorkflowSetup."Respons. Center Mandatory" then
            WorkflowHeader.TestField("Responsibility Center");

        KindOf.Get(WorkflowHeader."Kind of Document");

        if KindOf."Amount Mandatory" and (not WorkflowHeader."Amount Zero") then begin
            WorkflowHeader.TestField(Amount);
            WorkflowHeader.TestField("Amount Including VAT");
        end;

        if KindOf."Contractor No. Mandatory" then
            WorkflowHeader.TestField("Buy-from Contact No.");

        if KindOf."Ext. Document No. Mandatory" then
            WorkflowHeader.TestField("Vendor Document No.");

    end;

    local procedure SendApprovalRequest(WorkflowHeader: Record "Workflow Header")
    var
        ApprovalsMgt: Codeunit "Jax Approvals Mgmt.";
    begin
        if not ApprovalsMgt.CheckWorkflowApprovalSendPossible(WorkflowHeader) then
            exit;

        ApprovalsMgt.AddNewApprovalRequest(WorkflowHeader);
    end;

    procedure Reopen(var WorkflowHeader: Record "Workflow Header")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeReopenWorkflowDoc(WorkflowHeader, PreviewMode, IsHandled);
        if IsHandled then
            exit;

        if WorkflowHeader.Status = WorkflowHeader.Status::Open then
            exit;

        WorkflowHeader.Status := WorkflowHeader.Status::Open;
        OnReopenOnBeforeWorkflowHeaderModify(WorkflowHeader);
        WorkflowHeader.Modify(true);

        OnAfterReopenWorkflowDoc(WorkflowHeader, PreviewMode);
    end;

    procedure PerformManualRelease(var WorkflowHeader: Record "Workflow Header")
    var
    begin
        OnBeforeManualReleaseWorkflowDoc(WorkflowHeader, PreviewMode);
        PerformManualCheckAndRelease(WorkflowHeader);
        OnAfterManualReleaseWorkflowDoc(WorkflowHeader, PreviewMode);
    end;

    procedure PerformManualCheckAndRelease(var WorkflowHeader: Record "Workflow Header")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforePerformManualCheckAndRelease(WorkflowHeader, PreviewMode, IsHandled);
        if IsHandled then
            exit;


        IsHandled := false;
        OnBeforePerformManualRelease(WorkflowHeader, PreviewMode, IsHandled);
        if IsHandled then
            exit;

        CODEUNIT.Run(CODEUNIT::"Release Workflow Document", WorkflowHeader);

        OnAfterPerformManualCheckAndRelease(WorkflowHeader);
    end;

    procedure PerformManualReopen(var WorkflowHeader: Record "Workflow Header")
    begin
        OnBeforeManualReopenWorkflowDoc(WorkflowHeader, PreviewMode);
        Reopen(WorkflowHeader);
        OnAfterManualReopenWorkflowDoc(WorkflowHeader, PreviewMode);
    end;

    procedure ReleaseWorkflowHeader(var WorkflowHdr: Record "Workflow Header"; Preview: Boolean) LinesWereModified: Boolean
    begin
        PreviewMode := Preview;
        WorkflowHeader.Copy(WorkflowHdr);
        LinesWereModified := Code();
        WorkflowHdr := WorkflowHeader;
    end;

    procedure SetSkipCheckReleaseRestrictions()
    begin
        SkipCheckReleaseRestrictions := true;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeManualReleaseWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePerformManualCheckAndRelease(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReleaseWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReleaseWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterManualReleaseWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeManualReopenWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopenWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeModifyWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePerformManualRelease(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReopenWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterManualReopenWorkflowDoc(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCodeOnAfterCheck(WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCodeOnBeforeModifyHeader(var WorkflowHeader: Record "Workflow Header"; PreviewMode: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCodeOnAfterCheckWorkflowReleaseRestrictions(var WorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeMandatoryFields(WorkflowHeader: Record "Workflow Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnReopenOnBeforeWorkflowHeaderModify(var WorkflowHeader: Record "Workflow Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPerformManualCheckAndRelease(var WorkflowHeader: Record "Workflow Header")
    begin
    end;
}

