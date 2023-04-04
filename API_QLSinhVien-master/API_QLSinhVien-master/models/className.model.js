const mongoose = require("mongoose");
const { toJSON, paginate } = require("./plugins");

const classNameSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  createdAt: {
    type: Number,
    default: Date.now(),
  },
});

// add plugin that converts mongoose to json
classNameSchema.plugin(toJSON);
classNameSchema.plugin(paginate);

const ClassName = mongoose.model("ClassName", classNameSchema);

module.exports = ClassName;
