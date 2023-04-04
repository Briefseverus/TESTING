const mongoose = require("mongoose");
const { toJSON, paginate } = require("./plugins");

const notificationSchema = mongoose.Schema({
  registrationToken: String,
  name: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    default: "Hổng có chi cạ!",
  },
  createdAt: {
    type: Number,
    default: Date.now(),
  },
});

// add plugin that converts mongoose to json
notificationSchema.plugin(toJSON);
notificationSchema.plugin(paginate);

const Notification = mongoose.model("Notification", notificationSchema);

module.exports = Notification;
