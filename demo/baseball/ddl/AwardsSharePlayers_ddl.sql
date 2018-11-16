-- ----------------------------
--  Table structure for `AwardsSharePlayers`
-- ----------------------------
-- DROP TABLE IF EXISTS `AwardsSharePlayers`;
CREATE TABLE IF NOT EXISTS `AwardsSharePlayers` (
  `awardID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `playerID` varchar(64) NOT NULL,
  `pointsWon` int(11) DEFAULT NULL,
  `pointsMax` int(11) DEFAULT NULL,
  `votesFirst` int(11) DEFAULT NULL,
  PRIMARY KEY(`awardID`, `yearID`, `lgID`, `playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

