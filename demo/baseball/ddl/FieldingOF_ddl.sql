-- ----------------------------
--  Table structure for `FieldingOF`
-- ----------------------------
-- DROP TABLE IF EXISTS `FieldingOF`;
CREATE TABLE IF NOT EXISTS `FieldingOF` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stintID` int(11) DEFAULT NULL,
  `Glf` int(11) DEFAULT NULL,
  `Gcf` int(11) DEFAULT NULL,
  `Grf` int(11) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `stintID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

