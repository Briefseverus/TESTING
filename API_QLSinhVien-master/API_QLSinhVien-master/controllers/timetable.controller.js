const { timetableService } = require("../services");

const createTimetable = async (req, res) => {
  const result = await timetableService.createTimetable(req.body);
  res.send(result);
};

const getTimetables = async (req, res) => {
  const result = await timetableService.getTimetables();
  res.send(result);
};

const getTimetableById = async (req, res) => {
  const result = await timetableService.getTimetableById(req.params.id);
  res.send(result);
};

const getTimetableByIdsv = async (req, res) => {
  const result = await timetableService.getTimetableByIdsv(req.params.idsv);
  res.json({ msg: "", data: result });
};

const updateTimetable = async (req, res) => {
  await timetableService.updateTimetableById(req.params.id, req.body);
  res.send("Updated successfully!");
};

const deleteTimetable = async (req, res) => {
  await timetableService.deleteTimetableById(req.params.id);
  res.send("Deleted successfully!");
};

module.exports = {
  createTimetable,
  getTimetables,
  getTimetableById,
  getTimetableByIdsv,
  updateTimetable,
  deleteTimetable,
};
