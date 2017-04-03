

INSERT INTO SENDMAIL_CONFIG(ID,NAME,HOST,USERNAME,PASSWORD,SMTP_AUTH,SMTP_STARTTLS,STATUS,DEFAULT_FROM,TENANT_ID) VALUES(1,'default','smtp.gmail.com','demo@gmail.com','demo5mossle',1,1,1,'demo@gmail.com',1);

INSERT INTO SENDMAIL_TEMPLATE(ID,NAME,SENDER,RECEIVER,SUBJECT,CONTENT,MANUAL) VALUES(1,'test','测试<demo@gmail.com>','xyz20003<xyz20003@gmail.com>,国栋<admin@devaeye.com>','test','test',0);


INSERT INTO SENDMAIL_TEMPLATE(ID,NAME,SENDER,RECEIVER,SUBJECT,CONTENT,MANUAL) VALUES(2,'template','测试<demo@gmail.com>','演示<demo@gmail.com>','template','${name}<#list list as item>${item}</#list>',1);

