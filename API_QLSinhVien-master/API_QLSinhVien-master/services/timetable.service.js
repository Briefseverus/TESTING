const { Timetable, User } = require("../models");

const createTimetable = async (body) => {
  return await Timetable.create(body);
};

const getTimetables = async () => {
  return Timetable.find();
};

const getTimetableById = async (id) => {
  return Timetable.findById(id);
};

const getTimetableByIdsv = async (idsv) => {
  const user = await User.findOne({ idsv });
  const idClass = user.className.toString();
  const result = await Timetable.find({ className: idClass }).populate(
    "className subject",
  );
  return result;
};

const updateTimetableById = async (id, body) => {
  const result = await Timetable.findByIdAndUpdate(id, body);
  return result;
};

const deleteTimetableById = async (id) => {
  const result = await Timetable.findByIdAndDelete(id);
  return result;
};

module.exports = {
  createTimetable,
  getTimetables,
  getTimetableById,
  getTimetableByIdsv,
  updateTimetableById,
  deleteTimetableById,
};
