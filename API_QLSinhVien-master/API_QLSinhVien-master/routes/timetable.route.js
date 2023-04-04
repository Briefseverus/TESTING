const express = require("express");
const timetableController = require("../controllers/timetable.controller");

const router = express.Router();

router
  .route("/")
  .post(timetableController.createTimetable)
  .get(timetableController.getTimetables);

router.route("/user/:idsv").get(timetableController.getTimetableByIdsv);

router
  .route("/:id")
  .get(timetableController.getTimetableById)
  .patch(timetableController.updateTimetable)
  .delete(timetableController.deleteTimetable);

module.exports = router;
