const mongoose = require("mongoose");
const { toJSON, paginate } = require("./plugins");

const subjectSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  numOfLesson: {
    type: Number,
    default: 0,
  },
  createdAt: {
    type: Number,
    default: Date.now(),
  },
});

// add plugin that converts mongoose to json
subjectSchema.plugin(toJSON);
subjectSchema.plugin(paginate);

const Subject = mongoose.model("Subject", subjectSchema);

module.exports = Subject;
