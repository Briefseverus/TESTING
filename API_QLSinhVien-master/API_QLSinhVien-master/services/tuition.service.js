const { userService } = require(".");
const { Tuition } = require("../models");

const createTuition = async (body) => {
  return await Tuition.create(body);
};

const getTuitions = async () => {
  return Tuition.find();
};

const getTuitionByIdsv = async (idsv) => {
  const userId = await userService.getUserByIdsv(idsv);
  const result = await Tuition.findOne({ userId });
  return result;
};

const updateTuitionById = async (id, body) => {
  const result = await Tuition.findByIdAndUpdate(id, body);
  return result;
};

const deleteTuitionById = async (id) => {
  const result = await Tuition.findByIdAndDelete(id);
  return result;
};

module.exports = {
  createTuition,
  getTuitions,
  getTuitionByIdsv,
  updateTuitionById,
  deleteTuitionById,
};
