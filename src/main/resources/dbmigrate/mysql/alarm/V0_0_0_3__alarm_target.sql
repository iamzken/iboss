-------------------------------------------------------------------------------
--  告警目标
-------------------------------------------------------------------------------

CREATE TABLE `alarm_target` (
`id`  bigint(64) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sql_`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`orders`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;

