-- ----------------------------
--  Table structure for `Parks`
-- ----------------------------
-- DROP TABLE IF EXISTS `Parks`;
CREATE TABLE IF NOT EXISTS `Parks` (
  `parkID` varchar(64) NOT NULL,
  `park_name` varchar(64) DEFAULT NULL,
  `park_alias` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`parkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

