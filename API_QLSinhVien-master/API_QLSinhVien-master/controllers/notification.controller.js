const { notificationService } = require("../services");

const createNotification = async (req, res) => {
  const result = await notificationService.createNotification(req.body, res);
  res.send(result);
};

const getNotifications = async (req, res) => {
  const result = await notificationService.getNotifications();
  res.json({ msg: "", data: result });
};

const getNotificationById = async (req, res) => {
  const result = await notificationService.getNotificationById(req.params.id);
  res.send(result);
};

const updateNotification = async (req, res) => {
  await notificationService.updateNotificationById(req.params.id, req.body);
  res.send("Updated successfully!");
};

const deleteNotification = async (req, res) => {
  await notificationService.deleteNotificationById(req.params.id);
  res.send("Deleted successfully!");
};

const paginate = async (req, res) => {
  const result = await notificationService.paginate(req.query.size);
  res.json({ msg: "", data: result });
};

module.exports = {
  createNotification,
  getNotifications,
  getNotificationById,
  updateNotification,
  deleteNotification,
  paginate,
};
