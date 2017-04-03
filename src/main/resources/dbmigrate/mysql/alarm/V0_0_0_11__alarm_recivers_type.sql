-------------------------------------------------------------------------------
--  recivers表增加type字段，sms, email
-------------------------------------------------------------------------------

ALTER TABLE `alarm_notice_recivers` ADD COLUMN `type` varchar(20) AFTER `alarm_config_id`;