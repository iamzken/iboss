-------------------------------------------------------------------------------
--  告警配置
-------------------------------------------------------------------------------

CREATE TABLE `alarm_config` (
`id`  bigint(64) NOT NULL ,
`ne_id`  bigint(64) NULL DEFAULT NULL COMMENT '网元id' ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`alarm_target_id`  bigint(64) NULL DEFAULT NULL COMMENT '告警指标对象，关联到告警指标' ,
`threshold`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阀值描述' ,
`levels`  int(2) NULL DEFAULT NULL COMMENT '等级' ,
`comments`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注释说明' ,
`upgrade_rule`  int(2) NULL DEFAULT NULL COMMENT '升级规则的类型' ,
`time_rule`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间规则' ,
`time_unit`  int(2) NULL DEFAULT NULL COMMENT '时间类型' ,
`threshold_unit`  int(2) NULL DEFAULT NULL COMMENT '阀值单位' ,
`upgrade_type`  int(2) NULL DEFAULT NULL COMMENT '警告升级的类型' ,
`notice_type`  int(2) NULL DEFAULT NULL COMMENT '10-邮件 01-短信 11-邮件短信 00-都不选' ,
`notice_send_type`  int(2) NULL DEFAULT NULL COMMENT '通知发送类型  0-立即发送  1-定时发送' ,
`notice_send_time`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用ISO时间表达式 P1M  之类的形式标识' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `ne_id` (`ne_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;

