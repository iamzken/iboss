-------------------------------------------------------------------------------
--  绩效目标
-------------------------------------------------------------------------------

CREATE TABLE `kpi` (
`id`  bigint NOT NULL ,
`name`  varchar(255) NULL ,
`comments`  varchar(255) NULL ,
`type`  int(255) NULL ,
`ne_id`  bigint NULL ,
PRIMARY KEY (`id`)
)
;
