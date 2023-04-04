const { subjectService } = require("../services");

const createSubject = async (req, res) => {
  const result = await subjectService.createSubject(req.body);
  res.send(result);
};

const getSubjects = async (req, res) => {
  const result = await subjectService.getSubjects();
  res.send(result);
};

const getSubjectById = async (req, res) => {
  const result = await subjectService.getSubjectById(req.params.id);
  res.send(result);
};

const updateSubject = async (req, res) => {
  await subjectService.updateSubjectById(req.params.id, req.body);
  res.send("Updated successfully!");
};

const deleteSubject = async (req, res) => {
  await subjectService.deleteSubjectById(req.params.id);
  res.send("Deleted successfully!");
};

module.exports = {
  createSubject,
  getSubjects,
  getSubjectById,
  updateSubject,
  deleteSubject,
};
