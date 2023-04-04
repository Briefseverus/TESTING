const express = require("express");
const tuitionController = require("../controllers/tuition.controller");

const router = express.Router();

router
  .route("/")
  .post(tuitionController.createTuition)
  .get(tuitionController.getTuitions);

router.route("/user/:idsv").get(tuitionController.getTuitionByIdsv);

router
  .route("/:id")
  .patch(tuitionController.updateTuition)
  .delete(tuitionController.deleteTuition);

module.exports = router;
