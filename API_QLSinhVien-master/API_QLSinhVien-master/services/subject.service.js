const { Subject } = require("../models");

const createSubject = async (body) => {
  return await Subject.create(body);
};

const getSubjects = async () => {
  return Subject.find();
};

const getSubjectById = async (id) => {
  return Subject.findById(id);
};

const updateSubjectById = async (id, body) => {
  const result = await Subject.findByIdAndUpdate(id, body);
  return result;
};

const deleteSubjectById = async (id) => {
  const result = await Subject.findByIdAndDelete(id);
  return result;
};

module.exports = {
  createSubject,
  getSubjects,
  getSubjectById,
  updateSubjectById,
  deleteSubjectById,
};
