const express = require("express");
const userController = require("../controllers/users.controller");

const router = express.Router();

router.route("/").post(userController.createUser).get(userController.getUsers);

router.route("/login").post(userController.login);

router.route("/me").get(userController.getMe);

router.route("/update/:idsv").patch(userController.updateUserByIdsv);

router
  .route("/:id")
  .get(userController.getUserById)
  .patch(userController.updateUser)
  .delete(userController.deleteUser);

module.exports = router;
