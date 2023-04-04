const express = require("express");
const notificationController = require("../controllers/notification.controller");

const router = express.Router();

router
  .route("/")
  .post(notificationController.createNotification)
  .get(notificationController.getNotifications);

router.route("/paginate").get(notificationController.paginate);

router
  .route("/:id")
  .get(notificationController.getNotificationById)
  .patch(notificationController.updateNotification)
  .delete(notificationController.deleteNotification);

module.exports = router;
