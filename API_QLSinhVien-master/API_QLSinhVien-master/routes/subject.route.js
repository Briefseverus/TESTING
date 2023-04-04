const express = require("express");
const subjectController = require("../controllers/subject.controller");

const router = express.Router();

router
  .route("/")
  .post(subjectController.createSubject)
  .get(subjectController.getSubjects);

router
  .route("/:id")
  .get(subjectController.getSubjectById)
  .patch(subjectController.updateSubject)
  .delete(subjectController.deleteSubject);

module.exports = router;
