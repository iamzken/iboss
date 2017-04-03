
-------------------------------------------------------------------------------
--  网元详细
-------------------------------------------------------------------------------

CREATE TABLE `ne_detail` (
`id`  bigint(64) NOT NULL ,
`ne_id`  bigint(64) NULL DEFAULT NULL COMMENT '网元的外键' ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`orders`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `ne_id` (`ne_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;