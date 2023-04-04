const { documentService } = require("../services");
const fs = require("fs");

const filePath = "./public/uploads/document/";

const createDocument = async (req, res) => {
  if (req.file != undefined) {
    req.body.content = req.file.filename;
  }
  const result = await documentService.createDocument(req.body);
  res.send(result);
};

const getDocuments = async (req, res) => {
  const result = await documentService.getDocuments();
  res.json({ msg: "", data: result });
};

const getDocumentById = async (req, res) => {
  const result = await documentService.getDocumentById(req.params.id);
  res.send(result);
};

const updateDocument = async (req, res) => {
  const document = await documentService.getDocumentById(req.params.id);
  const fileDocument = document.content;
  if (req.file != undefined) {
    fs.unlinkSync(filePath + fileDocument);
    req.body.content = req.file.filename;
  }
  await documentService.updateDocumentById(req.params.id, req.body);
  res.send("Updated successfully!");
};

const deleteDocument = async (req, res) => {
  const document = await documentService.getDocumentById(req.params.id);
  const fileDocument = document.content;
  fs.unlinkSync(filePath + fileDocument);
  await documentService.deleteDocumentById(req.params.id);
  res.send("Deleted successfully!");
};

module.exports = {
  createDocument,
  getDocuments,
  getDocumentById,
  updateDocument,
  deleteDocument,
};
