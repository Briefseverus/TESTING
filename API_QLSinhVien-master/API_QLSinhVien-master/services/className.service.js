const { ClassName } = require("../models");

const createClassName = async (body) => {
  return await ClassName.create(body);
};

const getClassNames = async () => {
  return ClassName.find();
};

const getClassNameById = async (id) => {
  return ClassName.findById(id);
};

const updateClassNameById = async (id, body) => {
  const result = await ClassName.findByIdAndUpdate(id, body);
  return result;
};

const deleteClassNameById = async (id) => {
  const result = await ClassName.findByIdAndDelete(id);
  return result;
};

module.exports = {
  createClassName,
  getClassNames,
  getClassNameById,
  updateClassNameById,
  deleteClassNameById,
};
