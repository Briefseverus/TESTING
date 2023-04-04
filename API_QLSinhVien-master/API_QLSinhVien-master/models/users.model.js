const mongoose = require("mongoose");
const { toJSON, paginate } = require("./plugins");

const usersSchema = mongoose.Schema({
  idsv: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
    default: "abc.12345",
  },
  name: String,
  department: String,
  cccd: String,
  address: String,
  phone: String,
  className: {
    type: mongoose.SchemaTypes.ObjectId,
    ref: "ClassName",
  },
  createdAt: {
    type: Number,
    default: Date.now(),
  },
});

// add plugin that converts mongoose to json
usersSchema.plugin(toJSON);
usersSchema.plugin(paginate);

const User = mongoose.model("User", usersSchema);

module.exports = User;
