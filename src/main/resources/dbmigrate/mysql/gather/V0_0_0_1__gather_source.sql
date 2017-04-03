-------------------------------------------------------------------------------
--  采集源
-------------------------------------------------------------------------------

create table `gather_source`(
   `id` bigint NOT NULL  COMMENT '主键',
   `name` varchar(255) COMMENT '名称',
   `ip` varchar(255) COMMENT 'ip',
   `db_type` int COMMENT '类型',
   `db_user` varchar(255) COMMENT '用户名',
   `db_password` varchar(255) COMMENT '密码',
   `db_port` varchar(20) COMMENT '端口号',
   `db_sid` varchar(255) COMMENT '实例名',
   `status` int COMMENT '状态',
   PRIMARY KEY (`id`)
 )
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;

