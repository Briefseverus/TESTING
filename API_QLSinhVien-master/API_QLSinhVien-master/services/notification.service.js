const { Notification } = require("../models");
var admin = require("firebase-admin");
var serviceAccount = require("../service-account.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const notification_options = {
  priority: "high",
  timeToLive: 60 * 60 * 24,
};

const createNotification = async (body) => {
  const registrationToken = body.registrationToken;

  const message = {
    notification: {
      title: body.name,
      body: body.description,
    },
  };
  console.log(message);

  const options = notification_options;

  admin
    .messaging()
    .sendToDevice(registrationToken, message, options)

    .catch((error) => {
      console.log(error);
    });

  return await Notification.create(body);
};

const getNotifications = async () => {
  return Notification.find();
};

const getNotificationById = async (id) => {
  return Notification.findById(id);
};

const updateNotificationById = async (id, body) => {
  const result = await Notification.findByIdAndUpdate(id, body);
  return result;
};

const deleteNotificationById = async (id) => {
  const result = await Notification.findByIdAndDelete(id);
  return result;
};

const paginate = async (size) => {
  const result = await Notification.find().sort({ createdAt: 1 }).limit(size);
  return result;
};

module.exports = {
  createNotification,
  getNotifications,
  getNotificationById,
  updateNotificationById,
  deleteNotificationById,
  paginate,
};
