-- ----------------------------
--  Table structure for `Appearances`
-- ----------------------------
-- DROP TABLE IF EXISTS `Appearances`;
CREATE TABLE IF NOT EXISTS `Appearances` (
  `yearID` int(11) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `playerID` varchar(64) NOT NULL,
  `G_all` int(11) DEFAULT NULL,
  `GS` varchar(64) DEFAULT NULL,
  `G_batting` int(11) DEFAULT NULL,
  `G_defense` int(11) DEFAULT NULL,
  `G_p` int(11) DEFAULT NULL,
  `G_c` int(11) DEFAULT NULL,
  `G_1b` int(11) DEFAULT NULL,
  `G_2b` int(11) DEFAULT NULL,
  `G_3b` int(11) DEFAULT NULL,
  `G_ss` int(11) DEFAULT NULL,
  `G_lf` int(11) DEFAULT NULL,
  `G_cf` int(11) DEFAULT NULL,
  `G_rf` int(11) DEFAULT NULL,
  `G_of` int(11) DEFAULT NULL,
  `G_dh` varchar(64) DEFAULT NULL,
  `G_ph` varchar(64) DEFAULT NULL,
  `G_pr` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`yearID`, `teamID`, `lgID`, `playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

