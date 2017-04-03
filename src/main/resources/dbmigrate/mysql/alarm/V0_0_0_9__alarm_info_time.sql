-------------------------------------------------------------------------------
--  告警info增加first_time，last_time字段
-------------------------------------------------------------------------------

ALTER TABLE `alarm_info`
DROP COLUMN `create_time`,
ADD COLUMN `first_time` DATETIME NULL AFTER `ne_id`,
ADD COLUMN `last_time` DATETIME NULL AFTER `first_time`;