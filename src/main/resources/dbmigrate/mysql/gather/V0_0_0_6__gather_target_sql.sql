-------------------------------------------------------------------------------
-- 采集目标增加ddl sql字段
-- 删除 采集对象列上面的 sql 字段
-------------------------------------------------------------------------------
ALTER TABLE gather_target ADD sql_ varchar(4000);

