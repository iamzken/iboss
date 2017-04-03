-------------------------------------------------------------------------------
--  告警信息
-------------------------------------------------------------------------------

CREATE TABLE `alarm_info` (
`id`  bigint(64) NOT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`status`  int(2) NULL DEFAULT NULL ,
`alarm_config_id`  bigint(64) NULL DEFAULT NULL COMMENT '告警配置id' ,
`ne_id`  bigint(64) NULL DEFAULT NULL COMMENT '网元id' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `alarm_config_id` (`alarm_config_id`) USING BTREE ,
INDEX `ne_id` (`ne_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;


