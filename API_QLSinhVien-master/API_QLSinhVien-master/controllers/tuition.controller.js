const { tuitionService } = require("../services");

const createTuition = async (req, res) => {
  const result = await tuitionService.createTuition(req.body);
  res.send(result);
};

const getTuitions = async (req, res) => {
  const result = await tuitionService.getTuitions();
  res.send(result);
};

const getTuitionByIdsv = async (req, res) => {
  const result = await tuitionService.getTuitionByIdsv(req.params.idsv);
  res.json({ msg: "", data: result });
};

const updateTuition = async (req, res) => {
  await tuitionService.updateTuitionById(req.params.id, req.body);
  res.send("Updated successfully!");
};

const deleteTuition = async (req, res) => {
  await tuitionService.deleteTuitionById(req.params.id);
  res.send("Deleted successfully!");
};

module.exports = {
  createTuition,
  getTuitions,
  getTuitionByIdsv,
  updateTuition,
  deleteTuition,
};
