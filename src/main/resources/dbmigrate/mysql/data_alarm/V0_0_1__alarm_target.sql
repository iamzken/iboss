-------------------------------------------------------------------------------
--  告警指标对象初始化数据
-------------------------------------------------------------------------------

INSERT INTO `alarm_target` (`id`,`name`,`sql_`,`orders`) VALUES (512948291829760,'CPU使用率','SELECT  cpu_usage FROM  TBL_PERFORMANCE_INF',NULL);
INSERT INTO `alarm_target` (`id`,`name`,`sql_`,`orders`) VALUES (512948660846592,'小升初入学报名百分比','SELECT  enroll_percentage FROM  TBL_ENROLL_INF',NULL);
INSERT INTO `alarm_target` (`id`,`name`,`sql_`,`orders`) VALUES (512948975779840,'内存使用率','SELECT  mem_usage FROM  TBL_PERFORMANCE_INF',NULL);
INSERT INTO `alarm_target` (`id`,`name`,`sql_`,`orders`) VALUES (512949281062912,'报名发布日期','SELECT  publish_date FROM  TBL_ENROLL_INF',NULL);
