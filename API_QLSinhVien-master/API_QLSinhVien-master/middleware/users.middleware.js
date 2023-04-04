const { userService } = require("../services");

module.exports = async (req, res, next) => {
  const token = req.headers.authorization || "";
  let user = undefined;
  if (token) {
    user = await userService.readUserFromToken(token.replace("Bearer ", ""));
  }
  req.user = user;
  next();
};
