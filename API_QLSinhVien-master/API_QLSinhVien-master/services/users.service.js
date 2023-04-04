const { User } = require("../models");
const jwt = require("jsonwebtoken");

const createUser = async (body) => {
  return await User.create(body);
};

const getUsers = async () => {
  return await User.find();
};

const getUserById = async (id) => {
  return await User.findById(id);
};

const getUserByIdsv = async (idsv) => {
  const result = await User.findOne({ idsv }).populate("className");
  return result;
};

const updateUserById = async (id, body) => {
  const result = await User.findByIdAndUpdate(id, body);
  return result;
};

const updateUserByIdsv = async (idsv, doc) => {
  const id = await User.findOne({ idsv });
  const result = await User.findByIdAndUpdate(id, doc, {
    returnOriginal: true,
  }).populate("className");
  return result;
};

const deleteUserById = async (id) => {
  const result = await User.findByIdAndDelete(id);
  return result;
};

const createToken = async (idsv) => {
  return jwt.sign({ idsv }, "ececececec", {
    expiresIn: "7d",
  });
};

const readToken = async (_token) => {
  try {
    return jwt.verify(_token, "ececececec");
  } catch (e) {
    return null;
  }
};

const readUserFromToken = async (token) => {
  const payload = await readToken(token);
  if (payload) {
    return getUserByIdsv(payload.idsv);
  }
};

module.exports = {
  createUser,
  getUsers,
  getUserById,
  updateUserById,
  updateUserByIdsv,
  deleteUserById,
  getUserByIdsv,
  createToken,
  readToken,
  readUserFromToken,
};
