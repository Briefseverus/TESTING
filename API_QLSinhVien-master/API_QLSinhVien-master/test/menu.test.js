const mongoose = require("mongoose");
const { Timetable } = require("../models");
const MONGODB_URL =
  "mongodb+srv://lovemtp12:lovemtp12@cluster0.finfj.mongodb.net/APIQLSinhVien?retryWrites=true&w=majority";

const connectDB = async () => {
  try {
    await mongoose.connect(MONGODB_URL, {});
    console.log("Connected to MongoDB");
  } catch (err) {
    console.log(err.message);
    process.exit(1);
  }
};

(async () => {
  await connectDB();

  const data = await Timetable.aggregate([
    {
      $match: {},
    },
    {
      $group: {},
    },
  ]);

  console.log(data);
})();
