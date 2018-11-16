-- ----------------------------
--  Table structure for `HomeGames`
-- ----------------------------
-- DROP TABLE IF EXISTS `HomeGames`;
CREATE TABLE IF NOT EXISTS `HomeGames` (
  `yearID` int(11) NOT NULL,
  `leagueID` varchar(64) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `parkID` varchar(64) NOT NULL,
  `span_first` varchar(64) DEFAULT NULL,
  `span_last` varchar(64) DEFAULT NULL,
  `games` int(11) DEFAULT NULL,
  `openings` int(11) DEFAULT NULL,
  `attendance` int(11) DEFAULT NULL,
  PRIMARY KEY(`yearID`, `leagueID`, `teamID`, `parkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

