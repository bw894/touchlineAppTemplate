const admin = require("firebase-admin/app");
admin.initializeApp();

const createPushNotificationRecord = require("./create_push_notification_record.js");
exports.createPushNotificationRecord =
  createPushNotificationRecord.createPushNotificationRecord;
