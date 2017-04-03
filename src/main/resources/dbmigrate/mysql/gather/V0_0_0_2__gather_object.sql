-------------------------------------------------------------------------------
--  采集源
-------------------------------------------------------------------------------

create table `gather_object`(
   `id` bigint NOT NULL COMMENT '主键',
   `name` varchar(255) COMMENT '数据采集对象名称',
   `comment` varchar(255) COMMENT '采集对象说明',
   `gather_source_id` bigint COMMENT '采集源数据库ID',
   `db_table_name` varchar(255) COMMENT '采集源数据库表名',
   `sql` longtext COMMENT '采集SQL脚本',
   PRIMARY KEY (`id`)
 )
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;

