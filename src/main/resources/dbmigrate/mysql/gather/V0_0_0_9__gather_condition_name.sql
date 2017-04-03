-------------------------------------------------------------------------------
-- 采集对象 sql字段更改
-------------------------------------------------------------------------------
ALTER TABLE gather_condition CHANGE COLUMN `condition` condition_ varchar(255);
ALTER TABLE gather_condition CHANGE COLUMN `value` value_ varchar(255);
ALTER TABLE gather_condition CHANGE COLUMN `relation` relation_ varchar(255);

ALTER TABLE gather_condition MODIFY column id bigint(64);
ALTER TABLE gather_condition MODIFY column gather_object_id bigint(64);