-------------------------------------------------------------------------------
--  告警配置
-------------------------------------------------------------------------------
ALTER TABLE `alarm_config`
DROP COLUMN `notice_type`,
ADD COLUMN `mail_notice` INT(2) NULL AFTER `notice_send_time`,
ADD COLUMN `sms_notice` INT(2) NULL AFTER `mail_notice`;
