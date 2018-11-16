-- ----------------------------
--  Table structure for `FieldingOFsplit`
-- ----------------------------
-- DROP TABLE IF EXISTS `FieldingOFsplit`;
CREATE TABLE IF NOT EXISTS `FieldingOFsplit` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stintID` int(11) DEFAULT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `POS` varchar(64) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `InnOuts` int(11) DEFAULT NULL,
  `PO` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `PB` varchar(64) DEFAULT NULL,
  `WP` varchar(64) DEFAULT NULL,
  `SB` varchar(64) DEFAULT NULL,
  `CS` varchar(64) DEFAULT NULL,
  `ZR` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `stintID`, `teamID`, `lgID`, `POS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

