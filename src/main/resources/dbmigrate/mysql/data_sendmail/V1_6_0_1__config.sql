

UPDATE SENDMAIL_CONFIG SET HOST='mail.devaeye.com',PORT=465,USERNAME='admin@devaeye.com',PASSWORD='lingo2mossle',SMTP_STARTTLS=0,SMTP_SSL=1,DEFAULT_FROM='admin@devaeye.com' WHERE ID=1;

UPDATE SENDMAIL_TEMPLATE SET SENDER='测试<admin@devaeye.com>',RECEIVER='国栋<admin@devaeye.com>,vivian<vivian@devaeye.com>' WHERE ID=1;
UPDATE SENDMAIL_TEMPLATE SET SENDER='测试<admin@devaeye.com>',RECEIVER='演示<admin@devaeye.com>' WHERE ID=2;

