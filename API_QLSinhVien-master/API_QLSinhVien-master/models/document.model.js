const mongoose = require("mongoose");
const { toJSON, paginate } = require("./plugins");

const documentSchema = mongoose.Schema({
  name: {
    type: String,
  },
  description: {
    type: String,
  },
  content: {
    type: String,
  },
  createdAt: {
    type: Number,
    default: Date.now(),
  },
});

// add plugin that converts mongoose to json
documentSchema.plugin(toJSON);
documentSchema.plugin(paginate);

const Document = mongoose.model("Document", documentSchema);

module.exports = Document;
