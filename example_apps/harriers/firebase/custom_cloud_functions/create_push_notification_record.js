const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const db = admin.firestore();

exports.createPushNotificationRecord = functions.https.onRequest(
  async (req, res) => {
    try {
      const timestampData = admin.firestore.FieldValue.serverTimestamp();

      // Parse the request body
      const {
        initialPageName = "Home", // Default value
        notificationText,
        notificationTitle,
        notificationImageUrl, // New field
        parameterData,
      } = req.body;

      // Validate required fields
      if (!notificationText || !notificationTitle) {
        return res.status(400).json({ error: "Missing required fields." });
      }

      // Create the record in Firestore
      const docRef = await db.collection("ff_push_notifications").add({
        initial_page_name: initialPageName, // Map camelCase to Firestore field names
        notification_text: notificationText,
        notification_title: notificationTitle,
        notification_image_url: notificationImageUrl || "", // Default to empty string if not provided
        parameter_data: parameterData || "{}", // Default to empty object
        target_audience: "All", // Static value
        timestamp: timestampData,
      });

      // Respond with success
      return res.status(200).json({
        success: true,
        message: "Notification record created successfully.",
        id: docRef.id,
      });
    } catch (error) {
      console.error("Error creating notification record:", error);
      return res.status(500).json({ error: "Internal server error." });
    }
  },
);
