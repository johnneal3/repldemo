-- ----------------------------
--  Table structure for `Schools`
-- ----------------------------
-- DROP TABLE IF EXISTS `Schools`;
CREATE TABLE IF NOT EXISTS `Schools` (
  `schoolID` varchar(64) NOT NULL,
  `name_full` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`schoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

