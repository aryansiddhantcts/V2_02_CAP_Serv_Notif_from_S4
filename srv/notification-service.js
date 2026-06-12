const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {

    // Connect to external S/4HANA service
    const s4Service = await cds.connect.to("API_MAINTNOTIFICATION");

    const { Notifications, NotificationItems } = this.entities;

    // Delegate READ queries for Notifications
    this.on("READ", Notifications, async (req) => {
        return s4Service.run(req.query);
    });

    // Delegate READ queries for NotificationItems
    this.on("READ", NotificationItems, async (req) => {
        return s4Service.run(req.query);
    });

    // Delegate CREATE / UPDATE for Notifications
    this.on(["CREATE", "UPDATE"], Notifications, async (req) => {
        return s4Service.run(req.query);
    });

    // Delegate CREATE / UPDATE for NotificationItems
    this.on(["CREATE", "UPDATE"], NotificationItems, async (req) => {
        return s4Service.run(req.query);
    });

    // --- Actions (Function Imports) ---

    this.on("approveMaintWorkRequest", async (req) => {
        const { MaintenanceNotification } = req.data;
        return s4Service.send("ApproveMaintWorkRequest", {
            MaintenanceNotification
        });
    });

    this.on("completeMaintNotification", async (req) => {
        const {
            MaintenanceNotification,
            MaintNotifReferenceDateTime,
            NotificationReferenceDate,
            NotificationReferenceTime
        } = req.data;
        return s4Service.send("CompleteMaintNotification", {
            MaintenanceNotification,
            MaintNotifReferenceDateTime,
            NotificationReferenceDate,
            NotificationReferenceTime
        });
    });

    this.on("rejectMaintWorkRequest", async (req) => {
        const {
            MaintenanceNotification,
            MaintNotifRejectionReasonCode,
            MaintNotifLongTextForEdit,
            TextObjectCategory,
            NotificationType,
            MaintRequestEditableLongText
        } = req.data;
        return s4Service.send("RejectMaintWorkRequest", {
            MaintenanceNotification,
            MaintNotifRejectionReasonCode,
            MaintNotifLongTextForEdit,
            TextObjectCategory,
            NotificationType,
            MaintRequestEditableLongText
        });
    });

    this.on("setMaintNotifToInfoRequired", async (req) => {
        const {
            MaintenanceNotification,
            MaintNotifRejectionReasonCode,
            MaintNotifLongTextForEdit,
            MaintRequestEditableLongText
        } = req.data;
        return s4Service.send("SetMaintNotifToInfoRequired", {
            MaintenanceNotification,
            MaintNotifRejectionReasonCode,
            MaintNotifLongTextForEdit,
            MaintRequestEditableLongText
        });
    });

    this.on("setMaintNotifToInProcess", async (req) => {
        const { MaintenanceNotification } = req.data;
        return s4Service.send("SetMaintNotifToInProcess", {
            MaintenanceNotification
        });
    });
});