const mongoose = require("mongoose");
const { toJSON, paginate } = require("./plugins");

const timetableSchema = mongoose.Schema({
  subject: {
    type: mongoose.SchemaTypes.ObjectId,
    ref: "Subject",
  },

  className: {
    type: mongoose.SchemaTypes.ObjectId,
    ref: "ClassName",
  },

  day: Number,
  session: Number,
  stage: [Number],

  createdAt: {
    type: Number,
    default: Date.now(),
  },
});

// add plugin that converts mongoose to json
timetableSchema.plugin(toJSON);
timetableSchema.plugin(paginate);

const Timetable = mongoose.model("Timetable", timetableSchema);

module.exports = Timetable;
