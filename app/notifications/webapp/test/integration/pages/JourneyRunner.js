sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"notifications/test/integration/pages/NotificationsList",
	"notifications/test/integration/pages/NotificationsObjectPage"
], function (JourneyRunner, NotificationsList, NotificationsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('notifications') + '/test/flp.html#app-preview',
        pages: {
			onTheNotificationsList: NotificationsList,
			onTheNotificationsObjectPage: NotificationsObjectPage
        },
        async: true
    });

    return runner;
});

