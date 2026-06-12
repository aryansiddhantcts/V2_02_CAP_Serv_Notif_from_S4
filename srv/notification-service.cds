using { API_MAINTNOTIFICATION as external } from './external/API_MAINTNOTIFICATION';
@path: '/notification-service'
service NotificationService {

    // Main entity with projection
    entity Notifications as projection on external.MaintenanceNotification {
        key MaintenanceNotification,
        MaintNotifInternalID,
        NotificationText,
        MaintPriority,
        MaintPriorityDesc,
        NotificationType,
        NotifProcessingPhase,
        NotifProcessingPhaseDesc,
        CreationDate,
        LastChangeDateTime,
        ReportedByUser,
        ReporterFullName,
        PersonResponsible,
        PersonResponsibleName,
        MalfunctionStartDate,
        MalfunctionEndDate,
        MaintNotificationCatalog,
        MaintNotificationCode,
        MaintNotificationCodeGroup,
        CatalogProfile,
        RequiredStartDate,
        RequiredEndDate,
        LatestAcceptableCompletionDate,
        MaintenanceObjectIsDown,
        MaintNotifLongTextForEdit,
        TechnicalObject,
        TechnicalObjectLabel,
        TechnicalObjectDescription,
        TechObjIsEquipOrFuncnlLoc,
        FunctionalLocation,
        FunctionalLocationLabelName,
        MaintenancePlanningPlant,
        PlantName,
        MaintenancePlant,
        MaintenancePlantName,
        MaintenancePlannerGroup,
        MaintenancePlannerGroupName,
        MainWorkCenter,
        MainWorkCenterText,
        MaintenanceOrder,
        MaintenanceOrderType,
        CompanyCode,
        ConcatenatedActiveSystStsName,
        MaintenanceActivityType,
        MaintObjectDowntimeDuration,
        MaintObjDowntimeDurationUnit,
        NotificationCompletionDate,
        CreatedByUser,
        ZZ1_work_test_NTF,
        to_Item
    };

    // Notification Items
    entity NotificationItems as projection on external.MaintenanceNotificationItem {
        key MaintenanceNotification,
        key MaintenanceNotificationItem,
        MaintNotifItemText,
        MaintNotifDamageCodeGroup,
        MaintNotifDamageCodeGroupName,
        MaintNotificationDamageCode,
        MaintNotifDamageCodeName,
        MaintNotifObjPrtCodeGroup,
        MaintNotifObjPrtCodeGroupName,
        MaintNotifObjPrtCode,
        MaintNotifObjPrtCodeName,
        IsDeleted
    };

    // Actions (bound to Notifications)
    action approveMaintWorkRequest(MaintenanceNotification : String(12))
        returns Notifications;

    action completeMaintNotification(
        MaintenanceNotification : String(12),
        MaintNotifReferenceDateTime : Timestamp,
        NotificationReferenceDate : Date,
        NotificationReferenceTime : Time
    ) returns Notifications;

    action rejectMaintWorkRequest(
        MaintenanceNotification : String(12),
        MaintNotifRejectionReasonCode : String(3),
        MaintNotifLongTextForEdit : String,
        TextObjectCategory : String(10),
        NotificationType : String(2),
        MaintRequestEditableLongText : String
    ) returns Notifications;

    action setMaintNotifToInfoRequired(
        MaintenanceNotification : String(12),
        MaintNotifRejectionReasonCode : String(3),
        MaintNotifLongTextForEdit : String,
        MaintRequestEditableLongText : String
    ) returns Notifications;

    action setMaintNotifToInProcess(MaintenanceNotification : String(12))
        returns Notifications;
}