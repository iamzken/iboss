-------------------------------------------------------------------------------
-- 采集计划 与采集计划任务
-------------------------------------------------------------------------------
CREATE TABLE `gather_plan` (
`id`  bigint(20) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`task_num`  int(11) NULL DEFAULT NULL ,
`orders`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;


CREATE TABLE `gather_plan_task` (
`id`  bigint(20) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`gather_target_id`  bigint(20) NULL DEFAULT NULL ,
`gather_object_id`  bigint(20) NULL DEFAULT NULL ,
`frequency`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`orders`  int(255) NULL DEFAULT NULL ,
`gather_plan_id`  bigint(20) NULL DEFAULT NULL ,
`is_default`  int(1) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;

