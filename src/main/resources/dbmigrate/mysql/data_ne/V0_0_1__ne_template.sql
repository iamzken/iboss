-------------------------------------------------------------------------------
--  网元模板初始化数据
-------------------------------------------------------------------------------

INSERT INTO ne_template (id,name,parent_id,type) VALUES (1,'系统',null,1);

INSERT INTO ne_template (id,name,parent_id,type) VALUES (2,'模块',1,1);

INSERT INTO ne_template (id,name,parent_id,type) VALUES (3,'业务功能',2,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (4,'网络硬件',2,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (5,'应用软件',2,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (6,'业务流程',2,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (7,'数据对接',2,1);

INSERT INTO ne_template (id,name,parent_id,type) VALUES (8,'招生政策',3,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (9,'民办报名',3,1);

INSERT INTO ne_template (id,name,parent_id,type) VALUES (10,'主机',4,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (11,'负载均衡',4,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (12,'CDN',4,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (13,'VmWare',4,1);

INSERT INTO ne_template (id,name,parent_id,type) VALUES (14,'幼升小',6,1);
INSERT INTO ne_template (id,name,parent_id,type) VALUES (15,'小升初',6,1);


INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (1,'系统名称',1,1,1,'xtmc');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (2,'系统说明',1,2,1,'xtsm');

INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (3,'模块名称',1,1,2,'mkmc');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (4,'模块说明',1,2,2,'mksm');

INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (5,'功能名称',1,1,3,'gnmc');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (6,'功能说明',1,2,3,'gnsm');

INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (7,'硬件名称',1,1,4,'yjmc');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (8,'硬件说明',1,2,4,'yjsm');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (9,'硬件地址',1,3,4,'yjdz');

INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (10,'软件名称',1,1,5,'rjmc');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (11,'软件说明',1,2,5,'rjsm');

INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (12,'招生学段',1,1,6,'zsxd');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (13,'招生规则',1,1,6,'zsgz');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (14,'寄宿制形式',1,1,6,'jszxx');
INSERT INTO ne_template_detail (id,name,type,orders,ne_template_id,code_) VALUES (15,'农民工学校',1,1,6,'nmgxx');
