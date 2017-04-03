-------------------------------------------------------------------------------
--  网元模板
-------------------------------------------------------------------------------
CREATE TABLE `ne_template` (
`id`  bigint(64) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`parent_id`  bigint(64) NULL DEFAULT NULL ,
`type`  int(2) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `parent_id` (`parent_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;
