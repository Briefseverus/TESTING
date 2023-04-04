const express = require("express");
const classNameController = require("../controllers/className.controller");

const router = express.Router();

router
  .route("/")
  .post(classNameController.createClassName)
  .get(classNameController.getClassNames);

router
  .route("/:id")
  .get(classNameController.getClassNameById)
  .patch(classNameController.updateClassName)
  .delete(classNameController.deleteClassName);

module.exports = router;
