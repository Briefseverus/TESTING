const express = require("express");
const documentController = require("../controllers/document.controller");

const multer = require("multer");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./public/uploads/document");
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(null, file.fieldname + "-" + uniqueSuffix + file.originalname);
  },
});

const upload = multer({ storage: storage });

const router = express.Router();

router
  .route("/")
  .post(upload.single("content"), documentController.createDocument)
  .get(documentController.getDocuments);

router
  .route("/:id")
  .get(documentController.getDocumentById)
  .patch(upload.single("content"), documentController.updateDocument)
  .delete(documentController.deleteDocument);

module.exports = router;
