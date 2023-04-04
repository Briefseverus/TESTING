const { Document } = require("../models");

const createDocument = async (body) => {
  return await Document.create(body);
};

const getDocuments = async () => {
  return Document.find();
};

const getDocumentById = async (id) => {
  return Document.findById(id);
};

const updateDocumentById = async (id, body) => {
  const result = await Document.findByIdAndUpdate(id, body);
  return result;
};

const deleteDocumentById = async (id) => {
  const result = await Document.findByIdAndDelete(id);
  return result;
};

module.exports = {
  createDocument,
  getDocuments,
  getDocumentById,
  updateDocumentById,
  deleteDocumentById,
};
