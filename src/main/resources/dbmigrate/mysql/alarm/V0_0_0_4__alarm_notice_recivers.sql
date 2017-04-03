-------------------------------------------------------------------------------
--  告警通知收件人
-------------------------------------------------------------------------------

CREATE TABLE `alarm_notice_recivers` (
`id`  bigint(64) NOT NULL ,
`user_id`  bigint(64) NULL DEFAULT NULL ,
`alarm_config_id`  bigint(64) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;

