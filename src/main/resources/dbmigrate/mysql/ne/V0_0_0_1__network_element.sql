-------------------------------------------------------------------------------
--  网元
-------------------------------------------------------------------------------

CREATE TABLE `network_elements` (
`id`  bigint(64) NOT NULL ,
`parent_id`  bigint(64) UNSIGNED NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`orders`  int(11) UNSIGNED NULL DEFAULT NULL ,
`type`  int(2) NULL DEFAULT NULL ,
`ne_template`  bigint(64) UNSIGNED NULL DEFAULT NULL ,
`section`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生学段' ,
`rule`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生规则' ,
`boarding`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄宿形式' ,
`migrant`  int(1) NULL DEFAULT NULL COMMENT '是否农民工学校' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `parent_id` (`parent_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;