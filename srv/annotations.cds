using NotificationService as service from './notification-service';

// ---------------------
// Notifications
// ---------------------

annotate service.Notifications with @(

    UI.HeaderInfo             : {
        TypeName      : 'Notification',
        TypeNamePlural: 'Notifications',
        Title         : {Value: MaintenanceNotification},
        Description   : {Value: NotificationText}
    },

    UI.SelectionFields        : [
        MaintenanceNotification,
        NotificationType,
        MaintPriority,
        NotifProcessingPhase,
        MaintenancePlant,
        CreatedByUser
    ],

    UI.LineItem               : [
        {
            Value: MaintenanceNotification,
            Label: 'Notification'
        },
        {
            Value: NotificationText,
            Label: 'Description'
        },
        {
            Value: NotificationType,
            Label: 'Type'
        },
        {
            Value: MaintPriority,
            Label: 'Priority'
        },
        {
            Value: NotifProcessingPhaseDesc,
            Label: 'Status'
        },
        {
            Value: TechnicalObjectLabel,
            Label: 'Technical Object'
        },
        {
            Value: MaintenancePlantName,
            Label: 'Plant'
        },
        {
            Value: MainWorkCenterText,
            Label: 'Work Center'
        },
        {
            Value: CreationDate,
            Label: 'Created On'
        },
        {
            Value: CreatedByUser,
            Label: 'Created By'
        }
    ],

    UI.Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInfo',
            Label : 'General Information',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TechnicalObject',
            Label : 'Technical Object',
            Target: '@UI.FieldGroup#TechObject'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Dates',
            Label : 'Dates & Times',
            Target: '@UI.FieldGroup#Dates'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Maintenance',
            Label : 'Maintenance Data',
            Target: '@UI.FieldGroup#Maintenance'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ItemsFacet',
            Label : 'Items',
            Target: 'to_Item/@UI.LineItem'
        }
    ],

    UI.FieldGroup #General    : {Data: [
        {
            Value: MaintenanceNotification,
            Label: 'Notification'
        },
        {
            Value: NotificationText,
            Label: 'Description'
        },
        {
            Value: NotificationType,
            Label: 'Type'
        },
        {
            Value: MaintPriority,
            Label: 'Priority'
        },
        {
            Value: MaintPriorityDesc,
            Label: 'Priority Text'
        },
        {
            Value: NotifProcessingPhaseDesc,
            Label: 'Status'
        },
        {
            Value: MaintNotifLongTextForEdit,
            Label: 'Long Text'
        },
        {
            Value: CompanyCode,
            Label: 'Company Code'
        },
        {
            Value: CreatedByUser,
            Label: 'Created By'
        }
    ]},

    UI.FieldGroup #TechObject : {Data: [
        {
            Value: TechnicalObjectLabel,
            Label: 'Technical Object'
        },
        {
            Value: TechnicalObjectDescription,
            Label: 'Description'
        },
        {
            Value: TechObjIsEquipOrFuncnlLoc,
            Label: 'Object Type'
        },
        {
            Value: FunctionalLocationLabelName,
            Label: 'Functional Location'
        },
        {
            Value: MaintenanceObjectIsDown,
            Label: 'Breakdown'
        }
    ]},

    UI.FieldGroup #Dates      : {Data: [
        {
            Value: CreationDate,
            Label: 'Created On'
        },
        {
            Value: RequiredStartDate,
            Label: 'Required Start'
        },
        {
            Value: RequiredEndDate,
            Label: 'Required End'
        },
        {
            Value: LatestAcceptableCompletionDate,
            Label: 'Final Due Date'
        },
        {
            Value: NotificationCompletionDate,
            Label: 'Completed On'
        },
        {
            Value: LastChangeDateTime,
            Label: 'Last Changed'
        }
    ]},

    UI.FieldGroup #Maintenance: {Data: [
        {
            Value: MaintenancePlantName,
            Label: 'Plant'
        },
        {
            Value: MaintenancePlannerGroupName,
            Label: 'Planner Group'
        },
        {
            Value: MainWorkCenterText,
            Label: 'Work Center'
        },
        {
            Value: MaintenanceOrder,
            Label: 'Order'
        },
        {
            Value: MaintenanceOrderType,
            Label: 'Order Type'
        },
        {
            Value: MaintenanceActivityType,
            Label: 'Activity Type'
        },
        {
            Value: ConcatenatedActiveSystStsName,
            Label: 'System Status'
        }
    ]}
);

// ---------------------
// Notification Items
// ---------------------

annotate service.NotificationItems with @(

    UI.HeaderInfo: {
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {Value: MaintenanceNotificationItem},
        Description   : {Value: MaintNotifItemText}
    },

    UI.LineItem  : [
        {
            Value: MaintenanceNotificationItem,
            Label: 'Item'
        },
        {
            Value: MaintNotifItemText,
            Label: 'Description'
        },
        {
            Value: MaintNotifDamageCodeGroupName,
            Label: 'Damage Code Group'
        },
        {
            Value: MaintNotifDamageCodeName,
            Label: 'Damage Code'
        },
        {
            Value: MaintNotifObjPrtCodeGroupName,
            Label: 'Object Part Group'
        },
        {
            Value: MaintNotifObjPrtCodeName,
            Label: 'Object Part'
        }
    ]
);
