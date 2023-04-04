const express = require("express");
const userRoute = require("./users.route");
const notificationRoute = require("./notification.route");
const tuitionRoute = require("./tuition.route");
const documentRoute = require("./document.route");
const classNameRoute = require("./className.route");
const subjectRoute = require("./subject.route");
const timetableRoute = require("./timetable.route");

var router = express.Router();

const defaultRoutes = [
  {
    path: "/users",
    route: userRoute,
  },
  {
    path: "/notifications",
    route: notificationRoute,
  },
  {
    path: "/tuitions",
    route: tuitionRoute,
  },
  {
    path: "/documents",
    route: documentRoute,
  },
  {
    path: "/classnames",
    route: classNameRoute,
  },
  {
    path: "/subjects",
    route: subjectRoute,
  },
  {
    path: "/timetables",
    route: timetableRoute,
  },
];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

module.exports = router;
