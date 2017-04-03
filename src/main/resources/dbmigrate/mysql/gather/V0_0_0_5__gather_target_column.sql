-------------------------------------------------------------------------------
--  采集目标列
-------------------------------------------------------------------------------

CREATE TABLE `gather_target_column` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '字段名',
  `type` varchar(255) DEFAULT NULL COMMENT '字段类型',
  `key_` int(2) DEFAULT NULL COMMENT '是否主键',
  `nill` int(2) DEFAULT NULL COMMENT '允许为空',
  `gather_target_id` bigint(64) DEFAULT NULL COMMENT '目标库ID',
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;