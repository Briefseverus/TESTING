const { userService } = require("../services");

const createUser = async (req, res) => {
  const result = await userService.createUser(req.body);
  res.send(result);
};

const getUsers = async (req, res) => {
  const result = await userService.getUsers();
  res.send(result);
};

const getUserById = async (req, res) => {
  const result = await userService.getUserById(req.params.id);
  res.send(result);
};

const updateUser = async (req, res) => {
  const dataUpdate = await userService.updateUserById(req.params.id, req.body);
  res.json({ msg: "Updated successfully!", data: dataUpdate, error: true });
};

const updateUserByIdsv = async (req, res) => {
  const dataUpdate = await userService.updateUserByIdsv(req.params.idsv, {
    phone: req.body.phone,
    cccd: req.body.cccd,
    address: req.body.address,
  });
  res.json({ msg: "Updated successfully!", data: dataUpdate, error: true });
};

const deleteUser = async (req, res, next) => {
  await userService.deleteUserById(req.params.id);
  res.send("Deleted successfully!");
};

// Đăng nhập
const login = async (req, res) => {
  const user = await userService.getUserByIdsv(req.body.idsv);

  if (!user)
    return res.status(401).json({ msg: "Incorrect email or password!" });

  if (req.body.password != user.password) {
    return res.status(401).json({ msg: "Incorrect email or password!" });
  } else {
    const token = await userService.createToken(user.idsv);
    return res.json({ msg: "Successfully!", data: token });
  }
};

const getMe = ({ user }, res) => {
  if (!user) {
    return res.status(401).json({ msg: "Bạn chưa đăng nhập!" });
  }
  return res.json({ data: user });
};

module.exports = {
  createUser,
  getUsers,
  getUserById,
  updateUser,
  updateUserByIdsv,
  deleteUser,
  login,
  getMe,
};
