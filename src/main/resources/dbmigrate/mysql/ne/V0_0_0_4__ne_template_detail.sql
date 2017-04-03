-------------------------------------------------------------------------------
--  网元模板详细
-------------------------------------------------------------------------------
CREATE TABLE `ne_template_detail` (
`id`  bigint(64) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  int(2) NULL DEFAULT NULL ,
`orders`  int(11) NULL DEFAULT NULL ,
`ne_template_id`  bigint(64) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`) USING BTREE ,
INDEX `ne_template_id` (`ne_template_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;

