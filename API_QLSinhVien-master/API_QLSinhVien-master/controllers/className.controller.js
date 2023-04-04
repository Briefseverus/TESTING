const { classNameService } = require("../services");

const createClassName = async (req, res) => {
  const result = await classNameService.createClassName(req.body);
  res.send(result);
};

const getClassNames = async (req, res) => {
  const result = await classNameService.getClassNames();
  res.send(result);
};

const getClassNameById = async (req, res) => {
  const result = await classNameService.getClassNameById(req.params.id);
  res.send(result);
};

const updateClassName = async (req, res) => {
  await classNameService.updateClassNameById(req.params.id, req.body);
  res.send("Updated successfully!");
};

const deleteClassName = async (req, res) => {
  await classNameService.deleteClassNameById(req.params.id);
  res.send("Deleted successfully!");
};

module.exports = {
  createClassName,
  getClassNames,
  getClassNameById,
  updateClassName,
  deleteClassName,
};
