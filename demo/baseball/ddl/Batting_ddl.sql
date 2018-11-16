-- ----------------------------
--  Table structure for `Batting`
-- ----------------------------
-- DROP TABLE IF EXISTS `Batting`;
CREATE TABLE IF NOT EXISTS `Batting` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stintID` int(11) DEFAULT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `G` int(11) DEFAULT NULL,
  `AB` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `B2` int(11) DEFAULT NULL,
  `B3` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `RBI` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `IBB` varchar(64) DEFAULT NULL,
  `HBP` varchar(64) DEFAULT NULL,
  `SH` varchar(64) DEFAULT NULL,
  `SF` varchar(64) DEFAULT NULL,
  `GIDP` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `stintID`, `teamID`, `lgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

