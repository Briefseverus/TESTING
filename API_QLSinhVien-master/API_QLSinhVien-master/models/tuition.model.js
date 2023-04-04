const mongoose = require("mongoose");
const { toJSON, paginate } = require("./plugins");

const tuitionSchema = mongoose.Schema({
  userId: {
    type: mongoose.SchemaTypes.ObjectId,
    ref: "User",
    required: true,
  },
  totalTuition: {
    type: Number,
    required: true,
    default: 0,
  },
  feePaid: {
    type: Number,
    default: 0,
  },
  createdAt: {
    type: Number,
    default: Date.now(),
  },
});

// add plugin that converts mongoose to json
tuitionSchema.plugin(toJSON);
tuitionSchema.plugin(paginate);

const Tuition = mongoose.model("Tuition", tuitionSchema);

module.exports = Tuition;
