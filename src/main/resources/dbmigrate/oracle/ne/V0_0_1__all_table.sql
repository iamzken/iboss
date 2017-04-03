/*
Navicat MySQL Data Transfer

Source Server         : 我的本机
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : iboss

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-02-17 15:06:34
*/

/* SET FOREIGN_KEY_CHECKS=0; */

-- ----------------------------
-- Table structure for account_avatar
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_avatar';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_avatar (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  CODE varchar2(200) DEFAULT NULL,
  ACCOUNT_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_ACCOUNT_AVATAR_ACCOUNT FOREIGN KEY (ACCOUNT_ID) REFERENCES account_info (ID)
) ;

CREATE INDEX FK_ACCOUNT_AVATAR_ACCOUNT ON account_avatar (ACCOUNT_ID);

-- ----------------------------
-- Records of account_avatar
-- ----------------------------

-- ----------------------------
-- Table structure for account_credential
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_credential';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_credential (
  ID number(19) NOT NULL,
  PASSWORD varchar2(50) DEFAULT NULL,
  MODIFY_TIME timestamp(0) DEFAULT NULL,
  EXPIRE_TIME timestamp(0) DEFAULT NULL,
  EXPIRE_STATUS varchar2(50) DEFAULT NULL,
  REQUIRED varchar2(50) DEFAULT NULL,
  COULD_MODIFY varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  CATALOG varchar2(50) DEFAULT NULL,
  DATA varchar2(200) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  ACCOUNT_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_ACCOUNT_CREDENTIAL_ACCOUNT FOREIGN KEY (ACCOUNT_ID) REFERENCES account_info (ID)
) ;

CREATE INDEX FK_ACCOUNT_CREDENTIAL_ACCOUNT ON account_credential (ACCOUNT_ID);

-- ----------------------------
-- Records of account_credential
-- ----------------------------
INSERT INTO account_credential VALUES ('1', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '1', '1');
INSERT INTO account_credential VALUES ('2', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '2', '1');
INSERT INTO account_credential VALUES ('3', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '3', '1');
INSERT INTO account_credential VALUES ('4', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '4', '1');
INSERT INTO account_credential VALUES ('5', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '5', '1');
INSERT INTO account_credential VALUES ('6', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '6', '1');
INSERT INTO account_credential VALUES ('7', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '7', '1');
INSERT INTO account_credential VALUES ('8', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '8', '1');
INSERT INTO account_credential VALUES ('9', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '9', '1');
INSERT INTO account_credential VALUES ('10', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '10', '1');
INSERT INTO account_credential VALUES ('11', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '11', '1');
INSERT INTO account_credential VALUES ('12', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '12', '1');
INSERT INTO account_credential VALUES ('13', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '13', '1');
INSERT INTO account_credential VALUES ('14', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '14', '1');
INSERT INTO account_credential VALUES ('15', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '15', '1');
INSERT INTO account_credential VALUES ('16', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '16', '1');
INSERT INTO account_credential VALUES ('17', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '17', '1');
INSERT INTO account_credential VALUES ('18', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '18', '1');
INSERT INTO account_credential VALUES ('19', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '19', '1');
INSERT INTO account_credential VALUES ('20', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '20', '1');
INSERT INTO account_credential VALUES ('21', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '21', '1');
INSERT INTO account_credential VALUES ('22', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '22', '1');
INSERT INTO account_credential VALUES ('23', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '23', '1');
INSERT INTO account_credential VALUES ('24', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '24', '1');
INSERT INTO account_credential VALUES ('25', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '25', '1');
INSERT INTO account_credential VALUES ('26', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '26', '1');
INSERT INTO account_credential VALUES ('27', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '27', '1');
INSERT INTO account_credential VALUES ('28', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '28', '1');
INSERT INTO account_credential VALUES ('29', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '29', '1');
INSERT INTO account_credential VALUES ('30', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '30', '1');
INSERT INTO account_credential VALUES ('31', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '31', '1');
INSERT INTO account_credential VALUES ('32', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '32', '1');
INSERT INTO account_credential VALUES ('33', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '33', '1');
INSERT INTO account_credential VALUES ('34', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '2015-02-27 00:00:00', '2017-04-28 00:00:00', 'normal', null, 'yes', 'normal', 'default', null, 'active', '34', '1');

-- ----------------------------
-- Table structure for account_device
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_device';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_device (
  ID number(19) NOT NULL,
  CODE varchar2(64) DEFAULT NULL,
  TYPE varchar2(64) DEFAULT NULL,
  OS varchar2(100) DEFAULT NULL,
  CLIENT varchar2(100) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  LAST_LOGIN_TIME timestamp(0) DEFAULT NULL,
  ATTRIBUTE1 varchar2(200) DEFAULT NULL,
  ACCOUNT_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_ACCOUNT_DEVICE_ACCOUNT FOREIGN KEY (ACCOUNT_ID) REFERENCES account_info (ID)
) ;

CREATE INDEX FK_ACCOUNT_DEVICE_ACCOUNT ON account_device (ACCOUNT_ID);

-- ----------------------------
-- Records of account_device
-- ----------------------------
INSERT INTO account_device VALUES ('515743377244160', 'a27bc742-fcb0-4fe9-9bf7-91719286a948', 'COMPUTER', 'WINDOWS_10', 'CHROME', 'new', '2017-02-12 19:09:38', '2017-02-12 21:31:47', null, '1', '1');
INSERT INTO account_device VALUES ('518035859374080', '58dbd441-1c76-4272-813a-76342bd53dc9', 'COMPUTER', 'WINDOWS_10', 'CHROME', 'new', '2017-02-14 10:01:40', '2017-02-14 15:22:40', null, '1', '1');
INSERT INTO account_device VALUES ('518371533701120', '5925c8af-e30a-4c2e-a7c5-4acf4111bc7e', 'COMPUTER', 'WINDOWS_10', 'CHROME', 'new', '2017-02-14 15:43:08', '2017-02-14 15:43:08', null, '1', '1');
INSERT INTO account_device VALUES ('519775626526720', '4dfd3bd5-31af-46d5-a500-dad0e2c642d9', 'COMPUTER', 'WINDOWS_10', 'CHROME', 'new', '2017-02-15 15:31:27', '2017-02-15 19:34:17', null, '1', '1');
INSERT INTO account_device VALUES ('520923580071936', 'a40c51e7-cd99-4120-98f8-563751511370', 'COMPUTER', 'WINDOWS_10', 'CHROME', 'new', '2017-02-16 10:59:13', '2017-02-16 20:01:36', null, '1', '1');
INSERT INTO account_device VALUES ('522258617434112', '23f04d2b-51c4-444b-836a-1618ab619865', 'COMPUTER', 'WINDOWS_10', 'CHROME', 'new', '2017-02-17 09:37:17', '2017-02-17 09:37:17', null, '1', '1');

-- ----------------------------
-- Table structure for account_history_credential
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_history_credential';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_history_credential (
  ID number(19) NOT NULL,
  MODIFY_TIME timestamp(0) DEFAULT NULL,
  PASSWORD varchar2(100) DEFAULT NULL,
  CREDENTIAL_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_ACCOUNT_HISTORY_CREDENTIAL_CREDENTIAL FOREIGN KEY (CREDENTIAL_ID) REFERENCES account_credential (ID)
) ;

CREATE INDEX FK_ACCOUNT_HISTORY_CREDENTIAL_CREDENTIAL ON account_history_credential (CREDENTIAL_ID);

-- ----------------------------
-- Records of account_history_credential
-- ----------------------------

-- ----------------------------
-- Table structure for account_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_info (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  USERNAME varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  DISPLAY_NAME varchar2(200) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  PASSWORD_REQUIRED varchar2(50) DEFAULT NULL,
  LOCKED varchar2(50) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  CLOSE_TIME timestamp(0) DEFAULT NULL,
  LOGIN_TIME timestamp(0) DEFAULT NULL,
  NICK_NAME varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  LANGUAGE varchar2(50) DEFAULT NULL,
  TIMEZONE varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of account_info
-- ----------------------------
INSERT INTO account_info VALUES ('1', '1', 'lingo', 'employee', '临远', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '临远', null, null, null, '1');
INSERT INTO account_info VALUES ('2', '2', 'vivian', 'employee', '薇薇安', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '薇薇安', null, null, null, '1');
INSERT INTO account_info VALUES ('3', '3', 'steven', 'employee', '史蒂文', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '史蒂文', null, null, null, '1');
INSERT INTO account_info VALUES ('4', '4', 'king', 'employee', '金', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '金', null, null, null, '1');
INSERT INTO account_info VALUES ('5', '5', 'john', 'employee', '约翰', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '约翰', null, null, null, '1');
INSERT INTO account_info VALUES ('6', '6', 'william', 'employee', '威廉', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '威廉', null, null, null, '1');
INSERT INTO account_info VALUES ('7', '7', 'adam', 'employee', '亚当', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '亚当', null, null, null, '1');
INSERT INTO account_info VALUES ('8', '8', 'robot', 'employee', '罗伯特', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '罗伯特', null, null, null, '1');
INSERT INTO account_info VALUES ('9', '9', 'bob', 'employee', '鲍勃', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '鲍勃', null, null, null, '1');
INSERT INTO account_info VALUES ('10', '10', 'alice', 'employee', '爱丽丝', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '爱丽丝', null, null, null, '1');
INSERT INTO account_info VALUES ('11', '11', 'mike', 'employee', '麦克', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '麦克', null, null, null, '1');
INSERT INTO account_info VALUES ('12', '12', 'justin', 'employee', '贾斯汀', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '贾斯汀', null, null, null, '1');
INSERT INTO account_info VALUES ('13', '13', 'tom', 'employee', '汤姆', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '汤姆', null, null, null, '1');
INSERT INTO account_info VALUES ('14', '14', 'james', 'employee', '詹姆斯', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '詹姆斯', null, null, null, '1');
INSERT INTO account_info VALUES ('15', '15', 'joe', 'employee', '乔伊', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '乔伊', null, null, null, '1');
INSERT INTO account_info VALUES ('16', '16', 'paul', 'employee', '保罗', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '保罗', null, null, null, '1');
INSERT INTO account_info VALUES ('17', '17', 'jane', 'employee', '简', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '简', null, null, null, '1');
INSERT INTO account_info VALUES ('18', '18', 'marry', 'employee', '玛丽', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '玛丽', null, null, null, '1');
INSERT INTO account_info VALUES ('19', '19', 'ben', 'employee', '本', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '本', null, null, null, '1');
INSERT INTO account_info VALUES ('20', '20', 'bot', 'bot', '系统机器人', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '系统机器人', null, null, null, '1');
INSERT INTO account_info VALUES ('21', '21', 'jack', 'employee', '杰克', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '杰克', null, null, null, '1');
INSERT INTO account_info VALUES ('22', '22', 'martin', 'employee', '马丁', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '马丁', null, null, null, '1');
INSERT INTO account_info VALUES ('23', '23', 'alex', 'employee', '阿莱克斯', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '阿莱克斯', null, null, null, '1');
INSERT INTO account_info VALUES ('24', '24', 'daniel', 'employee', '丹尼尔', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '丹尼尔', null, null, null, '1');
INSERT INTO account_info VALUES ('25', '25', 'eric', 'employee', '艾瑞克', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '艾瑞克', null, null, null, '1');
INSERT INTO account_info VALUES ('26', '26', 'leon', 'employee', '里昂', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '里昂', null, null, null, '1');
INSERT INTO account_info VALUES ('27', '27', 'clark', 'employee', '克拉克', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '克拉克', null, null, null, '1');
INSERT INTO account_info VALUES ('28', '28', 'david', 'employee', '大卫', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '大卫', null, null, null, '1');
INSERT INTO account_info VALUES ('29', '29', 'henry', 'employee', '亨利', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '亨利', null, null, null, '1');
INSERT INTO account_info VALUES ('30', '30', 'helen', 'employee', '海伦', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '海伦', null, null, null, '1');
INSERT INTO account_info VALUES ('31', '31', 'sarah', 'employee', '莎拉', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '莎拉', null, null, null, '1');
INSERT INTO account_info VALUES ('32', '32', 'sam', 'employee', '萨姆', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '萨姆', null, null, null, '1');
INSERT INTO account_info VALUES ('33', '33', 'claire', 'employee', '克莱尔', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '克莱尔', null, null, null, '1');
INSERT INTO account_info VALUES ('34', '34', 'thomas', 'employee', '托马斯', 'active', 'required', 'unlocked', '2015-02-27 00:00:00', null, null, '托马斯', null, null, null, '1');

-- ----------------------------
-- Table structure for account_lock_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_lock_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_lock_info (
  ID number(19) NOT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  USERNAME varchar2(64) DEFAULT NULL,
  LOCK_TIME timestamp(0) DEFAULT NULL,
  RELEASE_TIME timestamp(0) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of account_lock_info
-- ----------------------------

-- ----------------------------
-- Table structure for account_lock_log
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_lock_log';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_lock_log (
  ID number(19) NOT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  USERNAME varchar2(64) DEFAULT NULL,
  LOCK_TIME timestamp(0) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of account_lock_log
-- ----------------------------

-- ----------------------------
-- Table structure for account_log
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_log';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_log (
  ID number(19) NOT NULL,
  USERNAME varchar2(64) DEFAULT NULL,
  RESULT varchar2(64) DEFAULT NULL,
  REASON varchar2(200) DEFAULT NULL,
  APPLICATION varchar2(200) DEFAULT NULL,
  LOG_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  CLIENT varchar2(200) DEFAULT NULL,
  SERVER varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of account_log
-- ----------------------------

-- ----------------------------
-- Table structure for account_online
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS account_online';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE account_online (
  ID number(19) NOT NULL,
  ACCOUNT varchar2(200) DEFAULT NULL,
  SESSION_ID varchar2(200) DEFAULT NULL,
  LOGIN_TIME timestamp(0) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of account_online
-- ----------------------------
INSERT INTO account_online VALUES ('515743375441920', '1', '90343d05-3232-4d12-8948-c62db37f2d48', '2017-02-12 19:09:38', '1');
INSERT INTO account_online VALUES ('515749802770432', '1', '574637db-a316-4126-a4f3-c661f243ffa9', '2017-02-12 19:16:11', '1');
INSERT INTO account_online VALUES ('515754828693504', '1', '212536ac-a196-4774-b5dd-8389bf13924a', '2017-02-12 19:21:17', '1');
INSERT INTO account_online VALUES ('515797815427072', '1', '6ab46e49-094c-41dd-9ba0-f7d6c83ffd42', '2017-02-12 20:05:01', '1');
INSERT INTO account_online VALUES ('515803852931072', '1', '0cf19e4d-b192-49f5-a4f8-6a6b127e762f', '2017-02-12 20:11:09', '1');
INSERT INTO account_online VALUES ('515810992242688', '1', '85c2ba3a-ce58-431b-a055-c434a3dca358', '2017-02-12 20:18:25', '1');
INSERT INTO account_online VALUES ('515816003584000', '1', '14524e97-25e2-4dd7-9892-80f0465c2b5d', '2017-02-12 20:23:31', '1');
INSERT INTO account_online VALUES ('515824272883712', '1', '40a161b9-ce23-495b-8d74-e476531d50e4', '2017-02-12 20:31:56', '1');
INSERT INTO account_online VALUES ('515833722945536', '1', 'b6300e6f-40f5-4020-ad9d-9e2bb1ccd448', '2017-02-12 20:41:33', '1');
INSERT INTO account_online VALUES ('515836629909504', '1', '91b1f42a-b682-472e-8f9d-80dc806f5ae2', '2017-02-12 20:44:30', '1');
INSERT INTO account_online VALUES ('515845191663616', '1', 'd0d133ac-a9e1-4a30-be9e-bdf044d3030e', '2017-02-12 20:53:12', '1');
INSERT INTO account_online VALUES ('515847993769984', '1', '76f90833-0321-4fb2-93f8-620bedf994d0', '2017-02-12 20:56:03', '1');
INSERT INTO account_online VALUES ('515853162217472', '1', '3d5673df-b51b-4049-b059-c2e892f484ea', '2017-02-12 21:01:14', '1');
INSERT INTO account_online VALUES ('515857034854400', '1', '549612dd-396b-4e3f-aac4-8417d4ab3018', '2017-02-12 21:05:15', '1');
INSERT INTO account_online VALUES ('515865574277120', '1', '5fa3ea95-39cb-48e2-b518-368f674b397b', '2017-02-12 21:13:57', '1');
INSERT INTO account_online VALUES ('515883103715328', '1', 'ecabc97c-14fa-4806-9107-da06c8354e24', '2017-02-12 21:31:47', '1');
INSERT INTO account_online VALUES ('518035854163968', '1', 'b3335a12-163b-4e62-a7c9-c25e0b9e143a', '2017-02-14 10:01:40', '1');
INSERT INTO account_online VALUES ('518056370847744', '1', '75e6b8f0-7668-46cd-9ab1-29ac088e63ed', '2017-02-14 10:22:32', '1');
INSERT INTO account_online VALUES ('518104607621120', '1', '9879b40c-fdbc-4eb6-b9bc-7435d52ff57b', '2017-02-14 11:11:36', '1');
INSERT INTO account_online VALUES ('518120405401600', '1', '1c776f6d-5e17-4641-8fa6-c1ed8067373e', '2017-02-14 11:27:41', '1');
INSERT INTO account_online VALUES ('518186918035456', '1', 'd98582c4-ca61-4320-9ddc-310f9f3c114e', '2017-02-14 12:35:20', '1');
INSERT INTO account_online VALUES ('518195031212032', '1', 'b34ca747-71c5-4307-af7e-9d38bd049394', '2017-02-14 12:43:35', '1');
INSERT INTO account_online VALUES ('518199135797248', '1', '9fed60da-c40c-4f03-b143-7e9125098eb4', '2017-02-14 12:47:46', '1');
INSERT INTO account_online VALUES ('518202126794752', '1', '72481b42-8c2a-4d80-92b8-629e08eb4d86', '2017-02-14 12:50:49', '1');
INSERT INTO account_online VALUES ('518206231904256', '1', '665966ef-24b3-469c-9fcb-14e8c07eef48', '2017-02-14 12:54:59', '1');
INSERT INTO account_online VALUES ('518206234869760', '1', null, '2017-02-14 12:54:59', '1');
INSERT INTO account_online VALUES ('518210769289216', '1', 'f7bad8ae-ba7b-456e-bbc2-b6e753816414', '2017-02-14 12:59:36', '1');
INSERT INTO account_online VALUES ('518216018870272', '1', '5add59f6-983c-4543-8a6b-eccfc7a5c3bf', '2017-02-14 13:04:56', '1');
INSERT INTO account_online VALUES ('518220111593472', '1', '5d4ce5c9-dcfa-4fc7-9783-e6b789a31f92', '2017-02-14 13:09:06', '1');
INSERT INTO account_online VALUES ('518223235743744', '1', 'ae818c49-ddce-4817-9c77-623affdb3772', '2017-02-14 13:12:17', '1');
INSERT INTO account_online VALUES ('518225379590144', '1', 'a4867d35-65eb-4ac0-8c80-4575c292555d', '2017-02-14 13:14:28', '1');
INSERT INTO account_online VALUES ('518229287534592', '1', '51d44cf2-47c6-4be6-8c32-391a564c5787', '2017-02-14 13:18:26', '1');
INSERT INTO account_online VALUES ('518232535105536', '1', '8468140f-b992-43ca-8d37-6422cff222dc', '2017-02-14 13:21:44', '1');
INSERT INTO account_online VALUES ('518250268327936', '1', 'a073b835-c539-40b7-a473-d6adebe03fe6', '2017-02-14 13:39:47', '1');
INSERT INTO account_online VALUES ('518254197424128', '1', '8c4eeb90-f2d0-4eb0-a968-ba1dd18c74a6', '2017-02-14 13:43:47', '1');
INSERT INTO account_online VALUES ('518259784155136', '1', '3fe30ab2-6eb1-4150-89c2-b45b10b43799', '2017-02-14 13:49:28', '1');
INSERT INTO account_online VALUES ('518267649409024', '1', '92b6752f-ac83-4755-a87a-6325fd58abb4', '2017-02-14 13:57:28', '1');
INSERT INTO account_online VALUES ('518274503753728', '1', '6b04bd75-321b-40d9-954c-a1a8a48a0fc7', '2017-02-14 14:04:26', '1');
INSERT INTO account_online VALUES ('518279110901760', '1', '0c6135ad-4434-40f0-a4db-a313417eb90c', '2017-02-14 14:09:07', '1');
INSERT INTO account_online VALUES ('518281913188352', '1', 'f4d0af20-39a2-48f7-baad-f06a61998078', '2017-02-14 14:11:58', '1');
INSERT INTO account_online VALUES ('518283944984576', '1', '216fa991-e286-465d-9758-31a2338e3ebe', '2017-02-14 14:14:02', '1');
INSERT INTO account_online VALUES ('518293907734528', '1', '0a74e8d1-39f4-4c7f-ab90-d0f55a5b7f0e', '2017-02-14 14:24:10', '1');
INSERT INTO account_online VALUES ('518308971413504', '1', '6c7700f3-a1c5-4b03-910b-6875d0853814', '2017-02-14 14:39:30', '1');
INSERT INTO account_online VALUES ('518314407903232', '1', '9cf6c2fb-2f69-4a2f-8c85-083bc51120db', '2017-02-14 14:45:02', '1');
INSERT INTO account_online VALUES ('518318407106560', '1', '179d060f-3193-4273-b1a8-924eeb4d7777', '2017-02-14 14:49:06', '1');
INSERT INTO account_online VALUES ('518335613140992', '1', '4b8d76a5-56ee-4d19-9b7e-a61590536e8b', '2017-02-14 15:06:36', '1');
INSERT INTO account_online VALUES ('518339564634112', '1', '5940df46-c00a-42e8-82fe-e818fd0cd767', '2017-02-14 15:10:37', '1');
INSERT INTO account_online VALUES ('518339569975296', '1', 'd6c18edf-eff1-46d1-8fcc-8c7e4315e718', '2017-02-14 15:10:37', '1');
INSERT INTO account_online VALUES ('518343730069504', '1', '796e031a-76d5-45fd-ad7e-df4ecfea371f', '2017-02-14 15:14:51', '1');
INSERT INTO account_online VALUES ('518347291410432', '1', '78fd83b1-d155-45dc-9c60-12caa7a5e322', '2017-02-14 15:18:29', '1');
INSERT INTO account_online VALUES ('518351403663360', '1', '7945de69-203d-4f01-bd45-c2d7e6b43dd0', '2017-02-14 15:22:40', '1');
INSERT INTO account_online VALUES ('518371530080256', '1', '0b6155ad-8f27-47a5-a2c2-b49816e0c851', '2017-02-14 15:43:08', '1');
INSERT INTO account_online VALUES ('519775622348800', '1', '0b6cdcf8-9e61-4f68-b57f-d5b47be3670d', '2017-02-15 15:31:27', '1');
INSERT INTO account_online VALUES ('520014334853120', '1', '58fe5aee-28f5-4dcc-8aec-838df1d7fc96', '2017-02-15 19:34:17', '1');
INSERT INTO account_online VALUES ('520923575713792', '1', 'f85a338c-9b61-4271-bcf5-2f2d876db427', '2017-02-16 10:59:13', '1');
INSERT INTO account_online VALUES ('521091079847936', '1', 'f12a072b-4b0b-437b-9ce5-c7c5fcb837a6', '2017-02-16 13:49:36', '1');
INSERT INTO account_online VALUES ('521195474337792', '1', '3db0aab5-5320-4914-b6bf-e2e435e4ffa7', '2017-02-16 15:35:48', '1');
INSERT INTO account_online VALUES ('521198442364928', '1', '0c11c6cd-93b9-417c-ad34-7f07a867fc57', '2017-02-16 15:38:49', '1');
INSERT INTO account_online VALUES ('521202478022656', '1', '68333bb0-73d0-4e11-97ee-adac4cfef839', '2017-02-16 15:42:55', '1');
INSERT INTO account_online VALUES ('521206884089856', '1', '17628478-a0ef-4d29-babd-7f1da8b9a59f', '2017-02-16 15:47:24', '1');
INSERT INTO account_online VALUES ('521209615204352', '1', 'd2e3dce2-575d-47bb-876d-01ea1b1a28ee', '2017-02-16 15:50:11', '1');
INSERT INTO account_online VALUES ('521218172108800', '1', 'd6b374d0-2f75-47e5-913b-5ea256ec7a66', '2017-02-16 15:58:53', '1');
INSERT INTO account_online VALUES ('521223116079104', '1', '1d5e2535-4026-4556-815c-2e2ef0435513', '2017-02-16 16:03:55', '1');
INSERT INTO account_online VALUES ('521225271115776', '1', '2b3ea55d-f5c5-489e-b0de-cbafea756eec', '2017-02-16 16:06:07', '1');
INSERT INTO account_online VALUES ('521236194885632', '1', '5e5de53a-a7f5-41bc-9344-47926291b147', '2017-02-16 16:17:13', '1');
INSERT INTO account_online VALUES ('521237739208704', '1', 'dc415553-f2de-4e19-b1bb-82a4bf85ea8d', '2017-02-16 16:18:48', '1');
INSERT INTO account_online VALUES ('521241656508416', '1', '656b6801-6660-409c-861d-92a6c9cf7731', '2017-02-16 16:22:47', '1');
INSERT INTO account_online VALUES ('521255498711040', '1', 'e2cd263e-0a32-4bbb-8fd6-16ba7f82e2af', '2017-02-16 16:36:52', '1');
INSERT INTO account_online VALUES ('521258362994688', '1', 'e1451e0d-58a4-48a8-9cdc-0cfe5a2f8e97', '2017-02-16 16:39:46', '1');
INSERT INTO account_online VALUES ('521287463256064', '1', 'fbcc9b49-1617-4ea9-af7f-a0dccc0862b8', '2017-02-16 17:09:23', '1');
INSERT INTO account_online VALUES ('521324707151872', '1', '449f598b-9166-47d7-985a-e3e34667e2e7', '2017-02-16 17:47:16', '1');
INSERT INTO account_online VALUES ('521329482170368', '1', 'e8f90c8f-a7bc-4b16-a2f4-d618f8635d6a', '2017-02-16 17:52:07', '1');
INSERT INTO account_online VALUES ('521348235952128', '1', '713cde4a-68a5-4353-a352-ac85557ec705', '2017-02-16 18:11:12', '1');
INSERT INTO account_online VALUES ('521407827591168', '1', 'caacca74-2d12-42ce-abce-10b0c5e0789b', '2017-02-16 19:11:49', '1');
INSERT INTO account_online VALUES ('521431307272192', '1', 'ef5092de-2a75-414c-9ac2-7c9d64bfb2fb', '2017-02-16 19:35:42', '1');
INSERT INTO account_online VALUES ('521443148365824', '1', '17325d7e-41cd-4ba1-ba22-e074e78745ec', '2017-02-16 19:47:45', '1');
INSERT INTO account_online VALUES ('521445411291136', '1', '4c9627a4-e831-41f0-8d2c-84dae0ca13f8', '2017-02-16 19:50:03', '1');
INSERT INTO account_online VALUES ('521450160275456', '1', '6c4c026f-6237-49d1-971c-8a7abeacfd1a', '2017-02-16 19:54:53', '1');
INSERT INTO account_online VALUES ('521456771530752', '1', '1ea34f10-e0e9-4860-b052-d3299135792f', '2017-02-16 20:01:36', '1');
INSERT INTO account_online VALUES ('522258613567488', '1', '25899172-07ed-4dee-bcec-69226e3a8384', '2017-02-17 09:37:17', '1');

-- ----------------------------
-- Table structure for activity_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS activity_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE activity_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CONTENT clob,
  LOCATION varchar2(200) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT NULL,
  END_TIME timestamp(0) DEFAULT NULL,
  OPEN_TIME timestamp(0) DEFAULT NULL,
  CLOSE_TIME timestamp(0) DEFAULT NULL,
  HEAD_COUNT number(10) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of activity_info
-- ----------------------------

-- ----------------------------
-- Table structure for activity_user
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS activity_user';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE activity_user (
  ID number(19) NOT NULL,
  PRIORITY number(10) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_ACTIVITY_USER_INFO FOREIGN KEY (INFO_ID) REFERENCES activity_info (ID)
) ;

CREATE INDEX FK_ACTIVITY_USER_INFO ON activity_user (INFO_ID);

-- ----------------------------
-- Records of activity_user
-- ----------------------------

-- ----------------------------
-- Table structure for alarm_config
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS alarm_config';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE alarm_config (
  id number(19) NOT NULL,
  ne_id number(19) DEFAULT NULL ,
  name varchar2(255) DEFAULT NULL,
  alarm_target_id number(19) DEFAULT NULL ,
  threshold varchar2(255) DEFAULT NULL ,
  levels number(10) DEFAULT NULL ,
  comments varchar2(255) DEFAULT NULL ,
  upgrade_rule number(10) DEFAULT NULL ,
  time_rule varchar2(255) DEFAULT NULL ,
  time_unit number(10) DEFAULT NULL ,
  threshold_unit number(10) DEFAULT NULL ,
  upgrade_type number(10) DEFAULT NULL ,
  notice_send_type number(10) DEFAULT NULL ,
  notice_send_time varchar2(255) DEFAULT NULL ,
  mail_notice number(10) DEFAULT NULL,
  sms_notice number(10) DEFAULT NULL,
  ne_path varchar2(2000) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id UNIQUE  (id)
)  ;

CREATE INDEX ne_id ON alarm_config (ne_id);

-- ----------------------------
-- Records of alarm_config
-- ----------------------------

-- ----------------------------
-- Table structure for alarm_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS alarm_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE alarm_info (
  id number(19) NOT NULL,
  status number(10) DEFAULT NULL,
  alarm_config_id number(19) DEFAULT NULL ,
  ne_id number(19) DEFAULT NULL ,
  first_time timestamp(0) DEFAULT NULL,
  last_time timestamp(0) DEFAULT NULL,
  frequency number(10) DEFAULT NULL,
  result varchar2(100) DEFAULT NULL,
  confirm_time timestamp(0) DEFAULT NULL,
  clean_time timestamp(0) DEFAULT NULL,
  causes varchar2(255) DEFAULT NULL,
  check_sql varchar2(255) DEFAULT NULL,
  summary varchar2(255) DEFAULT NULL,
  reason_type number(10) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id UNIQUE  (id)
)  ;

CREATE INDEX alarm_config_id ON alarm_info (alarm_config_id);
CREATE INDEX ne_id ON alarm_info (ne_id);

-- ----------------------------
-- Records of alarm_info
-- ----------------------------

-- ----------------------------
-- Table structure for alarm_notice_recivers
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS alarm_notice_recivers';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE alarm_notice_recivers (
  id number(19) NOT NULL,
  user_id number(19) DEFAULT NULL,
  alarm_config_id number(19) DEFAULT NULL,
  type varchar2(20) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id UNIQUE  (id)
)  ;

CREATE INDEX user_id ON alarm_notice_recivers (user_id);

-- ----------------------------
-- Records of alarm_notice_recivers
-- ----------------------------

-- ----------------------------
-- Table structure for alarm_target
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS alarm_target';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE alarm_target (
  id number(19) NOT NULL,
  name varchar2(255) DEFAULT NULL,
  sql_ clob,
  orders number(10) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id UNIQUE  (id)
)  ;

-- ----------------------------
-- Records of alarm_target
-- ----------------------------

-- ----------------------------
-- Table structure for attendance_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS attendance_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE attendance_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  CATALOG varchar2(100) DEFAULT NULL,
  EMPLOYEE_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of attendance_info
-- ----------------------------

-- ----------------------------
-- Table structure for audit_base
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS audit_base';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE audit_base (
  ID number(19) NOT NULL,
  USER varchar2(200) DEFAULT NULL,
  RESOURCE_TYPE varchar2(200) DEFAULT NULL,
  RESOURCE_ID varchar2(200) DEFAULT NULL,
  ACTION varchar2(200) DEFAULT NULL,
  RESULT varchar2(200) DEFAULT NULL,
  APPLICATION varchar2(200) DEFAULT NULL,
  AUDIT_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  CLIENT varchar2(200) DEFAULT NULL,
  SERVER varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of audit_base
-- ----------------------------
INSERT INTO audit_base VALUES ('515743374573568', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 19:09:38', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515749800984576', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 19:16:10', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515754827661312', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 19:21:17', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515797813264384', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:05:01', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515803850833920', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:11:09', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515810990030848', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:18:25', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515816001896448', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:23:31', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515824269869056', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:31:56', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515833721896960', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:41:33', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515836628369408', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:44:30', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515845185568768', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:53:10', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515847984939008', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 20:56:01', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515853071712256', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 21:01:12', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515857002676224', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 21:05:13', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515865573064704', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 21:13:57', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('515883102224384', '1', null, null, 'login', 'success', 'lemon', '2017-02-12 21:31:46', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518035852443648', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 10:01:40', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518056369389568', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 10:22:32', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518104606457856', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 11:11:36', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518120403320832', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 11:27:40', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518186897227776', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 12:35:19', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518195010928640', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 12:43:34', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518199134044160', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 12:47:46', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518202125713408', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 12:50:48', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518206230495232', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 12:54:59', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518206233427968', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 12:54:59', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518210766422016', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 12:59:36', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518216017379328', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:04:56', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518220109201408', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:09:06', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518223234482176', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:12:17', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518225378459648', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:14:28', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518229285470208', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:18:26', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518232534155264', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:21:44', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518250214735872', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:39:44', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518254174257152', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:43:45', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518259782647808', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:49:28', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518267647000576', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 13:57:28', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518274501132288', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 14:04:26', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518279109230592', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 14:09:07', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518281911910400', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 14:11:58', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518283943264256', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 14:14:02', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518293905784832', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 14:24:10', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518308967972864', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 14:39:30', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518314406854656', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 14:45:02', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518318406008832', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 14:49:06', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518335612026880', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 15:06:36', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518339563470848', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 15:10:37', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518339568959488', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 15:10:37', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518343727710208', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 15:14:51', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518347290214400', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 15:18:29', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518351401926656', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 15:22:40', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('518371527868416', '1', null, null, 'login', 'success', 'lemon', '2017-02-14 15:43:08', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('519775619399680', '1', null, null, 'login', 'success', 'lemon', '2017-02-15 15:31:27', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('520014333231104', '1', null, null, 'login', 'success', 'lemon', '2017-02-15 19:34:17', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('520923573125120', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 10:59:12', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521091078684672', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 13:49:36', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521195472601088', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 15:35:48', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521198440906752', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 15:38:49', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521202477056000', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 15:42:55', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521206882713600', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 15:47:24', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521209614123008', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 15:50:11', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521218170798080', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 15:58:53', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521223115030528', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 16:03:55', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521225269166080', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 16:06:06', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521236193673216', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 16:17:13', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521237737701376', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 16:18:47', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521241655492608', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 16:22:47', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521255497531392', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 16:36:51', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521258360782848', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 16:39:46', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521287461896192', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 17:09:22', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521324706070528', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 17:47:16', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521329481187328', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 17:52:07', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521348233920512', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 18:11:12', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521407826591744', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 19:11:49', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521431306158080', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 19:35:42', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521443147448320', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 19:47:45', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521445408882688', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 19:50:03', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521450158882816', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 19:54:53', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('521456770465792', '1', null, null, 'login', 'success', 'lemon', '2017-02-16 20:01:36', '127.0.0.1', '192.168.56.1', null, '1');
INSERT INTO audit_base VALUES ('522258611666944', '1', null, null, 'login', 'success', 'lemon', '2017-02-17 09:37:17', '127.0.0.1', '192.168.56.1', null, '1');

-- ----------------------------
-- Table structure for audit_extra
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS audit_extra';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE audit_extra (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  AUDIT_BASE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of audit_extra
-- ----------------------------

-- ----------------------------
-- Table structure for auth_access
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_access';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_access (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  PERM_ID number(19) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_AUTH_ACCESS_PERM FOREIGN KEY (PERM_ID) REFERENCES auth_perm (ID)
) ;

CREATE INDEX FK_AUTH_ACCESS_PERM ON auth_access (PERM_ID);

-- ----------------------------
-- Records of auth_access
-- ----------------------------
INSERT INTO auth_access VALUES ('1', 'URL', '/**', '3', '9999', null, '1');
INSERT INTO auth_access VALUES ('2', 'URL', '/common/util/**', '5', '1', null, '1');
INSERT INTO auth_access VALUES ('3', 'URL', '/common/util/**', '21', '1', null, '1');
INSERT INTO auth_access VALUES ('4', 'URL', '/common/**', '2', '2', null, '1');
INSERT INTO auth_access VALUES ('5', 'URL', '/j_spring_security_exit_user', '5', '3', null, '1');
INSERT INTO auth_access VALUES ('6', 'URL', '/j_spring_security_switch_user', '5', '4', null, '1');
INSERT INTO auth_access VALUES ('7', 'URL', '/j_spring_security_switch_user', '21', '4', null, '1');
INSERT INTO auth_access VALUES ('8', 'URL', '/rs/**', '2', '5', null, '1');
INSERT INTO auth_access VALUES ('9', 'URL', '/guest/**', '2', '9', null, '1');

-- ----------------------------
-- Table structure for auth_menu
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_menu';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_menu (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  CODE varchar2(50) DEFAULT NULL,
  TITLE varchar2(50) DEFAULT NULL,
  URL varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  PERM_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  DISPLAY varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_AUTH_MENU_PARENT FOREIGN KEY (PARENT_ID) REFERENCES auth_menu (ID),
  CONSTRAINT FK_AUTH_MENU_PERM FOREIGN KEY (PERM_ID) REFERENCES auth_perm (ID)
) ;

CREATE INDEX FK_AUTH_MENU_PARENT ON auth_menu (PARENT_ID);
CREATE INDEX FK_AUTH_MENU_PERM ON auth_menu (PERM_ID);

-- ----------------------------
-- Records of auth_menu
-- ----------------------------
INSERT INTO auth_menu VALUES ('1', 'index', 'portal', '首页', '/portal/index.do', '1', null, null, '101', null, 'true');
INSERT INTO auth_menu VALUES ('11', 'system', 'pim', '个人事务', null, '11', null, null, '102', null, 'true');
INSERT INTO auth_menu VALUES ('13', 'module', 'pim', '个人事务', '/pim/pim-schedule-list.do', '13', null, '11', '104', null, 'true');
INSERT INTO auth_menu VALUES ('14', 'module', 'mail', '邮箱', '/javamail/index.do', '14', null, '11', '105', null, 'true');
INSERT INTO auth_menu VALUES ('15', 'module', 'disk', '网盘', '/disk/disk-info-list.do', '15', null, '11', '106', null, 'true');
INSERT INTO auth_menu VALUES ('16', 'module', 'report', '统计报表', '/report/chart-mostActiveProcess.do', '16', null, '11', '107', null, 'true');
INSERT INTO auth_menu VALUES ('17', 'module', 'bpm', '流程中心', '/bpm/workspace-home.do', '12', null, '11', '108', null, 'true');
INSERT INTO auth_menu VALUES ('21', 'entry', 'sys', '系统配置', null, '21', null, null, '201', null, 'true');
INSERT INTO auth_menu VALUES ('31', 'system', 'user', '用户管理', '/user/account-info-list.do', '31', null, '21', '301', null, 'true');
INSERT INTO auth_menu VALUES ('32', 'module', 'account', '账号管理', '/user/account-info-list.do', '32', null, '31', '302', null, 'true');
INSERT INTO auth_menu VALUES ('33', 'module', 'group', '群组管理', '/group/group-info-list.do', '33', null, '31', '303', null, 'true');
INSERT INTO auth_menu VALUES ('34', 'module', 'auth', '权限管理', '/auth/user-status-list.do', '34', null, '31', '304', null, 'true');
INSERT INTO auth_menu VALUES ('35', 'module', 'session', '会话管理', '/user/account-online-list.do', '35', null, '31', '305', null, 'true');
INSERT INTO auth_menu VALUES ('41', 'system', 'bpm', '流程管理', '/bpm/bpm-process-list.do', '41', null, '21', '401', null, 'true');
INSERT INTO auth_menu VALUES ('42', 'module', 'bpm', '流程管理', '/bpm/bpm-process-list.do', '42', null, '41', '402', null, 'true');
INSERT INTO auth_menu VALUES ('43', 'module', 'task', '任务管理', '/humantask/task-info-list.do', '43', null, '41', '403', null, 'true');
INSERT INTO auth_menu VALUES ('44', 'module', 'form', '表单管理', '/form/form-template-list.do', '44', null, '41', '404', null, 'true');
INSERT INTO auth_menu VALUES ('45', 'module', 'model', '模块管理', '/model/model-info-list.do', '45', null, '41', '405', null, 'true');
INSERT INTO auth_menu VALUES ('51', 'system', 'cms', '内容管理', '/cms/cms-catalog-list.do', '51', null, '21', '501', null, 'true');
INSERT INTO auth_menu VALUES ('52', 'module', 'cms', '公告管理', '/cms/cms-catalog-list.do', '52', null, '51', '502', null, 'true');
INSERT INTO auth_menu VALUES ('61', 'system', 'logistic', '行政办公', '/car/car-info-list.do', '61', null, '21', '601', null, 'true');
INSERT INTO auth_menu VALUES ('62', 'module', 'car', '车辆管理', '/car/car-info-list.do', '62', null, '61', '602', null, 'true');
INSERT INTO auth_menu VALUES ('63', 'module', 'meeting', '会议室管理', '/meeting/meeting-info-list.do', '63', null, '61', '603', null, 'true');
INSERT INTO auth_menu VALUES ('71', 'system', 'hr', '人力资源', '/party/org-list.do', '71', null, '21', '701', null, 'true');
INSERT INTO auth_menu VALUES ('72', 'module', 'org', '组织机构', '/party/org-list.do', '72', null, '71', '702', null, 'true');
INSERT INTO auth_menu VALUES ('73', 'module', 'position', '职位管理', '/org/job-list.do', '73', null, '71', '703', null, 'true');
INSERT INTO auth_menu VALUES ('74', 'module', 'workcal', '工作日历', '/workcal/workcal-view.do', '74', null, '71', '704', null, 'true');
INSERT INTO auth_menu VALUES ('81', 'system', 'sys', '系统配置', '/party/tree-list.do', '9999', null, '21', '801', null, 'true');
INSERT INTO auth_menu VALUES ('91', 'system', 'finance', '财务管理', '/expense/expense-info-list.do', '91', null, '21', '901', null, 'false');
INSERT INTO auth_menu VALUES ('101', 'system', 'crm', 'CRM', '/customer/customer-info-list.do', '101', null, '21', '1001', null, 'false');
INSERT INTO auth_menu VALUES ('111', 'system', 'retail', '进销存', '/sale/sale-info-list.do', '111', null, '21', '1101', null, 'false');
INSERT INTO auth_menu VALUES ('306', 'module', 'device', '设备管理', '/user/account-device-list.do', '306', null, '31', '306', null, 'true');
INSERT INTO auth_menu VALUES ('604', 'module', 'book', '图书管理', '/book/book-info-list.do', '604', null, '61', '604', null, 'false');
INSERT INTO auth_menu VALUES ('605', 'module', 'officesupply', '办公用品管理', '/officesupply/officesupply-info-list.do', '605', null, '61', '605', null, 'false');
INSERT INTO auth_menu VALUES ('606', 'module', 'visitor', '访客管理', '/visitor/visitor-info-list.do', '606', null, '61', '606', null, 'false');
INSERT INTO auth_menu VALUES ('607', 'module', 'card', '工卡管理', '/card/card-info-list.do', '607', null, '61', '607', null, 'false');
INSERT INTO auth_menu VALUES ('608', 'module', 'seat', '工位管理', '/seat/seat-info-list.do', '608', null, '61', '608', null, 'false');
INSERT INTO auth_menu VALUES ('609', 'module', 'stamp', '印章管理', '/stamp/stamp-info-list.do', '609', null, '61', '609', null, 'false');
INSERT INTO auth_menu VALUES ('610', 'module', 'asset', '资产管理', '/asset/asset-info-list.do', '610', null, '61', '610', null, 'false');
INSERT INTO auth_menu VALUES ('611', 'module', 'activity', '活动管理', '/activity/activity-info-list.do', '611', null, '61', '611', null, 'false');
INSERT INTO auth_menu VALUES ('612', 'module', 'sign', '签到管理', '/sign/sign-info-list.do', '612', null, '61', '612', null, 'false');
INSERT INTO auth_menu VALUES ('613', 'module', 'vote', '投票管理', '/vote/vote-info-list.do', '613', null, '61', '613', null, 'false');
INSERT INTO auth_menu VALUES ('705', 'module', 'employee', '人员管理', '/employee/employee-info-list.do', '705', null, '71', '705', null, 'false');
INSERT INTO auth_menu VALUES ('706', 'module', 'contract', '合同管理', '/contract/contract-info-list.do', '706', null, '71', '706', null, 'false');
INSERT INTO auth_menu VALUES ('707', 'module', 'salary', '薪酬管理', '/salary/salary-info-list.do', '707', null, '71', '707', null, 'false');
INSERT INTO auth_menu VALUES ('708', 'module', 'socialsecurity', '社保管理', '/socialsecurity/socialsecurity-info-list.do', '708', null, '71', '708', null, 'false');
INSERT INTO auth_menu VALUES ('709', 'module', 'recruit', '招聘管理', '/recruit/recruit-info-list.do', '709', null, '71', '709', null, 'false');
INSERT INTO auth_menu VALUES ('710', 'module', 'train', '培训管理', '/train/train-info-list.do', '710', null, '71', '710', null, 'false');
INSERT INTO auth_menu VALUES ('711', 'module', 'performance', '绩效管理', '/performance/performance-info-list.do', '711', null, '71', '711', null, 'false');
INSERT INTO auth_menu VALUES ('712', 'module', 'attendance', '考勤管理', '/attendance/attendance-info-list.do', '712', null, '71', '712', null, 'false');
INSERT INTO auth_menu VALUES ('713', 'module', 'leave', '休假管理', '/leave/leave-info-list.do', '713', null, '71', '713', null, 'false');
INSERT INTO auth_menu VALUES ('902', 'module', 'expense', '报销管理', '/expense/expense-info-list.do', '902', null, '91', '902', null, 'true');
INSERT INTO auth_menu VALUES ('903', 'module', 'budget', '预算管理', '/budget/budget-info-list.do', '903', null, '91', '903', null, 'true');
INSERT INTO auth_menu VALUES ('1002', 'module', 'customer', '客户管理', '/customer/customer-info-list.do', '1002', null, '101', '1002', null, 'true');
INSERT INTO auth_menu VALUES ('1003', 'module', 'product', '产品管理', '/product/product-info-list.do', '1003', null, '101', '1003', null, 'true');
INSERT INTO auth_menu VALUES ('1004', 'module', 'business', '业务管理', '/business/business-info-list.do', '1004', null, '101', '1004', null, 'true');
INSERT INTO auth_menu VALUES ('1102', 'module', 'sale', '销售管理', '/sale/sale-info-list.do', '1102', null, '111', '1102', null, 'true');
INSERT INTO auth_menu VALUES ('1103', 'module', 'purchase', '采购管理', '/purchase/purchase-info-list.do', '1103', null, '111', '1103', null, 'true');
INSERT INTO auth_menu VALUES ('1104', 'module', 'inventory', '库存管理', '/inventory/inventory-info-list.do', '1104', null, '111', '1104', null, 'true');

-- ----------------------------
-- Table structure for auth_perm
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_perm';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_perm (
  ID number(19) NOT NULL,
  CODE varchar2(200) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PERM_TYPE_ID number(19) NOT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  priority number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_AUTH_PERM_TYPE FOREIGN KEY (PERM_TYPE_ID) REFERENCES auth_perm_type (ID)
) ;

CREATE INDEX FK_AUTH_PERM_TYPE ON auth_perm (PERM_TYPE_ID);

-- ----------------------------
-- Records of auth_perm
-- ----------------------------
INSERT INTO auth_perm VALUES ('1', '*', '所有权限', '1', '1', '1');
INSERT INTO auth_perm VALUES ('2', 'IS_GUEST', '游客', '1', '1', '2');
INSERT INTO auth_perm VALUES ('3', 'IS_USER', '用户', '1', '1', '3');
INSERT INTO auth_perm VALUES ('4', 'IS_LOGINED', '登录', '1', '1', '4');
INSERT INTO auth_perm VALUES ('5', 'IS_SWITCHED', '切换身份', '1', '1', '5');
INSERT INTO auth_perm VALUES ('6', 'IS_REMEMBERED', '自动登录', '1', '1', '6');
INSERT INTO auth_perm VALUES ('21', 'util', '工具', '2', '1', '21');
INSERT INTO auth_perm VALUES ('101', 'portal', '工作台', '11', '1', null);
INSERT INTO auth_perm VALUES ('102', 'sys_pim', '个人事务', '11', '1', null);
INSERT INTO auth_perm VALUES ('103', 'menu_pim', '个人事务', '11', '1', null);
INSERT INTO auth_perm VALUES ('104', 'pim', '个人事务', '11', '1', null);
INSERT INTO auth_perm VALUES ('105', 'mail', '邮箱', '11', '1', null);
INSERT INTO auth_perm VALUES ('106', 'disk', '网盘', '11', '1', null);
INSERT INTO auth_perm VALUES ('107', 'report', '统计报表', '11', '1', null);
INSERT INTO auth_perm VALUES ('108', 'bpm', '流程中心', '11', '1', null);
INSERT INTO auth_perm VALUES ('201', 'system', '系统配置', '21', '1', null);
INSERT INTO auth_perm VALUES ('301', 'sys_user', '用户管理', '31', '1', null);
INSERT INTO auth_perm VALUES ('302', 'account', '账号管理', '31', '1', null);
INSERT INTO auth_perm VALUES ('303', 'group', '群组管理', '31', '1', null);
INSERT INTO auth_perm VALUES ('304', 'auth', '权限管理', '31', '1', null);
INSERT INTO auth_perm VALUES ('305', 'session', '会话管理', '31', '1', null);
INSERT INTO auth_perm VALUES ('306', 'device', '设备管理', '31', '1', null);
INSERT INTO auth_perm VALUES ('401', 'sys_bpm', '流程管理', '41', '1', null);
INSERT INTO auth_perm VALUES ('402', 'bpm', '流程管理', '41', '1', null);
INSERT INTO auth_perm VALUES ('403', 'task', '任务管理', '41', '1', null);
INSERT INTO auth_perm VALUES ('404', 'form', '表单管理', '41', '1', null);
INSERT INTO auth_perm VALUES ('405', 'model', '模块管理', '41', '1', null);
INSERT INTO auth_perm VALUES ('501', 'sys_cms', '内容管理', '51', '1', null);
INSERT INTO auth_perm VALUES ('502', 'cms', '公告管理', '51', '1', null);
INSERT INTO auth_perm VALUES ('601', 'sys_logistic', '行政办公', '61', '1', null);
INSERT INTO auth_perm VALUES ('602', 'car', '车辆管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('603', 'meeting', '会议室管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('604', 'book', '图书管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('605', 'officesupply', '办公用品管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('606', 'visitor', '访客管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('607', 'card', '工卡管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('608', 'seat', '工位管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('609', 'stamp', '印章管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('610', 'asset', '资产管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('611', 'activity', '活动管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('612', 'sign', '签到管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('613', 'vote', '投票管理', '61', '1', null);
INSERT INTO auth_perm VALUES ('701', 'sys_hr', '人力资源', '71', '1', null);
INSERT INTO auth_perm VALUES ('702', 'org', '组织机构', '71', '1', null);
INSERT INTO auth_perm VALUES ('703', 'position', '职位管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('704', 'workcal', '工作日历', '71', '1', null);
INSERT INTO auth_perm VALUES ('705', 'employee', '人员管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('706', 'contract', '合同管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('707', 'salary', '薪酬管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('708', 'socialsecurity', '社保管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('709', 'recruit', '招聘管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('710', 'train', '培训管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('711', 'performance', '绩效管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('712', 'attendance', '考勤管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('713', 'leave', '休假管理', '71', '1', null);
INSERT INTO auth_perm VALUES ('801', 'sys_sys', '系统配置', '81', '1', null);
INSERT INTO auth_perm VALUES ('901', 'finance', '财务管理', '91', '1', null);
INSERT INTO auth_perm VALUES ('902', 'expense', '报销管理', '91', '1', null);
INSERT INTO auth_perm VALUES ('903', 'budget', '预算管理', '91', '1', null);
INSERT INTO auth_perm VALUES ('1001', 'crm', 'CRM', '101', '1', null);
INSERT INTO auth_perm VALUES ('1002', 'customer', '客户管理', '101', '1', null);
INSERT INTO auth_perm VALUES ('1003', 'product', '产品管理', '101', '1', null);
INSERT INTO auth_perm VALUES ('1004', 'business', '业务管理', '101', '1', null);
INSERT INTO auth_perm VALUES ('1101', 'retail', '进销存', '111', '1', null);
INSERT INTO auth_perm VALUES ('1102', 'sale', '销售管理', '111', '1', null);
INSERT INTO auth_perm VALUES ('1103', 'purchase', '采购管理', '111', '1', null);
INSERT INTO auth_perm VALUES ('1104', 'inventory', '库存管理', '111', '1', null);

-- ----------------------------
-- Table structure for auth_perm_role_def
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_perm_role_def';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_perm_role_def (
  PERM_ID number(19) NOT NULL,
  ROLE_DEF_ID number(19) NOT NULL,
  PRIMARY KEY (PERM_ID,ROLE_DEF_ID)
 ,
  CONSTRAINT FK_AUTH_PERM_ROLE_DEF_PERM FOREIGN KEY (PERM_ID) REFERENCES auth_perm (ID),
  CONSTRAINT FK_AUTH_PERM_ROLE_DEF_ROLE_DEF FOREIGN KEY (ROLE_DEF_ID) REFERENCES auth_role_def (ID)
) ;

CREATE INDEX FK_AUTH_PERM_ROLE_DEF_ROLE_DEF ON auth_perm_role_def (ROLE_DEF_ID);

-- ----------------------------
-- Records of auth_perm_role_def
-- ----------------------------
INSERT INTO auth_perm_role_def VALUES ('1', '1');
INSERT INTO auth_perm_role_def VALUES ('201', '2');
INSERT INTO auth_perm_role_def VALUES ('801', '2');
INSERT INTO auth_perm_role_def VALUES ('201', '3');
INSERT INTO auth_perm_role_def VALUES ('301', '3');
INSERT INTO auth_perm_role_def VALUES ('302', '3');
INSERT INTO auth_perm_role_def VALUES ('303', '3');
INSERT INTO auth_perm_role_def VALUES ('304', '3');
INSERT INTO auth_perm_role_def VALUES ('305', '3');
INSERT INTO auth_perm_role_def VALUES ('306', '3');
INSERT INTO auth_perm_role_def VALUES ('201', '4');
INSERT INTO auth_perm_role_def VALUES ('401', '4');
INSERT INTO auth_perm_role_def VALUES ('402', '4');
INSERT INTO auth_perm_role_def VALUES ('403', '4');
INSERT INTO auth_perm_role_def VALUES ('404', '4');
INSERT INTO auth_perm_role_def VALUES ('405', '4');
INSERT INTO auth_perm_role_def VALUES ('201', '5');
INSERT INTO auth_perm_role_def VALUES ('501', '5');
INSERT INTO auth_perm_role_def VALUES ('502', '5');
INSERT INTO auth_perm_role_def VALUES ('201', '6');
INSERT INTO auth_perm_role_def VALUES ('601', '6');
INSERT INTO auth_perm_role_def VALUES ('602', '6');
INSERT INTO auth_perm_role_def VALUES ('603', '6');
INSERT INTO auth_perm_role_def VALUES ('604', '6');
INSERT INTO auth_perm_role_def VALUES ('605', '6');
INSERT INTO auth_perm_role_def VALUES ('606', '6');
INSERT INTO auth_perm_role_def VALUES ('607', '6');
INSERT INTO auth_perm_role_def VALUES ('608', '6');
INSERT INTO auth_perm_role_def VALUES ('609', '6');
INSERT INTO auth_perm_role_def VALUES ('610', '6');
INSERT INTO auth_perm_role_def VALUES ('611', '6');
INSERT INTO auth_perm_role_def VALUES ('612', '6');
INSERT INTO auth_perm_role_def VALUES ('613', '6');
INSERT INTO auth_perm_role_def VALUES ('201', '7');
INSERT INTO auth_perm_role_def VALUES ('701', '7');
INSERT INTO auth_perm_role_def VALUES ('702', '7');
INSERT INTO auth_perm_role_def VALUES ('703', '7');
INSERT INTO auth_perm_role_def VALUES ('704', '7');
INSERT INTO auth_perm_role_def VALUES ('705', '7');
INSERT INTO auth_perm_role_def VALUES ('706', '7');
INSERT INTO auth_perm_role_def VALUES ('707', '7');
INSERT INTO auth_perm_role_def VALUES ('708', '7');
INSERT INTO auth_perm_role_def VALUES ('709', '7');
INSERT INTO auth_perm_role_def VALUES ('710', '7');
INSERT INTO auth_perm_role_def VALUES ('711', '7');
INSERT INTO auth_perm_role_def VALUES ('712', '7');
INSERT INTO auth_perm_role_def VALUES ('713', '7');
INSERT INTO auth_perm_role_def VALUES ('101', '8');
INSERT INTO auth_perm_role_def VALUES ('102', '8');
INSERT INTO auth_perm_role_def VALUES ('103', '8');
INSERT INTO auth_perm_role_def VALUES ('104', '8');
INSERT INTO auth_perm_role_def VALUES ('105', '8');
INSERT INTO auth_perm_role_def VALUES ('106', '8');
INSERT INTO auth_perm_role_def VALUES ('107', '8');
INSERT INTO auth_perm_role_def VALUES ('108', '8');
INSERT INTO auth_perm_role_def VALUES ('901', '9');
INSERT INTO auth_perm_role_def VALUES ('902', '9');
INSERT INTO auth_perm_role_def VALUES ('903', '9');
INSERT INTO auth_perm_role_def VALUES ('1001', '10');
INSERT INTO auth_perm_role_def VALUES ('1002', '10');
INSERT INTO auth_perm_role_def VALUES ('1003', '10');
INSERT INTO auth_perm_role_def VALUES ('1004', '10');
INSERT INTO auth_perm_role_def VALUES ('1101', '11');
INSERT INTO auth_perm_role_def VALUES ('1102', '11');
INSERT INTO auth_perm_role_def VALUES ('1103', '11');
INSERT INTO auth_perm_role_def VALUES ('1104', '11');

-- ----------------------------
-- Table structure for auth_perm_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_perm_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_perm_type (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of auth_perm_type
-- ----------------------------
INSERT INTO auth_perm_type VALUES ('1', '默认', '1', '0', null, '1');
INSERT INTO auth_perm_type VALUES ('2', '系统', '0', '1', null, '1');
INSERT INTO auth_perm_type VALUES ('11', '个人事务', '0', '11', null, '1');
INSERT INTO auth_perm_type VALUES ('21', '系统配置入口', '0', '21', null, '1');
INSERT INTO auth_perm_type VALUES ('31', '用户管理', '0', '31', null, '1');
INSERT INTO auth_perm_type VALUES ('41', '流程管理', '0', '41', null, '1');
INSERT INTO auth_perm_type VALUES ('51', '内容管理', '0', '51', null, '1');
INSERT INTO auth_perm_type VALUES ('61', '行政办公', '0', '61', null, '1');
INSERT INTO auth_perm_type VALUES ('71', '人力资源', '0', '71', null, '1');
INSERT INTO auth_perm_type VALUES ('81', '系统配置', '0', '81', null, '1');
INSERT INTO auth_perm_type VALUES ('91', '财务管理', '0', '91', null, '1');
INSERT INTO auth_perm_type VALUES ('101', 'CRM', '0', '101', null, '1');
INSERT INTO auth_perm_type VALUES ('111', '进销存', '0', '111', null, '1');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_role';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_role (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  ROLE_DEF_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_AUTH_ROLE_DEF FOREIGN KEY (ROLE_DEF_ID) REFERENCES auth_role_def (ID)
) ;

CREATE INDEX FK_AUTH_ROLE_DEF ON auth_role (ROLE_DEF_ID);

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO auth_role VALUES ('1', '超级管理员', null, '1', '1');
INSERT INTO auth_role VALUES ('2', '系统管理员', null, '2', '1');
INSERT INTO auth_role VALUES ('3', '账号管理员', null, '3', '1');
INSERT INTO auth_role VALUES ('4', '流程管理员', null, '4', '1');
INSERT INTO auth_role VALUES ('5', '内容管理员', null, '5', '1');
INSERT INTO auth_role VALUES ('6', '行政管理员', null, '6', '1');
INSERT INTO auth_role VALUES ('7', '人事管理员', null, '7', '1');
INSERT INTO auth_role VALUES ('8', '普通用户', null, '8', '1');
INSERT INTO auth_role VALUES ('9', '财务管理员', null, '9', '1');
INSERT INTO auth_role VALUES ('10', 'CRM管理员', null, '10', '1');
INSERT INTO auth_role VALUES ('11', '进销存管理员', null, '11', '1');

-- ----------------------------
-- Table structure for auth_role_def
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_role_def';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_role_def (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of auth_role_def
-- ----------------------------
INSERT INTO auth_role_def VALUES ('1', '超级管理员', null, '1');
INSERT INTO auth_role_def VALUES ('2', '系统管理员', null, '1');
INSERT INTO auth_role_def VALUES ('3', '账号管理员', null, '1');
INSERT INTO auth_role_def VALUES ('4', '流程管理员', null, '1');
INSERT INTO auth_role_def VALUES ('5', '内容管理员', null, '1');
INSERT INTO auth_role_def VALUES ('6', '行政管理员', null, '1');
INSERT INTO auth_role_def VALUES ('7', '人事管理员', null, '1');
INSERT INTO auth_role_def VALUES ('8', '普通用户', null, '1');
INSERT INTO auth_role_def VALUES ('9', '财务管理员', null, '1');
INSERT INTO auth_role_def VALUES ('10', 'CRM管理员', null, '1');
INSERT INTO auth_role_def VALUES ('11', '进销存管理员', null, '1');

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_user_role';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_user_role (
  USER_STATUS_ID number(19) NOT NULL,
  ROLE_ID number(19) NOT NULL,
  PRIMARY KEY (USER_STATUS_ID,ROLE_ID)
 ,
  CONSTRAINT FK_AUTH_USER_ROLE_ROLE FOREIGN KEY (ROLE_ID) REFERENCES auth_role (ID),
  CONSTRAINT FK_AUTH_USER_ROLE_USER FOREIGN KEY (USER_STATUS_ID) REFERENCES auth_user_status (ID)
) ;

CREATE INDEX FK_AUTH_USER_ROLE_ROLE ON auth_user_role (ROLE_ID);

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO auth_user_role VALUES ('1', '1');
INSERT INTO auth_user_role VALUES ('2', '1');
INSERT INTO auth_user_role VALUES ('1', '8');
INSERT INTO auth_user_role VALUES ('3', '8');
INSERT INTO auth_user_role VALUES ('4', '8');
INSERT INTO auth_user_role VALUES ('5', '8');
INSERT INTO auth_user_role VALUES ('6', '8');
INSERT INTO auth_user_role VALUES ('7', '8');
INSERT INTO auth_user_role VALUES ('8', '8');

-- ----------------------------
-- Table structure for auth_user_status
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS auth_user_status';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE auth_user_status (
  ID number(19) NOT NULL,
  USERNAME varchar2(50) DEFAULT NULL,
  PASSWORD varchar2(50) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  ref varchar2(200) DEFAULT NULL,
  USER_REPO_REF varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of auth_user_status
-- ----------------------------
INSERT INTO auth_user_status VALUES ('1', 'lingo', '1', '1', '1', '1', '1');
INSERT INTO auth_user_status VALUES ('2', 'vivian', '1', '1', '2', '1', '1');
INSERT INTO auth_user_status VALUES ('3', 'steven', '1', '1', '3', '1', '1');
INSERT INTO auth_user_status VALUES ('4', 'king', '1', '1', '4', '1', '1');
INSERT INTO auth_user_status VALUES ('5', 'john', '1', '1', '5', '1', '1');
INSERT INTO auth_user_status VALUES ('6', 'william', '1', '1', '6', '1', '1');
INSERT INTO auth_user_status VALUES ('7', 'adam', '1', '1', '7', '1', '1');
INSERT INTO auth_user_status VALUES ('8', 'robot', '1', '1', '8', '1', '1');

-- ----------------------------
-- Table structure for bpm_category
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_category';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_category (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of bpm_category
-- ----------------------------
INSERT INTO bpm_category VALUES ('1', '常用流程', '1', '1');

-- ----------------------------
-- Table structure for bpm_conf_assign
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_assign';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_assign (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  NODE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_ASSIGN_NODE FOREIGN KEY (NODE_ID) REFERENCES bpm_conf_node (ID)
) ;

CREATE INDEX FK_BPM_CONF_ASSIGN_NODE ON bpm_conf_assign (NODE_ID);

-- ----------------------------
-- Records of bpm_conf_assign
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_conf_base
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_base';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_base (
  ID number(19) NOT NULL,
  PROCESS_DEFINITION_ID varchar2(200) DEFAULT NULL,
  PROCESS_DEFINITION_KEY varchar2(200) DEFAULT NULL,
  PROCESS_DEFINITION_VERSION number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of bpm_conf_base
-- ----------------------------
INSERT INTO bpm_conf_base VALUES ('1', 'vacation:1:12', 'vacation', '1');
INSERT INTO bpm_conf_base VALUES ('2', 'publish:1:8', 'publish', '1');
INSERT INTO bpm_conf_base VALUES ('3', 'permission:1:4', 'permission', '1');

-- ----------------------------
-- Table structure for bpm_conf_countersign
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_countersign';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_countersign (
  ID number(19) NOT NULL,
  SEQUENTIAL number(10) DEFAULT NULL,
  PARTICIPANT varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  RATE number(10) DEFAULT NULL,
  NODE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_COUNTERSIGN_NODE FOREIGN KEY (NODE_ID) REFERENCES bpm_conf_node (ID)
) ;

CREATE INDEX FK_BPM_CONF_COUNTERSIGN_NODE ON bpm_conf_countersign (NODE_ID);

-- ----------------------------
-- Records of bpm_conf_countersign
-- ----------------------------
INSERT INTO bpm_conf_countersign VALUES ('515741686120448', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515749504581632', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515754645831680', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515796045529088', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515803674050560', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515810843508736', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515815809155072', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515824130375680', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515833494028288', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515836354002944', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515844960567296', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515847428849664', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515852869828608', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515855827582976', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515865460490240', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('515882612260864', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518026507665408', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518056255127552', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518104216682496', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518120228077568', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518186673340416', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518194874515456', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518199026745344', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518201887145984', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518206081515520', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518210637987840', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518215738490880', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518219987468288', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518222434697216', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518225029545984', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518229143584768', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518231954243584', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518250053632000', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518253555679232', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518259137216512', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518265083510784', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518267527577600', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518274134589440', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518277626576896', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518278985891840', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518281640787968', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518283818844160', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518287563194368', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518308814192640', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518314289594368', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518318112571392', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518335451168768', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518339415818240', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518343573110784', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518346253369344', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518349371817984', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('518369223704576', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('519764404240384', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('519770907377664', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('520013428490240', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('520876158779392', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('520906862690304', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521090133278720', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521195301601280', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521198290190336', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521202334498816', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521203903856640', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521209445646336', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521218031288320', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521222904135680', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521225152462848', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521236024606720', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521237631762432', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521241542049792', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521254469091328', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521258204954624', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521286187499520', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521287362674688', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521324200181760', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521329143152640', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521347306536960', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521405292462080', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521410564128768', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521423422586880', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521427219742720', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521430266839040', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521440574455808', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521443036299264', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521445316149248', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521450040868864', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521452656066560', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('521456414244864', '0', null, '0', '100', '515741685694464');
INSERT INTO bpm_conf_countersign VALUES ('522257999478784', '0', null, '0', '100', '515741685694464');

-- ----------------------------
-- Table structure for bpm_conf_form
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_form';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_form (
  ID number(19) NOT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  ORIGIN_VALUE varchar2(200) DEFAULT NULL,
  ORIGIN_TYPE number(10) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  NODE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_FORM_NODE FOREIGN KEY (NODE_ID) REFERENCES bpm_conf_node (ID)
) ;

CREATE INDEX FK_BPM_CONF_FORM_NODE ON bpm_conf_form (NODE_ID);

-- ----------------------------
-- Records of bpm_conf_form
-- ----------------------------
INSERT INTO bpm_conf_form VALUES ('515741669277696', 'permission-request', '0', 'permission-request', '0', '0', '13');
INSERT INTO bpm_conf_form VALUES ('515741672407040', 'permission-department', '0', 'permission-department', '0', '0', '14');
INSERT INTO bpm_conf_form VALUES ('515741676863488', 'permission-manager', '0', 'permission-manager', '0', '0', '16');
INSERT INTO bpm_conf_form VALUES ('515741684285440', 'publish-request', '0', 'publish-request', '0', '0', '515741684187136');
INSERT INTO bpm_conf_form VALUES ('515741685530624', 'publish-manager', '0', 'publish-manager', '0', '0', '515741685415936');
INSERT INTO bpm_conf_form VALUES ('515741685825536', 'publish-countersign', '0', 'publish-countersign', '0', '0', '515741685694464');
INSERT INTO bpm_conf_form VALUES ('515741688053760', 'publish-finish', '0', 'publish-finish', '0', '0', '515741686464512');
INSERT INTO bpm_conf_form VALUES ('515741694754816', 'vacation-request', '0', 'vacation-request', '0', '0', '3');
INSERT INTO bpm_conf_form VALUES ('515741694984192', 'vacation-department', '0', 'vacation-department', '0', '0', '4');
INSERT INTO bpm_conf_form VALUES ('515741695197184', 'vacation-hr', '0', 'vacation-hr', '0', '0', '5');
INSERT INTO bpm_conf_form VALUES ('515741695459328', 'vacation-modify', '0', 'vacation-modify', '0', '0', '6');
INSERT INTO bpm_conf_form VALUES ('515741695803392', 'vacation-finish', '0', 'vacation-finish', '0', '0', '8');

-- ----------------------------
-- Table structure for bpm_conf_listener
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_listener';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_listener (
  ID number(19) NOT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  NODE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_LISTENER_NODE FOREIGN KEY (NODE_ID) REFERENCES bpm_conf_node (ID)
) ;

CREATE INDEX FK_BPM_CONF_LISTENER_NODE ON bpm_conf_listener (NODE_ID);

-- ----------------------------
-- Records of bpm_conf_listener
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_conf_node
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_node';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_node (
  ID number(19) NOT NULL,
  CODE varchar2(200) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  CONF_USER number(10) DEFAULT NULL,
  CONF_LISTENER number(10) DEFAULT NULL,
  CONF_RULE number(10) DEFAULT NULL,
  CONF_FORM number(10) DEFAULT NULL,
  CONF_OPERATION number(10) DEFAULT NULL,
  CONF_NOTICE number(10) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  CONF_BASE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_NODE_CONF_BASE FOREIGN KEY (CONF_BASE_ID) REFERENCES bpm_conf_base (ID)
) ;

CREATE INDEX FK_BPM_CONF_NODE_CONF_BASE ON bpm_conf_node (CONF_BASE_ID);

-- ----------------------------
-- Records of bpm_conf_node
-- ----------------------------
INSERT INTO bpm_conf_node VALUES ('1', 'vacation', '全局', 'process', '2', '0', '2', '0', '2', '2', '1', '1');
INSERT INTO bpm_conf_node VALUES ('2', 'vacation_1', '填写请假单', 'startEvent', '2', '0', '2', '0', '2', '0', '2', '1');
INSERT INTO bpm_conf_node VALUES ('3', 'taskuser-1', '填写请假单', 'userTask', '0', '0', '0', '0', '0', '0', '3', '1');
INSERT INTO bpm_conf_node VALUES ('4', 'taskuser-2', '部门领导审批', 'userTask', '0', '0', '0', '0', '0', '0', '4', '1');
INSERT INTO bpm_conf_node VALUES ('5', 'taskuser-3', '人事审批', 'userTask', '0', '0', '0', '0', '0', '0', '5', '1');
INSERT INTO bpm_conf_node VALUES ('6', 'taskuser-5', '调整申请', 'userTask', '0', '0', '0', '0', '0', '0', '6', '1');
INSERT INTO bpm_conf_node VALUES ('7', 'endnone-2', 'endnone-2', 'endEvent', '2', '0', '2', '2', '2', '0', '7', '1');
INSERT INTO bpm_conf_node VALUES ('8', 'taskuser-6', '销假', 'userTask', '0', '0', '0', '0', '0', '0', '8', '1');
INSERT INTO bpm_conf_node VALUES ('11', 'permission', '审批权限', 'process', '2', '0', '2', '0', '2', '2', '1', '3');
INSERT INTO bpm_conf_node VALUES ('12', 'startEvent-1', '', 'startEvent', '2', '0', '2', '0', '2', '0', '2', '3');
INSERT INTO bpm_conf_node VALUES ('13', 'usertask1', '发起申请', 'userTask', '0', '0', '0', '0', '0', '0', '3', '3');
INSERT INTO bpm_conf_node VALUES ('14', 'usertask2', '部门经理审批', 'userTask', '0', '0', '0', '0', '0', '0', '4', '3');
INSERT INTO bpm_conf_node VALUES ('15', 'endevent1', '', 'endEvent', '2', '0', '2', '2', '2', '0', '5', '3');
INSERT INTO bpm_conf_node VALUES ('16', 'usertask3', '总经理审批', 'userTask', '0', '0', '0', '0', '0', '0', null, '3');
INSERT INTO bpm_conf_node VALUES ('515741684039680', 'publish', '全局', 'process', '2', '0', '2', '0', '2', '2', '1', '2');
INSERT INTO bpm_conf_node VALUES ('515741684137984', 'startevent1', 'Start', 'startEvent', '2', '0', '2', '0', '2', '0', '2', '2');
INSERT INTO bpm_conf_node VALUES ('515741684187136', 'taskuser-1', '发文', 'userTask', '0', '0', '0', '0', '0', '0', '3', '2');
INSERT INTO bpm_conf_node VALUES ('515741685415936', 'taskuser-2', '部门领导审批', 'userTask', '0', '0', '0', '0', '0', '0', '4', '2');
INSERT INTO bpm_conf_node VALUES ('515741685694464', 'taskuser-3', '会签', 'userTask', '0', '0', '0', '0', '0', '0', '5', '2');
INSERT INTO bpm_conf_node VALUES ('515741686464512', 'taskuser-6', '归档', 'userTask', '0', '0', '0', '0', '0', '0', '6', '2');
INSERT INTO bpm_conf_node VALUES ('515741688365056', 'endnone-2', 'endnone-2', 'endEvent', '2', '0', '2', '2', '2', '0', '7', '2');

-- ----------------------------
-- Table structure for bpm_conf_notice
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_notice';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_notice (
  ID number(19) NOT NULL,
  TYPE number(10) DEFAULT NULL,
  RECEIVER varchar2(200) DEFAULT NULL,
  DUE_DATE varchar2(50) DEFAULT NULL,
  NODE_ID number(19) DEFAULT NULL,
  TEMPLATE_ID number(19) DEFAULT NULL,
  TEMPLATE_CODE varchar2(200) DEFAULT NULL,
  NOTIFICATION_TYPE varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_NOTICE_NODE FOREIGN KEY (NODE_ID) REFERENCES bpm_conf_node (ID),
  CONSTRAINT FK_BPM_CONF_NOTICE_TEMPLATE FOREIGN KEY (TEMPLATE_ID) REFERENCES bpm_mail_template (ID)
) ;

CREATE INDEX FK_BPM_CONF_NOTICE_NODE ON bpm_conf_notice (NODE_ID);
CREATE INDEX FK_BPM_CONF_NOTICE_TEMPLATE ON bpm_conf_notice (TEMPLATE_ID);

-- ----------------------------
-- Records of bpm_conf_notice
-- ----------------------------
INSERT INTO bpm_conf_notice VALUES ('1', '0', '任务接收人', null, '4', '1', 'arrival-assignee', 'msg,email');
INSERT INTO bpm_conf_notice VALUES ('2', '0', '流程发起人', null, '5', '2', 'arrival-initiator', 'msg,email');
INSERT INTO bpm_conf_notice VALUES ('3', '1', '1', null, '8', '3', 'complete', 'msg,email');
INSERT INTO bpm_conf_notice VALUES ('4', '2', '任务接收人', 'P1H', '8', '4', 'timeout', 'msg,email');

-- ----------------------------
-- Table structure for bpm_conf_operation
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_operation';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_operation (
  ID number(19) NOT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  NODE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_OPERATION_NODE FOREIGN KEY (NODE_ID) REFERENCES bpm_conf_node (ID)
) ;

CREATE INDEX FK_BPM_CONF_OPERATION_NODE ON bpm_conf_operation (NODE_ID);

-- ----------------------------
-- Records of bpm_conf_operation
-- ----------------------------
INSERT INTO bpm_conf_operation VALUES ('1', 'saveDraft', null, '3');
INSERT INTO bpm_conf_operation VALUES ('2', 'completeTask', null, '3');
INSERT INTO bpm_conf_operation VALUES ('3', 'saveDraft', null, '4');
INSERT INTO bpm_conf_operation VALUES ('4', 'completeTask', null, '4');
INSERT INTO bpm_conf_operation VALUES ('5', 'saveDraft', null, '5');
INSERT INTO bpm_conf_operation VALUES ('6', 'completeTask', null, '5');
INSERT INTO bpm_conf_operation VALUES ('7', 'saveDraft', null, '6');
INSERT INTO bpm_conf_operation VALUES ('8', 'completeTask', null, '6');
INSERT INTO bpm_conf_operation VALUES ('9', 'saveDraft', null, '8');
INSERT INTO bpm_conf_operation VALUES ('10', 'completeTask', null, '8');
INSERT INTO bpm_conf_operation VALUES ('11', 'saveDraft', null, '14');
INSERT INTO bpm_conf_operation VALUES ('12', 'completeTask', null, '14');
INSERT INTO bpm_conf_operation VALUES ('13', 'rollbackPrevious', null, '14');
INSERT INTO bpm_conf_operation VALUES ('14', 'saveDraft', null, '16');
INSERT INTO bpm_conf_operation VALUES ('15', 'completeTask', null, '16');
INSERT INTO bpm_conf_operation VALUES ('16', 'rollbackPrevious', null, '16');
INSERT INTO bpm_conf_operation VALUES ('101', 'rollbackInitiator', null, '14');
INSERT INTO bpm_conf_operation VALUES ('102', 'transfer', null, '14');
INSERT INTO bpm_conf_operation VALUES ('103', 'delegateTask', null, '14');
INSERT INTO bpm_conf_operation VALUES ('104', 'communicate', null, '14');
INSERT INTO bpm_conf_operation VALUES ('105', 'addCounterSign', null, '14');

-- ----------------------------
-- Table structure for bpm_conf_rule
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_rule';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_rule (
  ID number(19) NOT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  NODE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_RULE_NODE FOREIGN KEY (NODE_ID) REFERENCES bpm_conf_node (ID)
) ;

CREATE INDEX FK_BPM_CONF_RULE_NODE ON bpm_conf_rule (NODE_ID);

-- ----------------------------
-- Records of bpm_conf_rule
-- ----------------------------
INSERT INTO bpm_conf_rule VALUES ('1', '职位', '14');

-- ----------------------------
-- Table structure for bpm_conf_user
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_conf_user';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_conf_user (
  ID number(19) NOT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  NODE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_CONF_USER_NODE FOREIGN KEY (NODE_ID) REFERENCES bpm_conf_node (ID)
) ;

CREATE INDEX FK_BPM_CONF_USER_NODE ON bpm_conf_user (NODE_ID);

-- ----------------------------
-- Records of bpm_conf_user
-- ----------------------------
INSERT INTO bpm_conf_user VALUES ('515741668573184', '常用语:流程发起人', '0', '0', '1', '13');
INSERT INTO bpm_conf_user VALUES ('515741672341504', '岗位:经理', '0', '0', '1', '14');
INSERT INTO bpm_conf_user VALUES ('515741676797952', '岗位:总经理', '0', '0', '1', '16');
INSERT INTO bpm_conf_user VALUES ('515741684236288', '常用语:流程发起人', '0', '0', '1', '515741684187136');
INSERT INTO bpm_conf_user VALUES ('515741685497856', '常用语:直接上级', '0', '0', '1', '515741685415936');
INSERT INTO bpm_conf_user VALUES ('515741685792768', '${countersignUser}', '0', '0', '1', '515741685694464');
INSERT INTO bpm_conf_user VALUES ('515741687955456', '常用语:流程发起人', '0', '0', '1', '515741686464512');
INSERT INTO bpm_conf_user VALUES ('515741694722048', '常用语:流程发起人', '0', '0', '1', '3');
INSERT INTO bpm_conf_user VALUES ('515741694951424', '常用语:直接上级', '0', '0', '1', '4');
INSERT INTO bpm_conf_user VALUES ('515741695164416', '7', '0', '0', '1', '5');
INSERT INTO bpm_conf_user VALUES ('515741695410176', '常用语:流程发起人', '0', '0', '1', '6');
INSERT INTO bpm_conf_user VALUES ('515741695737856', '常用语:流程发起人', '0', '0', '1', '8');

-- ----------------------------
-- Table structure for bpm_instance
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_instance';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_instance (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  BUSINESS_KEY varchar2(64) DEFAULT NULL,
  REF varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  INITIATOR varchar2(64) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PROCESS_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_INSTANCE_PROCESS FOREIGN KEY (PROCESS_ID) REFERENCES bpm_process (ID)
) ;

CREATE INDEX FK_BPM_INSTANCE_PROCESS ON bpm_instance (PROCESS_ID);

-- ----------------------------
-- Records of bpm_instance
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_mail_template
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_mail_template';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_mail_template (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  SUBJECT varchar2(100) DEFAULT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of bpm_mail_template
-- ----------------------------
INSERT INTO bpm_mail_template VALUES ('1', '任务到达（任务处理人）', '您有新任务需要处理', '#{task.assignee}您好，您有新任务需要处理——#{task.name}。');
INSERT INTO bpm_mail_template VALUES ('2', '任务到达（流程发起人）', '您的流程已经到达#{task.name}环节', '#{initiator}您好，您的流程已经到达#{task.name}环节');
INSERT INTO bpm_mail_template VALUES ('3', '任务完成', '流程已经完成#{task.name}环节', '您好，#{initiator}的流程已经完成#{task.name}环节');
INSERT INTO bpm_mail_template VALUES ('4', '任务超时提醒', '任务即将过期', '#{task.assignee}您好，任务#{task.name}已经即将到期');

-- ----------------------------
-- Table structure for bpm_process
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_process';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_process (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CATEGORY_ID number(19) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  USE_TASK_CONF number(10) DEFAULT NULL,
  CODE varchar2(64) DEFAULT NULL,
  CONF_BASE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_PROCESS_CATEGORY_ID FOREIGN KEY (CATEGORY_ID) REFERENCES bpm_category (ID),
  CONSTRAINT FK_BPM_PROCESS_CONF_BASE FOREIGN KEY (CONF_BASE_ID) REFERENCES bpm_conf_base (ID)
) ;

CREATE INDEX FK_BPM_PROCESS_CATEGORY_ID ON bpm_process (CATEGORY_ID);
CREATE INDEX FK_BPM_PROCESS_CONF_BASE ON bpm_process (CONF_BASE_ID);

-- ----------------------------
-- Records of bpm_process
-- ----------------------------
INSERT INTO bpm_process VALUES ('1', '请假流程', '1', '1', '通用请假流程', '0', 'vacation', '1', '1');
INSERT INTO bpm_process VALUES ('2', '发文流程', '1', '2', '通用发文流程', '0', 'publish', '2', '1');
INSERT INTO bpm_process VALUES ('3', '权限审批', '1', '3', '权限审批流程', '1', 'permission', '3', '1');

-- ----------------------------
-- Table structure for bpm_task_conf
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_task_conf';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_task_conf (
  ID number(19) NOT NULL,
  BUSINESS_KEY varchar2(200) DEFAULT NULL,
  TASK_DEFINITION_KEY varchar2(200) DEFAULT NULL,
  ASSIGNEE varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of bpm_task_conf
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_task_def
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_task_def';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_task_def (
  ID number(19) NOT NULL,
  TASK_DEFINITION_KEY varchar2(200) DEFAULT NULL,
  ASSIGNEE varchar2(200) DEFAULT NULL,
  CANDIDATE varchar2(200) DEFAULT NULL,
  PROCESS_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_TASK_DEF_ID FOREIGN KEY (PROCESS_ID) REFERENCES bpm_process (ID)
) ;

CREATE INDEX FK_BPM_TASK_DEF_ID ON bpm_task_def (PROCESS_ID);

-- ----------------------------
-- Records of bpm_task_def
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_task_def_notice
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS bpm_task_def_notice';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE bpm_task_def_notice (
  ID number(19) NOT NULL,
  TASK_DEFINITION_KEY varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  RECEIVER varchar2(200) DEFAULT NULL,
  DUE_DATE varchar2(50) DEFAULT NULL,
  TEMPLATE_ID number(19) DEFAULT NULL,
  PROCESS_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_BPM_TASK_DEF_NOTICE_PROCESS FOREIGN KEY (PROCESS_ID) REFERENCES bpm_process (ID),
  CONSTRAINT FK_BPM_TASK_DEF_NOTICE_TEMPLATE FOREIGN KEY (TEMPLATE_ID) REFERENCES bpm_mail_template (ID)
) ;

CREATE INDEX FK_BPM_TASK_DEF_NOTICE_PROCESS ON bpm_task_def_notice (PROCESS_ID);
CREATE INDEX FK_BPM_TASK_DEF_NOTICE_TEMPLATE ON bpm_task_def_notice (TEMPLATE_ID);

-- ----------------------------
-- Records of bpm_task_def_notice
-- ----------------------------
INSERT INTO bpm_task_def_notice VALUES ('1', 'taskuser-2', '0', '任务接收人', null, '1', '1');
INSERT INTO bpm_task_def_notice VALUES ('2', 'taskuser-3', '0', '流程发起人', null, '2', '1');
INSERT INTO bpm_task_def_notice VALUES ('3', 'taskuser-6', '1', 'king', null, '3', '1');
INSERT INTO bpm_task_def_notice VALUES ('4', 'taskuser-6', '2', '任务接收人', 'P1H', '4', '1');

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_article';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_article (
  ID number(19) NOT NULL,
  TITLE varchar2(200) DEFAULT NULL,
  SHORT_TITLE varchar2(200) DEFAULT NULL,
  SUB_TITLE varchar2(200) DEFAULT NULL,
  CONTENT clob,
  SUMMARY varchar2(200) DEFAULT NULL,
  LOGO varchar2(200) DEFAULT NULL,
  KEYWORD varchar2(200) DEFAULT NULL,
  TAGS varchar2(200) DEFAULT NULL,
  SOURCE varchar2(200) DEFAULT NULL,
  ALLOW_COMMENT number(10) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  PUBLISH_TIME timestamp(0) DEFAULT NULL NULL,
  CLOSE_TIME timestamp(0) DEFAULT NULL NULL,
  TYPE number(10) DEFAULT NULL,
  TOP number(10) DEFAULT NULL,
  WEIGHT number(10) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL NULL,
  TEMPLATE varchar2(200) DEFAULT NULL,
  HIT_COUNT varchar2(200) DEFAULT NULL,
  RECOMMEND_ID number(19) DEFAULT NULL,
  RECOMMEND_STATUS number(10) DEFAULT NULL,
  USER_ID varchar2(200) DEFAULT NULL,
  CATALOG_ID number(19) DEFAULT NULL,
  COMMENT_COUNT number(10) DEFAULT NULL,
  CODE varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_ARTICLE_CATALOG FOREIGN KEY (CATALOG_ID) REFERENCES cms_catalog (ID)
) ;

CREATE INDEX FK_CMS_ARTICLE_CATALOG ON cms_article (CATALOG_ID);

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO cms_article VALUES ('1', 'LemonOA 1.4.0发布', null, null, 'LemonOA 1.4.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2014-11-26 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-4-0', '1');
INSERT INTO cms_article VALUES ('2', 'LemonOA 1.3.1发布', null, null, 'LemonOA 1.3.1发布', null, null, null, null, null, null, null, null, null, null, null, null, '2014-09-12 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-3-1', '1');
INSERT INTO cms_article VALUES ('3', 'LemonOA 1.3.0发布', null, null, 'LemonOA 1.3.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2014-08-29 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-3-0', '1');
INSERT INTO cms_article VALUES ('4', 'LemonOA 1.2.0发布', null, null, 'LemonOA 1.2.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2014-06-11 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-2-0', '1');
INSERT INTO cms_article VALUES ('5', 'LemonOA 1.1.0发布', null, null, 'LemonOA 1.1.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2014-03-31 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-1-0', '1');
INSERT INTO cms_article VALUES ('6', 'LemonOA 1.0.0发布', null, null, 'LemonOA 1.0.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2014-02-10 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-0-0', '1');
INSERT INTO cms_article VALUES ('7', 'LemonOA 0.9.0发布', null, null, 'LemonOA 0.9.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2013-12-31 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-0-9-0', '1');
INSERT INTO cms_article VALUES ('8', 'LemonOA 0.8.0发布', null, null, 'LemonOA 0.8.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2013-11-14 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-0-8-0', '1');
INSERT INTO cms_article VALUES ('9', 'LemonOA 1.5.0发布', null, null, 'LemonOA 1.5.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2015-07-27 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-5-0', '1');
INSERT INTO cms_article VALUES ('10', 'LemonOA 1.5.1发布', null, null, 'LemonOA 1.5.1发布', null, null, null, null, null, null, null, null, null, null, null, null, '2015-08-10 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-5-1', '1');
INSERT INTO cms_article VALUES ('11', 'LemonOA 1.6.0发布', null, null, 'LemonOA 1.6.0发布', null, null, null, null, null, null, null, null, null, null, null, null, '2015-10-30 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-6-0', '1');
INSERT INTO cms_article VALUES ('12', 'LemonOA 1.6.1发布', null, null, 'LemonOA 1.6.1发布', null, null, null, null, null, null, null, null, null, null, null, null, '2015-12-03 00:00:00', null, '0', null, null, '1', '1', '0', 'lemon-1-6-1', '1');

-- ----------------------------
-- Table structure for cms_attachment
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_attachment';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_attachment (
  ID number(19) NOT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PATH varchar2(200) DEFAULT NULL,
  SIZE number(10) DEFAULT NULL,
  HEIGHT number(10) DEFAULT NULL,
  WIDTH number(10) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  USER_ID varchar2(200) DEFAULT NULL,
  ARTICLE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_ATTACHMENT_ARTICLE FOREIGN KEY (ARTICLE_ID) REFERENCES cms_article (ID)
) ;

CREATE INDEX FK_CMS_ATTACHMENT_ARTICLE ON cms_attachment (ARTICLE_ID);

-- ----------------------------
-- Records of cms_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_catalog
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_catalog';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_catalog (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  CODE varchar2(200) DEFAULT NULL,
  LOGO varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  TEMPLATE_INDEX varchar2(200) DEFAULT NULL,
  TEMPLATE_LIST varchar2(200) DEFAULT NULL,
  TEMPLATE_DETAIL varchar2(200) DEFAULT NULL,
  KEYWORD varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  SITE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_CATALOG_PARENT FOREIGN KEY (PARENT_ID) REFERENCES cms_catalog (ID),
  CONSTRAINT FK_CMS_CATALOG_SITE FOREIGN KEY (SITE_ID) REFERENCES cms_site (ID)
) ;

CREATE INDEX FK_CMS_CATALOG_PARENT ON cms_catalog (PARENT_ID);
CREATE INDEX FK_CMS_CATALOG_SITE ON cms_catalog (SITE_ID);

-- ----------------------------
-- Records of cms_catalog
-- ----------------------------
INSERT INTO cms_catalog VALUES ('1', '最新动态', 'news', null, '0', '/default/index.html', '/default/list.html', '/default/detail.html', null, null, null, '1', null);

-- ----------------------------
-- Table structure for cms_click
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_click';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_click (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  USER_ID varchar2(50) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  ARTICLE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_CLICK_ARTICLE FOREIGN KEY (ARTICLE_ID) REFERENCES cms_article (ID)
) ;

CREATE INDEX FK_CMS_CLICK_ARTICLE ON cms_click (ARTICLE_ID);

-- ----------------------------
-- Records of cms_click
-- ----------------------------

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_comment';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_comment (
  ID number(19) NOT NULL,
  TITLE varchar2(200) DEFAULT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  USER_ID varchar2(200) DEFAULT NULL,
  ARTICLE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_COMMENT_ARTICLE FOREIGN KEY (ARTICLE_ID) REFERENCES cms_article (ID),
  CONSTRAINT FK_CMS_COMMENT_PARENT FOREIGN KEY (PARENT_ID) REFERENCES cms_comment (ID)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE cms_comment_seq START WITH 3 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER cms_comment_seq_tr
 BEFORE INSERT ON cms_comment FOR EACH ROW
 WHEN (NEW.ID IS NULL)
BEGIN
 SELECT cms_comment_seq.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

CREATE INDEX FK_CMS_COMMENT_ARTICLE ON cms_comment (ARTICLE_ID);
CREATE INDEX FK_CMS_COMMENT_PARENT ON cms_comment (PARENT_ID);

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO cms_comment VALUES ('1', null, '测试', null, '2014-12-02 00:00:01', '1', '1', null, null);
INSERT INTO cms_comment VALUES ('2', null, '测试', null, '2014-12-02 00:00:02', '1', '1', null, null);

-- ----------------------------
-- Table structure for cms_content
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_content';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_content (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  CODE varchar2(200) DEFAULT NULL,
  CONTENT clob,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of cms_content
-- ----------------------------

-- ----------------------------
-- Table structure for cms_favorite
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_favorite';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_favorite (
  ID number(19) NOT NULL,
  SUBJECT varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  USER_ID varchar2(200) DEFAULT NULL,
  ARTICLE_ID number(19) DEFAULT NULL,
  COMMENT_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_FAVORITE_ARTICLE FOREIGN KEY (ARTICLE_ID) REFERENCES cms_article (ID),
  CONSTRAINT FK_CMS_FAVORITE_COMMENT FOREIGN KEY (COMMENT_ID) REFERENCES cms_comment (ID)
) ;

CREATE INDEX FK_CMS_FAVORITE_ARTICLE ON cms_favorite (ARTICLE_ID);
CREATE INDEX FK_CMS_FAVORITE_COMMENT ON cms_favorite (COMMENT_ID);

-- ----------------------------
-- Records of cms_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_site';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_site (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  NAME varchar2(50) DEFAULT NULL,
  CODE varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_ARTICLE_PARENT FOREIGN KEY (PARENT_ID) REFERENCES cms_article (ID)
) ;

CREATE INDEX FK_CMS_ARTICLE_PARENT ON cms_site (PARENT_ID);

-- ----------------------------
-- Records of cms_site
-- ----------------------------

-- ----------------------------
-- Table structure for cms_tag
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_tag';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_tag (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  COUNT_ARTICLE number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of cms_tag
-- ----------------------------

-- ----------------------------
-- Table structure for cms_tag_article
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_tag_article';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_tag_article (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  TAG_ID number(19) DEFAULT NULL,
  ARTICLE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_TAG_ARTICLE_ARTICLE FOREIGN KEY (ARTICLE_ID) REFERENCES cms_article (ID),
  CONSTRAINT FK_CMS_TAG_ARTICLE_TAG FOREIGN KEY (TAG_ID) REFERENCES cms_tag (ID)
) ;

CREATE INDEX FK_CMS_TAG_ARTICLE_TAG ON cms_tag_article (TAG_ID);
CREATE INDEX FK_CMS_TAG_ARTICLE_ARTICLE ON cms_tag_article (ARTICLE_ID);

-- ----------------------------
-- Records of cms_tag_article
-- ----------------------------

-- ----------------------------
-- Table structure for cms_version
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS cms_version';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE cms_version (
  ID number(19) NOT NULL,
  CODE varchar2(64) DEFAULT NULL,
  NAME varchar2(50) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  CONTENT_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_CMS_VERSION_CONTENT FOREIGN KEY (CONTENT_ID) REFERENCES cms_content (ID)
) ;

CREATE INDEX FK_CMS_VERSION_CONTENT ON cms_version (CONTENT_ID);

-- ----------------------------
-- Records of cms_version
-- ----------------------------

-- ----------------------------
-- Table structure for contract_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS contract_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE contract_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  COMPANY varchar2(50) DEFAULT NULL,
  CODE varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT NULL,
  END_TIME timestamp(0) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of contract_info
-- ----------------------------

-- ----------------------------
-- Table structure for delegate_history
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS delegate_history';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE delegate_history (
  ID number(19) NOT NULL,
  ASSIGNEE varchar2(200) DEFAULT NULL,
  ATTORNEY varchar2(200) DEFAULT NULL,
  DELEGATE_TIME timestamp(0) DEFAULT NULL,
  TASK_ID varchar2(100) DEFAULT NULL,
  PROCESS_DEFINITION_ID varchar2(100) DEFAULT NULL,
  TASK_DEFINITION_KEY varchar2(100) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of delegate_history
-- ----------------------------

-- ----------------------------
-- Table structure for delegate_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS delegate_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE delegate_info (
  ID number(19) NOT NULL,
  ASSIGNEE varchar2(200) DEFAULT NULL,
  ATTORNEY varchar2(200) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT NULL,
  END_TIME timestamp(0) DEFAULT NULL,
  PROCESS_DEFINITION_ID varchar2(100) DEFAULT NULL,
  TASK_DEFINITION_KEY varchar2(100) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of delegate_info
-- ----------------------------

-- ----------------------------
-- Table structure for dict_data
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS dict_data';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dict_data (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  SCHEMA_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_DICT_DATA_INFO FOREIGN KEY (INFO_ID) REFERENCES dict_info (ID),
  CONSTRAINT FK_DICT_DATA_SCHEMA FOREIGN KEY (SCHEMA_ID) REFERENCES dict_schema (ID)
) ;

CREATE INDEX FK_DICT_DATA_INFO ON dict_data (INFO_ID);
CREATE INDEX FK_DICT_DATA_SCHEMA ON dict_data (SCHEMA_ID);

-- ----------------------------
-- Records of dict_data
-- ----------------------------
INSERT INTO dict_data VALUES ('1', '城市', '北京', '201', '1', '1');
INSERT INTO dict_data VALUES ('2', '人员', '临远', '201', '2', '1');
INSERT INTO dict_data VALUES ('3', '电话', '13800138000', '201', '3', '1');
INSERT INTO dict_data VALUES ('4', '地址', '北京六环外', '201', '4', '1');
INSERT INTO dict_data VALUES ('11', '城市', '唐山', '202', '1', '1');
INSERT INTO dict_data VALUES ('12', '人员', '临远', '202', '2', '1');
INSERT INTO dict_data VALUES ('13', '电话', '13800138000', '202', '3', '1');
INSERT INTO dict_data VALUES ('14', '地址', '路北区凤凰山', '202', '4', '1');

-- ----------------------------
-- Table structure for dict_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS dict_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dict_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TYPE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_DICT_INFO_TYPE FOREIGN KEY (TYPE_ID) REFERENCES dict_type (ID)
) ;

CREATE INDEX FK_DICT_INFO_TYPE ON dict_info (TYPE_ID);

-- ----------------------------
-- Records of dict_info
-- ----------------------------
INSERT INTO dict_info VALUES ('1', '北京', '北京', '1', '1', '1');
INSERT INTO dict_info VALUES ('2', '天津', '天津', '2', '1', '1');
INSERT INTO dict_info VALUES ('3', '河北', '河北', '3', '1', '1');
INSERT INTO dict_info VALUES ('4', '山西', '山西', '4', '1', '1');
INSERT INTO dict_info VALUES ('5', '内蒙古', '内蒙古', '5', '1', '1');
INSERT INTO dict_info VALUES ('6', '辽宁', '辽宁', '6', '1', '1');
INSERT INTO dict_info VALUES ('7', '吉林', '吉林', '7', '1', '1');
INSERT INTO dict_info VALUES ('8', '黑龙江', '黑龙江', '8', '1', '1');
INSERT INTO dict_info VALUES ('9', '上海', '上海', '9', '1', '1');
INSERT INTO dict_info VALUES ('10', '江苏', '江苏', '10', '1', '1');
INSERT INTO dict_info VALUES ('11', '浙江', '浙江', '11', '1', '1');
INSERT INTO dict_info VALUES ('12', '安徽', '安徽', '12', '1', '1');
INSERT INTO dict_info VALUES ('13', '福建', '福建', '13', '1', '1');
INSERT INTO dict_info VALUES ('14', '江西', '江西', '14', '1', '1');
INSERT INTO dict_info VALUES ('15', '山东', '山东', '15', '1', '1');
INSERT INTO dict_info VALUES ('16', '河南', '河南', '16', '1', '1');
INSERT INTO dict_info VALUES ('17', '湖北', '湖北', '17', '1', '1');
INSERT INTO dict_info VALUES ('18', '湖南', '湖南', '18', '1', '1');
INSERT INTO dict_info VALUES ('19', '广东', '广东', '19', '1', '1');
INSERT INTO dict_info VALUES ('20', '广西', '广西', '20', '1', '1');
INSERT INTO dict_info VALUES ('21', '海南', '海南', '21', '1', '1');
INSERT INTO dict_info VALUES ('22', '重庆', '重庆', '22', '1', '1');
INSERT INTO dict_info VALUES ('23', '四川', '四川', '23', '1', '1');
INSERT INTO dict_info VALUES ('24', '贵州', '贵州', '24', '1', '1');
INSERT INTO dict_info VALUES ('25', '云南', '云南', '25', '1', '1');
INSERT INTO dict_info VALUES ('26', '西藏', '西藏', '26', '1', '1');
INSERT INTO dict_info VALUES ('27', '陕西', '陕西', '27', '1', '1');
INSERT INTO dict_info VALUES ('28', '甘肃', '甘肃', '28', '1', '1');
INSERT INTO dict_info VALUES ('29', '青海', '青海', '29', '1', '1');
INSERT INTO dict_info VALUES ('30', '宁夏', '宁夏', '30', '1', '1');
INSERT INTO dict_info VALUES ('31', '新疆', '新疆', '31', '1', '1');
INSERT INTO dict_info VALUES ('32', '台湾', '台湾', '32', '1', '1');
INSERT INTO dict_info VALUES ('33', '香港', '香港', '33', '1', '1');
INSERT INTO dict_info VALUES ('34', '澳门', '澳门', '34', '1', '1');
INSERT INTO dict_info VALUES ('101', 'ACHANG', '阿昌族', '1', '2', '1');
INSERT INTO dict_info VALUES ('102', 'BAI', '白族', '1', '2', '1');
INSERT INTO dict_info VALUES ('103', 'BLANG', '布朗族', '1', '2', '1');
INSERT INTO dict_info VALUES ('104', 'BONAN', '保安族', '1', '2', '1');
INSERT INTO dict_info VALUES ('105', 'BOUYEI', '布依族', '1', '2', '1');
INSERT INTO dict_info VALUES ('106', 'CHOSEN', '朝鲜族', '1', '2', '1');
INSERT INTO dict_info VALUES ('107', 'DAI', '傣族', '1', '2', '1');
INSERT INTO dict_info VALUES ('108', 'DAUR', '达斡尔族', '1', '2', '1');
INSERT INTO dict_info VALUES ('109', 'DEANG', '德昂族', '1', '2', '1');
INSERT INTO dict_info VALUES ('110', 'DONG', '侗族', '1', '2', '1');
INSERT INTO dict_info VALUES ('111', 'DONGXIAN', '东乡族', '1', '2', '1');
INSERT INTO dict_info VALUES ('112', 'DRUNG', '独龙族', '1', '2', '1');
INSERT INTO dict_info VALUES ('113', 'EWENKI', '鄂温克族', '1', '2', '1');
INSERT INTO dict_info VALUES ('114', 'GAOSHAN', '高山族', '1', '2', '1');
INSERT INTO dict_info VALUES ('115', 'GELAO', '仡佬族', '1', '2', '1');
INSERT INTO dict_info VALUES ('116', 'HAN', '汉族', '1', '2', '1');
INSERT INTO dict_info VALUES ('117', 'HANI', '哈尼族', '1', '2', '1');
INSERT INTO dict_info VALUES ('118', 'HEZHEN', '赫哲族', '1', '2', '1');
INSERT INTO dict_info VALUES ('119', 'HUI', '回族', '1', '2', '1');
INSERT INTO dict_info VALUES ('120', 'JING', '京族', '1', '2', '1');
INSERT INTO dict_info VALUES ('121', 'JINGPO', '景颇族', '1', '2', '1');
INSERT INTO dict_info VALUES ('122', 'JINO', '基诺族', '1', '2', '1');
INSERT INTO dict_info VALUES ('123', 'KAZAK', '哈萨克族', '1', '2', '1');
INSERT INTO dict_info VALUES ('124', 'KIRGIZ', '柯尔克孜族', '1', '2', '1');
INSERT INTO dict_info VALUES ('125', 'LAHU', '拉祜族', '1', '2', '1');
INSERT INTO dict_info VALUES ('126', 'LHOBA', '珞巴族', '1', '2', '1');
INSERT INTO dict_info VALUES ('127', 'LI', '黎族', '1', '2', '1');
INSERT INTO dict_info VALUES ('128', 'LISU', '傈僳族', '1', '2', '1');
INSERT INTO dict_info VALUES ('129', 'MAN', '满族', '1', '2', '1');
INSERT INTO dict_info VALUES ('130', 'MAONAN', '毛南族', '1', '2', '1');
INSERT INTO dict_info VALUES ('131', 'MIAO', '苗族', '1', '2', '1');
INSERT INTO dict_info VALUES ('132', 'MOINBA', '门巴族', '1', '2', '1');
INSERT INTO dict_info VALUES ('133', 'MONGOL', '蒙古族', '1', '2', '1');
INSERT INTO dict_info VALUES ('134', 'MULAO', '仫佬族', '1', '2', '1');
INSERT INTO dict_info VALUES ('135', 'NAXI', '纳西族', '1', '2', '1');
INSERT INTO dict_info VALUES ('136', 'NU', '怒族', '1', '2', '1');
INSERT INTO dict_info VALUES ('137', 'OROQEN', '鄂伦春族', '1', '2', '1');
INSERT INTO dict_info VALUES ('138', 'OZBEK', '乌孜别克族', '1', '2', '1');
INSERT INTO dict_info VALUES ('139', 'PUMI', '普米族', '1', '2', '1');
INSERT INTO dict_info VALUES ('140', 'QIANG', '羌族', '1', '2', '1');
INSERT INTO dict_info VALUES ('141', 'RUSSIAN', '俄罗斯族', '1', '2', '1');
INSERT INTO dict_info VALUES ('142', 'SALAR', '撒拉族', '1', '2', '1');
INSERT INTO dict_info VALUES ('143', 'SHE', '畲族', '1', '2', '1');
INSERT INTO dict_info VALUES ('144', 'SHUI', '水族', '1', '2', '1');
INSERT INTO dict_info VALUES ('145', 'TAJIK', '塔吉克族', '1', '2', '1');
INSERT INTO dict_info VALUES ('146', 'TATAR', '塔塔尔族', '1', '2', '1');
INSERT INTO dict_info VALUES ('147', 'TU', '土族', '1', '2', '1');
INSERT INTO dict_info VALUES ('148', 'TUJIA', '土家族', '1', '2', '1');
INSERT INTO dict_info VALUES ('149', 'UYGUR', '维吾尔族', '1', '2', '1');
INSERT INTO dict_info VALUES ('150', 'VA', '佤族', '1', '2', '1');
INSERT INTO dict_info VALUES ('151', 'XIBE', '锡伯族', '1', '2', '1');
INSERT INTO dict_info VALUES ('152', 'YAO', '瑶族', '1', '2', '1');
INSERT INTO dict_info VALUES ('153', 'YI', '彝族', '1', '2', '1');
INSERT INTO dict_info VALUES ('154', 'YUGUR', '裕固族', '1', '2', '1');
INSERT INTO dict_info VALUES ('155', 'ZANG', '藏族', '1', '2', '1');
INSERT INTO dict_info VALUES ('156', 'ZHUANG', '壮族', '1', '2', '1');
INSERT INTO dict_info VALUES ('201', 'BEIJING', '北京', '1', '3', '1');
INSERT INTO dict_info VALUES ('202', 'TANGSHAN', '唐山', '1', '3', '1');

-- ----------------------------
-- Table structure for dict_schema
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS dict_schema';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dict_schema (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  TYPE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_DICT_SCHEMA_TYPE FOREIGN KEY (TYPE_ID) REFERENCES dict_type (ID)
) ;

CREATE INDEX FK_DICT_SCHEMA_TYPE ON dict_schema (TYPE_ID);

-- ----------------------------
-- Records of dict_schema
-- ----------------------------
INSERT INTO dict_schema VALUES ('1', '城市', null, '1', null, '3', '1');
INSERT INTO dict_schema VALUES ('2', '人员', null, '2', null, '3', '1');
INSERT INTO dict_schema VALUES ('3', '电话', null, '3', null, '3', '1');
INSERT INTO dict_schema VALUES ('4', '地址', null, '4', null, '3', '1');

-- ----------------------------
-- Table structure for dict_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS dict_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dict_type (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of dict_type
-- ----------------------------
INSERT INTO dict_type VALUES ('1', '省直辖市', 'string', null, '1');
INSERT INTO dict_type VALUES ('2', '民族', 'string', null, '1');
INSERT INTO dict_type VALUES ('3', '联系人', 'multiple', null, '1');

-- ----------------------------
-- Table structure for disk_acl
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS disk_acl';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE disk_acl (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  REF varchar2(64) DEFAULT NULL,
  SHARE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_DISK_ACL_SHARE FOREIGN KEY (SHARE_ID) REFERENCES disk_share (ID)
) ;

CREATE INDEX FK_DISK_ACL_SHARE ON disk_acl (SHARE_ID);

-- ----------------------------
-- Records of disk_acl
-- ----------------------------

-- ----------------------------
-- Table structure for disk_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS disk_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE disk_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(255) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  FILE_SIZE number(19) DEFAULT NULL,
  CREATOR varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  PREVIEW_STATUS varchar2(50) DEFAULT NULL,
  PREVIEW_REF varchar2(200) DEFAULT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  PARENT_PATH varchar2(200) DEFAULT NULL,
  DIR_TYPE number(10) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  LAST_MODIFIER varchar2(64) DEFAULT NULL,
  LAST_MODIFIED_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  EXPIRE_TIME timestamp(0) DEFAULT NULL,
  CHECKOUT_STATUS varchar2(50) DEFAULT NULL,
  FILE_VERSION varchar2(50) DEFAULT NULL,
  SECURITY_LEVEL varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_DISK_INFO_PARENT FOREIGN KEY (PARENT_ID) REFERENCES disk_info (ID)
) ;

CREATE INDEX FK_DISK_INFO_PARENT ON disk_info (PARENT_ID);

-- ----------------------------
-- Records of disk_info
-- ----------------------------

-- ----------------------------
-- Table structure for disk_share
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS disk_share';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE disk_share (
  ID number(19) NOT NULL,
  SHARE_TYPE varchar2(50) DEFAULT NULL,
  SHARE_TIME timestamp(0) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CREATOR varchar2(64) DEFAULT NULL,
  TYPE varchar2(64) DEFAULT NULL,
  DIR_TYPE number(10) DEFAULT NULL,
  COUNT_VIEW number(10) DEFAULT NULL,
  COUNT_SAVE number(10) DEFAULT NULL,
  COUNT_DOWNLOAD number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_DISK_SHARE_INFO FOREIGN KEY (INFO_ID) REFERENCES disk_info (ID)
) ;

CREATE INDEX FK_DISK_SHARE_INFO ON disk_share (INFO_ID);

-- ----------------------------
-- Records of disk_share
-- ----------------------------

-- ----------------------------
-- Table structure for employee_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS employee_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE employee_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  DEPARTMENT varchar2(50) DEFAULT NULL,
  COMPANY varchar2(50) DEFAULT NULL,
  POSITION varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of employee_info
-- ----------------------------

-- ----------------------------
-- Table structure for form_schema
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS form_schema';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE form_schema (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  READ_ONLY number(10) DEFAULT NULL,
  NOT_NULL number(10) DEFAULT NULL,
  UNIQUE_CONSTRAINT number(10) DEFAULT NULL,
  VALIDATOR varchar2(200) DEFAULT NULL,
  CONVERSION_PATTERN varchar2(200) DEFAULT NULL,
  MULTIPLE number(10) DEFAULT NULL,
  ENUMERATION_KEYS varchar2(200) DEFAULT NULL,
  ENUMERATION_VALUES varchar2(200) DEFAULT NULL,
  FORM_TEMPLATE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_FORM_SCHEMA_TEMPLATE FOREIGN KEY (FORM_TEMPLATE_ID) REFERENCES form_template (ID)
) ;

CREATE INDEX FK_FORM_SCHEMA_TEMPLATE ON form_schema (FORM_TEMPLATE_ID);

-- ----------------------------
-- Records of form_schema
-- ----------------------------

-- ----------------------------
-- Table structure for form_template
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS form_template';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE form_template (
  ID number(19) NOT NULL,
  TYPE number(10) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CONTENT clob,
  code varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of form_template
-- ----------------------------
INSERT INTO form_template VALUES ('515741702586368', '0', '申请单', '{rn	"code":"vacation-request",rn	"name":"申请单",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"申请单"rn	},{rn		"type":"grid",rn		"row":"4",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-2",rn			"minRow":2,rn			"minCol":2,rn			"maxRow":2,rn			"maxCol":3rn		},{rn			"startId":"3-2",rn			"minRow":3,rn			"minCol":2,rn			"maxRow":3,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"请假原因"rn		},{rn			"type":"textfield",rn			"row":0,rn			"col":1,rn			"name":"reason",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"请假类型"rn		},{rn			"type":"radio",rn			"row":1,rn			"col":1,rn			"name":"type",rn			"items":"倒休,事假,病假,婚假",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"开始时间"rn		},{rn			"type":"datepicker",rn			"row":2,rn			"col":1,rn			"name":"startDate",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"select",rn			"row":2,rn			"col":2,rn			"name":"startDateTime",rn			"items":"上午,下午",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":3,rn			"col":0,rn			"text":"结束时间"rn		},{rn			"type":"datepicker",rn			"row":3,rn			"col":1,rn			"name":"endDate",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"select",rn			"row":3,rn			"col":2,rn			"name":"endDateTime",rn			"items":"下午,上午",rn			"required":true,rn			"readOnly":falsern		}]rn	}]rn}rn', 'vacation-request', '1', null, null);
INSERT INTO form_template VALUES ('515741703405568', '0', '上级审批', '{rn	"code":"vacation-department",rn	"name":"上级审批",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"上级审批"rn	},{rn		"type":"grid",rn		"row":"5",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-2",rn			"minRow":2,rn			"minCol":2,rn			"maxRow":2,rn			"maxCol":3rn		},{rn			"startId":"3-2",rn			"minRow":3,rn			"minCol":2,rn			"maxRow":3,rn			"maxCol":3rn		},{rn			"startId":"4-1",rn			"minRow":4,rn			"minCol":1,rn			"maxRow":4,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"请假原因"rn		},{rn			"type":"textfield",rn			"row":0,rn			"col":1,rn			"name":"reason",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"请假类型"rn		},{rn			"type":"radio",rn			"row":1,rn			"col":1,rn			"name":"type",rn			"items":"倒休,事假,病假,婚假",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"开始时间"rn		},{rn			"type":"datepicker",rn			"row":2,rn			"col":1,rn			"name":"startDate",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"select",rn			"row":2,rn			"col":2,rn			"name":"startDateTime",rn			"items":"上午,下午",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":3,rn			"col":0,rn			"text":"结束时间"rn		},{rn			"type":"datepicker",rn			"row":3,rn			"col":1,rn			"name":"endDate",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"select",rn			"row":3,rn			"col":2,rn			"name":"endDateTime",rn			"items":"下午,上午",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":4,rn			"col":0,rn			"text":"部门经理意见"rn		},{rn			"type":"radio",rn			"row":4,rn			"col":1,rn			"name":"leaderComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":falsern		}]rn	}]rn}rn', 'vacation-department', '1', null, null);
INSERT INTO form_template VALUES ('515741704241152', '0', '人事审批', '{rn	"code":"vacation-hr",rn	"name":"人事审批",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"人事审批"rn	},{rn		"type":"grid",rn		"row":"6",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-2",rn			"minRow":2,rn			"minCol":2,rn			"maxRow":2,rn			"maxCol":3rn		},{rn			"startId":"3-2",rn			"minRow":3,rn			"minCol":2,rn			"maxRow":3,rn			"maxCol":3rn		},{rn			"startId":"4-1",rn			"minRow":4,rn			"minCol":1,rn			"maxRow":4,rn			"maxCol":3rn		},{rn			"startId":"5-1",rn			"minRow":5,rn			"minCol":1,rn			"maxRow":5,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"请假原因"rn		},{rn			"type":"textfield",rn			"row":0,rn			"col":1,rn			"name":"reason",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"请假类型"rn		},{rn			"type":"radio",rn			"row":1,rn			"col":1,rn			"name":"type",rn			"items":"倒休,事假,病假,婚假",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"开始时间"rn		},{rn			"type":"datepicker",rn			"row":2,rn			"col":1,rn			"name":"startDate",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"select",rn			"row":2,rn			"col":2,rn			"name":"startDateTime",rn			"items":"上午,下午",rn			"required":true,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":3,rn			"col":0,rn			"text":"结束时间"rn		},{rn			"type":"datepicker",rn			"row":3,rn			"col":1,rn			"name":"endDate",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"select",rn			"row":3,rn			"col":2,rn			"name":"endDateTime",rn			"items":"下午,上午",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":4,rn			"col":0,rn			"text":"部门经理意见"rn		},{rn			"type":"radio",rn			"row":4,rn			"col":1,rn			"name":"leaderComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":5,rn			"col":0,rn			"text":"人事意见"rn		},{rn			"type":"radio",rn			"row":5,rn			"col":1,rn			"name":"hrComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":falsern		}]rn	}]rn}rn', 'vacation-hr', '1', null, null);
INSERT INTO form_template VALUES ('515741705420800', '0', '调整申请', '{rn	"code":"vacation-modify",rn	"name":"调整申请",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"调整申请"rn	},{rn		"type":"grid",rn		"row":"7",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-2",rn			"minRow":2,rn			"minCol":2,rn			"maxRow":2,rn			"maxCol":3rn		},{rn			"startId":"3-2",rn			"minRow":3,rn			"minCol":2,rn			"maxRow":3,rn			"maxCol":3rn		},{rn			"startId":"4-1",rn			"minRow":4,rn			"minCol":1,rn			"maxRow":4,rn			"maxCol":3rn		},{rn			"startId":"5-1",rn			"minRow":5,rn			"minCol":1,rn			"maxRow":5,rn			"maxCol":3rn		},{rn			"startId":"6-1",rn			"minRow":6,rn			"minCol":1,rn			"maxRow":6,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"请假原因"rn		},{rn			"type":"textfield",rn			"row":0,rn			"col":1,rn			"name":"reason",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"请假类型"rn		},{rn			"type":"radio",rn			"row":1,rn			"col":1,rn			"name":"type",rn			"items":"倒休,事假,病假,婚假",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"开始时间"rn		},{rn			"type":"datepicker",rn			"row":2,rn			"col":1,rn			"name":"startDate",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"select",rn			"row":2,rn			"col":2,rn			"name":"startDateTime",rn			"items":"上午,下午",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":3,rn			"col":0,rn			"text":"结束时间"rn		},{rn			"type":"datepicker",rn			"row":3,rn			"col":1,rn			"name":"endDate",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"select",rn			"row":3,rn			"col":2,rn			"name":"endDateTime",rn			"items":"下午,上午",rn			"required":true,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":4,rn			"col":0,rn			"text":"部门经理意见"rn		},{rn			"type":"radio",rn			"row":4,rn			"col":1,rn			"name":"leaderComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":5,rn			"col":0,rn			"text":"人事意见"rn		},{rn			"type":"radio",rn			"row":5,rn			"col":1,rn			"name":"hrComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":6,rn			"col":0,rn			"text":"调整申请"rn		},{rn			"type":"radio",rn			"row":6,rn			"col":1,rn			"name":"initiatorComment",rn			"items":"重新申请,撤销申请",rn			"required":true,rn			"readOnly":falsern		}]rn	}]rn}rn', 'vacation-modify', '1', null, null);
INSERT INTO form_template VALUES ('515741706616832', '0', '销假', '{rn	"code":"vacation-finish",rn	"name":"销假",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"销假"rn	},{rn		"type":"grid",rn		"row":"6",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-2",rn			"minRow":2,rn			"minCol":2,rn			"maxRow":2,rn			"maxCol":3rn		},{rn			"startId":"3-2",rn			"minRow":3,rn			"minCol":2,rn			"maxRow":3,rn			"maxCol":3rn		},{rn			"startId":"4-1",rn			"minRow":4,rn			"minCol":1,rn			"maxRow":4,rn			"maxCol":3rn		},{rn			"startId":"5-1",rn			"minRow":5,rn			"minCol":1,rn			"maxRow":5,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"请假原因"rn		},{rn			"type":"textfield",rn			"row":0,rn			"col":1,rn			"name":"reason",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"请假类型"rn		},{rn			"type":"radio",rn			"row":1,rn			"col":1,rn			"name":"type",rn			"items":"倒休,事假,病假,婚假",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"开始时间"rn		},{rn			"type":"datepicker",rn			"row":2,rn			"col":1,rn			"name":"startDate",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"select",rn			"row":2,rn			"col":2,rn			"name":"startDateTime",rn			"items":"上午,下午",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":3,rn			"col":0,rn			"text":"结束时间"rn		},{rn			"type":"datepicker",rn			"row":3,rn			"col":1,rn			"name":"endDate",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"select",rn			"row":3,rn			"col":2,rn			"name":"endDateTime",rn			"items":"下午,上午",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":4,rn			"col":0,rn			"text":"部门经理意见"rn		},{rn			"type":"radio",rn			"row":4,rn			"col":1,rn			"name":"leaderComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":5,rn			"col":0,rn			"text":"人事意见"rn		},{rn			"type":"radio",rn			"row":5,rn			"col":1,rn			"name":"hrComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":truern		}]rn	}]rn}rn', 'vacation-finish', '1', null, null);
INSERT INTO form_template VALUES ('515741707780096', '0', '发文', '{rn	"code":"publish-request",rn	"name":"发文",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"发文"rn	},{rn		"type":"grid",rn		"row":"3",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-1",rn			"minRow":2,rn			"minCol":1,rn			"maxRow":2,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"标题"rn		},{rn			"type":"textfield",rn			"row":0,"col":1,rn			"name":"title",rn			"required":false,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"内容"rn		},{rn			"type":"textarea",rn			"row":2,rn			"col":1,rn			"name":"content",rn			"required":false,rn			"readOnly":falsern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"拟稿审批"rn		},{rn			"type":"userpicker",rn			"row":1,rn			"col":1,rn			"name":"countersignUsers",rn			"required":false,rn			"readOnly":falsern		}]rn	}]rn}rn	', 'publish-request', '1', null, null);
INSERT INTO form_template VALUES ('515741708517376', '0', '经理审批', '{rn	"code":"publish-manager",rn	"name":"经理审批",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"经理审批"rn	},{rn		"type":"grid",rn		"row":"3",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-1",rn			"minRow":2,rn			"minCol":1,rn			"maxRow":2,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"标题"rn		},{rn			"type":"textfield",rn			"row":0,"col":1,rn			"name":"title",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"内容"rn		},{rn			"type":"textarea",rn			"row":1,rn			"col":1,rn			"name":"content",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"部门经理意见"rn		},{rn			"type":"radio",rn			"row":2,rn			"col":1,rn			"name":"leaderComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":falsern		}]rn	}]rn}rn', 'publish-manager', '1', null, null);
INSERT INTO form_template VALUES ('515741709189120', '0', '会签审批', '{rn	"code":"publish-countersign",rn	"name":"会签审批",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"会签审批"rn	},{rn		"type":"grid",rn		"row":"3",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-1",rn			"minRow":2,rn			"minCol":1,rn			"maxRow":2,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"标题"rn		},{rn			"type":"textfield",rn			"row":0,"col":1,rn			"name":"title",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"内容"rn		},{rn			"type":"textarea",rn			"row":1,rn			"col":1,rn			"name":"content",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"审批意见"rn		},{rn			"type":"radio",rn			"row":2,rn			"col":1,rn			"name":"countersignComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":falsern		}]rn	}]rn}rn', 'publish-countersign', '1', null, null);
INSERT INTO form_template VALUES ('515741709942784', '0', '归档', '{rn	"code":"publish-finish",rn	"name":"归档",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"归档"rn	},{rn		"type":"grid",rn		"row":"2",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"标题"rn		},{rn			"type":"textfield",rn			"row":0,"col":1,rn			"name":"title",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"内容"rn		},{rn			"type":"textarea",rn			"row":1,rn			"col":1,rn			"name":"content",rn			"required":false,rn			"readOnly":truern		}]rn	}]rn}rn', 'publish-finish', '1', null, null);
INSERT INTO form_template VALUES ('515741712400384', '0', '发起申请', '{rn	"code":"permission-request",rn	"name":"发起申请",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"发起申请"rn	},{rn		"type":"grid",rn		"row":"1",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"申请"rn		},{rn			"type":"textfield",rn			"row":0,rn			"col":1,rn			"name":"name",rn			"required":false,rn			"readOnly":falsern		}]rn	}]rn}rn', 'permission-request', '1', null, null);
INSERT INTO form_template VALUES ('515741713645568', '0', '经理审批', '{rn	"code":"permission-department",rn	"name":"经理审批",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"经理审批"rn	},{rn		"type":"grid",rn		"row":"2",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"申请"rn		},{rn			"type":"textfield",rn			"row":0,rn			"col":1,rn			"name":"name",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"经理审批意见"rn		},{rn			"type":"radio",rn			"row":1,rn			"col":1,rn			"name":"managerComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":falsern		}]rn	}]rn}rn', 'permission-department', '1', null, null);
INSERT INTO form_template VALUES ('515741715595264', '0', '总经理审批', '{rn	"code":"permission-manager",rn	"name":"总经理审批",rn	"sections":[{rn		"type":"text",rn		"tag":"h1",rn		"text":"总经理审批"rn	},{rn		"type":"grid",rn		"row":"3",rn		"col":"4",rn		"merge":[{rn			"startId":"0-1",rn			"minRow":0,rn			"minCol":1,rn			"maxRow":0,rn			"maxCol":3rn		},{rn			"startId":"1-1",rn			"minRow":1,rn			"minCol":1,rn			"maxRow":1,rn			"maxCol":3rn		},{rn			"startId":"2-1",rn			"minRow":2,rn			"minCol":1,rn			"maxRow":2,rn			"maxCol":3rn		}],rn		"fields":[{rn			"type":"label",rn			"row":0,rn			"col":0,rn			"text":"申请"rn		},{rn			"type":"textfield",rn			"row":0,rn			"col":1,rn			"name":"name",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":1,rn			"col":0,rn			"text":"经理审批意见"rn		},{rn			"type":"radio",rn			"row":1,rn			"col":1,rn			"name":"managerComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":truern		},{rn			"type":"label",rn			"row":2,rn			"col":0,rn			"text":"总经理审批意见"rn		},{rn			"type":"radio",rn			"row":2,rn			"col":1,rn			"name":"leaderComment",rn			"items":"同意,不同意",rn			"required":false,rn			"readOnly":falsern		}]rn	}]rn}rn', 'permission-manager', '1', null, null);

-- ----------------------------
-- Table structure for gather_condition
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS gather_condition';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE gather_condition (
  id number(19) DEFAULT '0' NOT NULL,
  column_name varchar2(255) DEFAULT NULL,
  condition_ varchar2(255) DEFAULT NULL,
  value_ varchar2(255) DEFAULT NULL,
  relation_ varchar2(255) DEFAULT NULL,
  gather_object_id number(19) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

-- ----------------------------
-- Records of gather_condition
-- ----------------------------

-- ----------------------------
-- Table structure for gather_object
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS gather_object';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE gather_object (
  id number(19) NOT NULL ,
  name varchar2(255) DEFAULT NULL ,
  comment varchar2(255) DEFAULT NULL ,
  gather_source_id number(19) DEFAULT NULL ,
  db_table_name varchar2(255) DEFAULT NULL ,
  sql_ varchar2(4000) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

-- ----------------------------
-- Records of gather_object
-- ----------------------------

-- ----------------------------
-- Table structure for gather_plan
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS gather_plan';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE gather_plan (
  id number(19) NOT NULL,
  name varchar2(255) DEFAULT NULL,
  task_num number(10) DEFAULT NULL,
  orders number(10) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

-- ----------------------------
-- Records of gather_plan
-- ----------------------------

-- ----------------------------
-- Table structure for gather_plan_task
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS gather_plan_task';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE gather_plan_task (
  id number(19) NOT NULL,
  name varchar2(255) DEFAULT NULL,
  gather_target_id number(19) DEFAULT NULL,
  gather_object_id number(19) DEFAULT NULL,
  frequency varchar2(255) DEFAULT NULL,
  orders number(10) DEFAULT NULL,
  gather_plan_id number(19) DEFAULT NULL,
  sql_ varchar2(4000) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

-- ----------------------------
-- Records of gather_plan_task
-- ----------------------------

-- ----------------------------
-- Table structure for gather_source
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS gather_source';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE gather_source (
  id number(19) NOT NULL ,
  name varchar2(255) DEFAULT NULL ,
  ip varchar2(255) DEFAULT NULL ,
  db_type number(10) DEFAULT NULL ,
  db_user varchar2(255) DEFAULT NULL ,
  db_password varchar2(255) DEFAULT NULL ,
  db_port varchar2(20) DEFAULT NULL ,
  db_sid varchar2(255) DEFAULT NULL ,
  status number(10) DEFAULT NULL ,
  PRIMARY KEY (id)
)  ;

-- ----------------------------
-- Records of gather_source
-- ----------------------------

-- ----------------------------
-- Table structure for gather_target
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS gather_target';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE gather_target (
  id number(19) NOT NULL,
  name varchar2(255) DEFAULT NULL,
  table_name varchar2(255) DEFAULT NULL,
  sql_ varchar2(4000) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

-- ----------------------------
-- Records of gather_target
-- ----------------------------

-- ----------------------------
-- Table structure for gather_target_column
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS gather_target_column';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE gather_target_column (
  id number(19) NOT NULL,
  name varchar2(255) DEFAULT NULL,
  table_name varchar2(255) DEFAULT NULL,
  gather_target_id number(19) DEFAULT NULL,
  type varchar2(255) DEFAULT NULL,
  key_ number(10) DEFAULT NULL check (key_ > 0) zerofill,
  nill number(10) DEFAULT NULL check (nill > 0) zerofill,
  PRIMARY KEY (id)
)  ;

-- ----------------------------
-- Records of gather_target_column
-- ----------------------------

-- ----------------------------
-- Table structure for group_admin
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS group_admin';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE group_admin (
  ID number(19) NOT NULL,
  INFO_ID number(19) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_GROUP_ADIMN_INFO FOREIGN KEY (INFO_ID) REFERENCES group_info (ID)
) ;

CREATE INDEX FK_GROUP_ADIMN_INFO ON group_admin (INFO_ID);

-- ----------------------------
-- Records of group_admin
-- ----------------------------
INSERT INTO group_admin VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for group_alias
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS group_alias';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE group_alias (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  CATALOG varchar2(100) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_GROUP_ALIAS_INFO FOREIGN KEY (INFO_ID) REFERENCES group_info (ID)
) ;

CREATE INDEX FK_GROUP_ALIAS_INFO ON group_alias (INFO_ID);

-- ----------------------------
-- Records of group_alias
-- ----------------------------

-- ----------------------------
-- Table structure for group_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS group_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE group_info (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(50) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  MEMBER_COUNT number(10) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  TYPE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_GROUP_INFO_TYPE FOREIGN KEY (TYPE_ID) REFERENCES group_type (ID)
) ;

CREATE INDEX FK_GROUP_INFO_TYPE ON group_info (TYPE_ID);

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO group_info VALUES ('1', null, '全体成员', null, null, '8', null, null, '1');

-- ----------------------------
-- Table structure for group_member
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS group_member';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE group_member (
  ID number(19) NOT NULL,
  INFO_ID number(19) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_GROUP_MEMBER_INFO FOREIGN KEY (INFO_ID) REFERENCES group_info (ID)
) ;

CREATE INDEX FK_GROUP_MEMBER_INFO ON group_member (INFO_ID);

-- ----------------------------
-- Records of group_member
-- ----------------------------
INSERT INTO group_member VALUES ('1', '1', '1', '1');
INSERT INTO group_member VALUES ('2', '1', '2', '1');
INSERT INTO group_member VALUES ('3', '1', '3', '1');
INSERT INTO group_member VALUES ('4', '1', '4', '1');
INSERT INTO group_member VALUES ('5', '1', '5', '1');
INSERT INTO group_member VALUES ('6', '1', '6', '1');
INSERT INTO group_member VALUES ('7', '1', '7', '1');
INSERT INTO group_member VALUES ('8', '1', '8', '1');

-- ----------------------------
-- Table structure for group_relation
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS group_relation';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE group_relation (
  ID number(19) NOT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  CHILD_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_GROUP_RELATION_CHILD FOREIGN KEY (CHILD_ID) REFERENCES group_info (ID),
  CONSTRAINT FK_GROUP_RELATION_PARENT FOREIGN KEY (PARENT_ID) REFERENCES group_info (ID)
) ;

CREATE INDEX FK_GROUP_RELATION_PARENT ON group_relation (PARENT_ID);
CREATE INDEX FK_GROUP_RELATION_CHILD ON group_relation (CHILD_ID);

-- ----------------------------
-- Records of group_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS group_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE group_type (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of group_type
-- ----------------------------
INSERT INTO group_type VALUES ('1', 'default', '1');

-- ----------------------------
-- Table structure for ht_humantask
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS ht_humantask';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE ht_humantask (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  ASSIGNEE varchar2(64) DEFAULT NULL,
  OWNER varchar2(64) DEFAULT NULL,
  DELEGATE_STATUS varchar2(50) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  DURATION varchar2(50) DEFAULT NULL,
  SUSPEND_STATUS varchar2(50) DEFAULT NULL,
  CATEGORY varchar2(50) DEFAULT NULL,
  CODE varchar2(200) DEFAULT NULL,
  FORM varchar2(200) DEFAULT NULL,
  TASK_ID varchar2(200) DEFAULT NULL,
  EXECUTION_ID varchar2(200) DEFAULT NULL,
  PROCESS_INSTANCE_ID varchar2(200) DEFAULT NULL,
  PROCESS_DEFINITION_ID varchar2(200) DEFAULT NULL,
  TENENT_ID varchar2(64) DEFAULT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  COMPLETE_TIME timestamp(0) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_HT_HUMANTASK_PARENT FOREIGN KEY (PARENT_ID) REFERENCES ht_humantask (ID)
) ;

CREATE INDEX FK_HT_HUMANTASK_PARENT ON ht_humantask (PARENT_ID);

-- ----------------------------
-- Records of ht_humantask
-- ----------------------------

-- ----------------------------
-- Table structure for ht_participant
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS ht_participant';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE ht_participant (
  ID number(19) NOT NULL,
  CATEGORY varchar2(200) DEFAULT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  HUMANTASK_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_HT_PARTICIPANT_HUMANTASK FOREIGN KEY (HUMANTASK_ID) REFERENCES ht_humantask (ID)
) ;

CREATE INDEX FK_HT_PARTICIPANT_HUMANTASK ON ht_participant (HUMANTASK_ID);

-- ----------------------------
-- Records of ht_participant
-- ----------------------------

-- ----------------------------
-- Table structure for javamail_attachment
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS javamail_attachment';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE javamail_attachment (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  MESSAGE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_JAVAMAIL_ATTACHMENT_MESSAGE FOREIGN KEY (MESSAGE_ID) REFERENCES javamail_message (ID)
) ;

CREATE INDEX FK_JAVAMAIL_ATTACHMENT_MESSAGE ON javamail_attachment (MESSAGE_ID);

-- ----------------------------
-- Records of javamail_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for javamail_config
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS javamail_config';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE javamail_config (
  ID number(19) NOT NULL,
  USERNAME varchar2(200) DEFAULT NULL,
  PASSWORD varchar2(200) DEFAULT NULL,
  RECEIVE_TYPE varchar2(50) DEFAULT NULL,
  RECEIVE_HOST varchar2(200) DEFAULT NULL,
  RECEIVE_PORT varchar2(10) DEFAULT NULL,
  RECEIVE_SECURE varchar2(50) DEFAULT NULL,
  SEND_TYPE varchar2(50) DEFAULT NULL,
  SEND_HOST varchar2(50) DEFAULT NULL,
  SEND_PORT varchar2(10) DEFAULT NULL,
  SEND_SECURE varchar2(50) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of javamail_config
-- ----------------------------
INSERT INTO javamail_config VALUES ('1', 'lingo@mossle.com', '~lemon2mossle', 'pop3', 'mail.mossle.com', '995', 'ssl-all', 'smtp', 'mail.mossle.com', '465', 'ssl-all', '1', '1');

-- ----------------------------
-- Table structure for javamail_message
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS javamail_message';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE javamail_message (
  ID number(19) NOT NULL,
  SENDER varchar2(200) DEFAULT NULL,
  RECEIVER varchar2(200) DEFAULT NULL,
  CC varchar2(200) DEFAULT NULL,
  BCC varchar2(200) DEFAULT NULL,
  SUBJECT clob,
  CONTENT clob,
  SEND_TIME timestamp(0) DEFAULT NULL,
  RECEIVE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  FOLDER varchar2(200) DEFAULT NULL,
  MESSAGE_ID varchar2(200) DEFAULT NULL,
  MESSAGE_NUMBER number(10) DEFAULT NULL,
  CONFIG_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_JAVAMAIL_MESSAGE_CONFIG FOREIGN KEY (CONFIG_ID) REFERENCES javamail_config (ID)
) ;

CREATE INDEX FK_JAVAMAIL_MESSAGE_CONFIG ON javamail_message (CONFIG_ID);

-- ----------------------------
-- Records of javamail_message
-- ----------------------------

-- ----------------------------
-- Table structure for job_grade
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS job_grade';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE job_grade (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of job_grade
-- ----------------------------
INSERT INTO job_grade VALUES ('1', 'A', '1', '1');
INSERT INTO job_grade VALUES ('2', 'B', '1', '2');

-- ----------------------------
-- Table structure for job_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS job_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE job_info (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  LEVEL_ID number(19) DEFAULT NULL,
  TYPE_ID number(19) DEFAULT NULL,
  TITLE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_JOB_INFO_LEVEL FOREIGN KEY (LEVEL_ID) REFERENCES job_level (ID),
  CONSTRAINT FK_JOB_INFO_TITLE FOREIGN KEY (TITLE_ID) REFERENCES job_title (ID),
  CONSTRAINT FK_JOB_INFO_TYPE FOREIGN KEY (TYPE_ID) REFERENCES job_type (ID)
) ;

CREATE INDEX FK_JOB_INFO_LEVEL ON job_info (LEVEL_ID);
CREATE INDEX FK_JOB_INFO_TYPE ON job_info (TYPE_ID);
CREATE INDEX FK_JOB_INFO_TITLE ON job_info (TITLE_ID);

-- ----------------------------
-- Records of job_info
-- ----------------------------
INSERT INTO job_info VALUES ('1', null, '1', '1', '1', '1');
INSERT INTO job_info VALUES ('2', null, '2', '2', '2', '1');

-- ----------------------------
-- Table structure for job_level
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS job_level';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE job_level (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  GRADE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_JOB_LEVEL_GRADE FOREIGN KEY (GRADE_ID) REFERENCES job_grade (ID)
) ;

CREATE INDEX FK_JOB_LEVEL_GRADE ON job_level (GRADE_ID);

-- ----------------------------
-- Records of job_level
-- ----------------------------
INSERT INTO job_level VALUES ('1', '3', '1', '1', '1');
INSERT INTO job_level VALUES ('2', '2', '2', '1', '2');
INSERT INTO job_level VALUES ('3', '1', '2', '1', '3');

-- ----------------------------
-- Table structure for job_title
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS job_title';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE job_title (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of job_title
-- ----------------------------
INSERT INTO job_title VALUES ('1', '总经理', '1');
INSERT INTO job_title VALUES ('2', '部门经理', '1');

-- ----------------------------
-- Table structure for job_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS job_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE job_type (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_JOB_TYPE_PARENT FOREIGN KEY (PARENT_ID) REFERENCES job_type (ID)
) ;

CREATE INDEX FK_JOB_TYPE_PARENT ON job_type (PARENT_ID);

-- ----------------------------
-- Records of job_type
-- ----------------------------
INSERT INTO job_type VALUES ('1', '决策管理类', null, '1');
INSERT INTO job_type VALUES ('2', '技术类', null, '2');

-- ----------------------------
-- Table structure for job_user
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS job_user';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE job_user (
  ID number(19) NOT NULL,
  USER_REF varchar2(50) DEFAULT NULL,
  JOB_INFO_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_JOB_USER_JOB FOREIGN KEY (JOB_INFO_ID) REFERENCES job_info (ID)
) ;

CREATE INDEX FK_JOB_USER_JOB ON job_user (JOB_INFO_ID);

-- ----------------------------
-- Records of job_user
-- ----------------------------
INSERT INTO job_user VALUES ('1', '5', '1', '1');
INSERT INTO job_user VALUES ('2', '3', '2', '1');
INSERT INTO job_user VALUES ('3', '4', '2', '1');

-- ----------------------------
-- Table structure for kpi
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS kpi';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE kpi (
  id number(19) NOT NULL,
  name varchar2(255) DEFAULT NULL,
  comments varchar2(255) DEFAULT NULL,
  type number(10) DEFAULT NULL,
  ne_id number(19) DEFAULT NULL,
  PRIMARY KEY (id)
) ;

-- ----------------------------
-- Records of kpi
-- ----------------------------

-- ----------------------------
-- Table structure for kv_prop
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS kv_prop';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE kv_prop (
  ID number(19) NOT NULL,
  CODE varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  RECORD_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_KV_PROP_RECORD FOREIGN KEY (RECORD_ID) REFERENCES kv_record (ID)
) ;

CREATE INDEX FK_KV_PROP_RECORD ON kv_prop (RECORD_ID);

-- ----------------------------
-- Records of kv_prop
-- ----------------------------
INSERT INTO kv_prop VALUES ('518056695414784', 'xtmc', '0', '啊', null, '518056693776384');
INSERT INTO kv_prop VALUES ('518056695693312', 'xtsm', '0', '啊', null, '518056693776384');
INSERT INTO kv_prop VALUES ('518056873492480', 'mkmc', '0', '吧', null, '518056873115648');
INSERT INTO kv_prop VALUES ('518056874852352', 'mksm', '0', '吧', null, '518056873115648');
INSERT INTO kv_prop VALUES ('519778111782912', 'yjdz', '0', '192.168.1.1', null, '519778111700992');
INSERT INTO kv_prop VALUES ('519778112012288', 'yjmc', '0', '硬盘', null, '519778111700992');
INSERT INTO kv_prop VALUES ('519778112012289', 'yjsm', '0', '硬盘', null, '519778111700992');
INSERT INTO kv_prop VALUES ('520015235153920', 'xtmc', '0', 'a', null, '520015234596864');
INSERT INTO kv_prop VALUES ('520015236530176', 'xtsm', '0', 'a', null, '520015234596864');
INSERT INTO kv_prop VALUES ('521196011487232', 'xtmc', '0', 'cc', null, '521196011388928');
INSERT INTO kv_prop VALUES ('521196011732992', 'xtsm', '0', 'cc', null, '521196011388928');
INSERT INTO kv_prop VALUES ('521197343178752', 'xtmc', '0', 'dd', null, '521197342736384');
INSERT INTO kv_prop VALUES ('521197345751040', 'xtsm', '0', 'dd', null, '521197342736384');
INSERT INTO kv_prop VALUES ('521218757558272', 'rjmc', '0', 'sdf ', null, '521218757263360');
INSERT INTO kv_prop VALUES ('521218757591040', 'rjsm', '0', 'sdf', null, '521218757263360');
INSERT INTO kv_prop VALUES ('521223598850048', 'jszxx', '0', 'dfasdf', null, '521223598587904');
INSERT INTO kv_prop VALUES ('521223600226304', 'nmgxx', '0', 'asdfa', null, '521223598587904');
INSERT INTO kv_prop VALUES ('521223600259072', 'zsgz', '0', 'asdf ', null, '521223598587904');
INSERT INTO kv_prop VALUES ('521223600472064', 'zsxd', '0', 'asdf ', null, '521223598587904');
INSERT INTO kv_prop VALUES ('521225456992256', 'xtmc', '0', 'asdf', null, '521225456713728');
INSERT INTO kv_prop VALUES ('521225457025024', 'xtsm', '0', 'asdf', null, '521225456713728');
INSERT INTO kv_prop VALUES ('521237973663744', 'xtmc', '0', 'dfs', null, '521237973336064');
INSERT INTO kv_prop VALUES ('521237973696512', 'xtsm', '0', 'dfasdf', null, '521237973336064');
INSERT INTO kv_prop VALUES ('521243685683200', 'xtmc', '0', '阿萨德飞', null, '521243685421056');
INSERT INTO kv_prop VALUES ('521243687272448', 'xtsm', '0', ' 撒的飞', null, '521243685421056');
INSERT INTO kv_prop VALUES ('521255926185984', 'xtmc', '0', '地方阿桑', null, '521255925923840');
INSERT INTO kv_prop VALUES ('521255926202368', 'xtsm', '0', '阿萨德', null, '521255925923840');
INSERT INTO kv_prop VALUES ('521260337348608', 'xtmc', '0', 'asdf', null, '521260337168384');
INSERT INTO kv_prop VALUES ('521260337364992', 'xtsm', '0', 'sadf', null, '521260337168384');

-- ----------------------------
-- Table structure for kv_record
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS kv_record';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE kv_record (
  ID number(19) NOT NULL,
  CATEGORY varchar2(200) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  NAME varchar2(100) DEFAULT NULL,
  FORM_TEMPLATE_CODE varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of kv_record
-- ----------------------------
INSERT INTO kv_record VALUES ('518056693776384', null, '0', '518056693547008', null, null, null, null, null);
INSERT INTO kv_record VALUES ('518056873115648', null, '0', '518056873099264', null, null, null, null, null);
INSERT INTO kv_record VALUES ('519778111700992', null, '0', '519778111651840', null, null, null, null, null);
INSERT INTO kv_record VALUES ('520015234596864', null, '0', '520015234465792', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521196011388928', null, '0', '521196011372544', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521197342736384', null, '0', '521197342670848', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521218757263360', null, '0', '521218757181440', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521223598587904', null, '0', '521223598522368', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521225456713728', null, '0', '521225456631808', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521237973336064', null, '0', '521237973204992', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521243685421056', null, '0', '521243685322752', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521255925923840', null, '0', '521255925874688', null, null, null, null, null);
INSERT INTO kv_record VALUES ('521260337168384', null, '0', '521260337119232', null, null, null, null, null);

-- ----------------------------
-- Table structure for leave_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS leave_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE leave_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT NULL,
  END_TIME timestamp(0) DEFAULT NULL,
  EMPLOYEE_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of leave_info
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_attendee
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS meeting_attendee';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE meeting_attendee (
  ID number(19) NOT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_MEETING_ATTENDEE_INFO FOREIGN KEY (INFO_ID) REFERENCES meeting_info (ID)
) ;

CREATE INDEX FK_MEETING_ATTENDEE_INFO ON meeting_attendee (INFO_ID);

-- ----------------------------
-- Records of meeting_attendee
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS meeting_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE meeting_info (
  ID number(19) NOT NULL,
  SUBJECT varchar2(200) DEFAULT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  END_TIME timestamp(0) DEFAULT '0000-00-00 00:00:00' NOT NULL,
  ORGANIZER varchar2(64) DEFAULT NULL,
  MEETING_TIMEZONE varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  CATALOG varchar2(50) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  MEETING_ROOM_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_MEETING_INFO_ROOM FOREIGN KEY (MEETING_ROOM_ID) REFERENCES meeting_room (ID)
) ;

CREATE INDEX FK_MEETING_INFO_ROOM ON meeting_info (MEETING_ROOM_ID);

-- ----------------------------
-- Records of meeting_info
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_item
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS meeting_item';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE meeting_item (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_MEETING_ITEM_INFO FOREIGN KEY (INFO_ID) REFERENCES meeting_info (ID)
) ;

CREATE INDEX FK_MEETING_ITEM_INFO ON meeting_item (INFO_ID);

-- ----------------------------
-- Records of meeting_item
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_room
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS meeting_room';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE meeting_room (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  MAP_REF varchar2(200) DEFAULT NULL,
  NUM number(10) DEFAULT NULL,
  PROJECTOR varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT NULL,
  END_TIME timestamp(0) DEFAULT NULL,
  BUILDING varchar2(200) DEFAULT NULL,
  FLOOR varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of meeting_room
-- ----------------------------

-- ----------------------------
-- Table structure for model_field
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS model_field';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE model_field (
  ID number(19) NOT NULL,
  CODE varchar2(200) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  SEARCHABLE varchar2(10) DEFAULT NULL,
  DISPLAYABLE varchar2(10) DEFAULT NULL,
  VIEW_LIST varchar2(10) DEFAULT NULL,
  VIEW_FORM varchar2(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_MODEL_FIELD_INFO FOREIGN KEY (INFO_ID) REFERENCES model_info (ID)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE model_field_seq START WITH 515741742219265 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER model_field_seq_tr
 BEFORE INSERT ON model_field FOR EACH ROW
 WHEN (NEW.ID IS NULL)
BEGIN
 SELECT model_field_seq.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

CREATE INDEX FK_MODEL_FIELD_INFO ON model_field (INFO_ID);

-- ----------------------------
-- Records of model_field
-- ----------------------------
INSERT INTO model_field VALUES ('515741721411584', 'managerComment', 'managerComment', 'radio', null, 'true', 'true', 'true', 'true', '1', '515741719134208');
INSERT INTO model_field VALUES ('515741722165248', 'leaderComment', 'leaderComment', 'radio', null, 'true', 'true', 'true', 'true', '1', '515741719134208');
INSERT INTO model_field VALUES ('515741723607040', 'name', 'name', 'textfield', null, 'true', 'true', 'true', 'true', '1', '515741719134208');
INSERT INTO model_field VALUES ('515741727424512', 'content', 'content', 'textarea', null, 'true', 'true', 'true', 'true', '1', '515741724852224');
INSERT INTO model_field VALUES ('515741728194560', 'title', 'title', 'textfield', null, 'true', 'true', 'true', 'true', '1', '515741724852224');
INSERT INTO model_field VALUES ('515741729472512', 'leaderComment', 'leaderComment', 'radio', null, 'true', 'true', 'true', 'true', '1', '515741724852224');
INSERT INTO model_field VALUES ('515741730455552', 'countersignUsers', 'countersignUsers', 'userpicker', null, 'true', 'true', 'true', 'true', '1', '515741724852224');
INSERT INTO model_field VALUES ('515741731438592', 'countersignComment', 'countersignComment', 'radio', null, 'true', 'true', 'true', 'true', '1', '515741724852224');
INSERT INTO model_field VALUES ('515741735075840', 'startDate', 'startDate', 'datepicker', null, 'true', 'true', 'true', 'true', '1', '515741732487168');
INSERT INTO model_field VALUES ('515741735944192', 'startDateTime', 'startDateTime', 'select', null, 'true', 'true', 'true', 'true', '1', '515741732487168');
INSERT INTO model_field VALUES ('515741737009152', 'reason', 'reason', 'textfield', null, 'true', 'true', 'true', 'true', '1', '515741732487168');
INSERT INTO model_field VALUES ('515741737910272', 'leaderComment', 'leaderComment', 'radio', null, 'true', 'true', 'true', 'true', '1', '515741732487168');
INSERT INTO model_field VALUES ('515741738745856', 'hrComment', 'hrComment', 'radio', null, 'true', 'true', 'true', 'true', '1', '515741732487168');
INSERT INTO model_field VALUES ('515741739696128', 'endDate', 'endDate', 'datepicker', null, 'true', 'true', 'true', 'true', '1', '515741732487168');
INSERT INTO model_field VALUES ('515741740515328', 'type', 'type', 'radio', null, 'true', 'true', 'true', 'true', '1', '515741732487168');
INSERT INTO model_field VALUES ('515741741203456', 'endDateTime', 'endDateTime', 'select', null, 'true', 'true', 'true', 'true', '1', '515741732487168');
INSERT INTO model_field VALUES ('515741742219264', 'initiatorComment', 'initiatorComment', 'radio', null, 'true', 'true', 'true', 'true', '1', '515741732487168');

-- ----------------------------
-- Table structure for model_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS model_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE model_info (
  ID number(19) NOT NULL,
  CODE varchar2(200) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE model_info_seq START WITH 515741732487169 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER model_info_seq_tr
 BEFORE INSERT ON model_info FOR EACH ROW
 WHEN (NEW.ID IS NULL)
BEGIN
 SELECT model_info_seq.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

-- ----------------------------
-- Records of model_info
-- ----------------------------
INSERT INTO model_info VALUES ('515741719134208', 'permission:1:4', '审批权限', null, '1');
INSERT INTO model_info VALUES ('515741724852224', 'publish:1:8', '公文发布', null, '1');
INSERT INTO model_info VALUES ('515741732487168', 'vacation:1:12', '请假流程', null, '1');

-- ----------------------------
-- Table structure for msg_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS msg_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE msg_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CONTENT clob,
  TYPE number(10) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  SENDER_ID varchar2(64) DEFAULT NULL,
  RECEIVER_ID varchar2(64) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  DATA varchar2(255) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE msg_info_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER msg_info_seq_tr
 BEFORE INSERT ON msg_info FOR EACH ROW
 WHEN (NEW.ID IS NULL)
BEGIN
 SELECT msg_info_seq.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

-- ----------------------------
-- Records of msg_info
-- ----------------------------

-- ----------------------------
-- Table structure for ne_detail
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS ne_detail';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE ne_detail (
  id number(19) NOT NULL,
  ne_id number(19) DEFAULT NULL ,
  name varchar2(255) DEFAULT NULL,
  value varchar2(255) DEFAULT NULL,
  orders number(10) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id UNIQUE  (id)
)  ;

CREATE INDEX ne_id ON ne_detail (ne_id);

-- ----------------------------
-- Records of ne_detail
-- ----------------------------

-- ----------------------------
-- Table structure for ne_template
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS ne_template';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE ne_template (
  id number(19) NOT NULL,
  name varchar2(255) DEFAULT NULL,
  parent_id number(19) DEFAULT NULL,
  type number(10) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id UNIQUE  (id)
)  ;

CREATE INDEX parent_id ON ne_template (parent_id);

-- ----------------------------
-- Records of ne_template
-- ----------------------------
INSERT INTO ne_template VALUES ('1', '系统', null, '1');
INSERT INTO ne_template VALUES ('2', '模块', '1', '1');
INSERT INTO ne_template VALUES ('3', '业务功能', '2', '1');
INSERT INTO ne_template VALUES ('4', '网络硬件', '2', '1');
INSERT INTO ne_template VALUES ('5', '应用软件', '2', '1');
INSERT INTO ne_template VALUES ('6', '业务流程', '2', '1');
INSERT INTO ne_template VALUES ('7', '数据对接', '2', '1');
INSERT INTO ne_template VALUES ('8', '招生政策', '3', '1');
INSERT INTO ne_template VALUES ('9', '民办报名', '3', '1');
INSERT INTO ne_template VALUES ('10', '主机', '4', '1');
INSERT INTO ne_template VALUES ('11', '负载均衡', '4', '1');
INSERT INTO ne_template VALUES ('12', 'CDN', '4', '1');
INSERT INTO ne_template VALUES ('13', 'VmWare', '4', '1');
INSERT INTO ne_template VALUES ('14', '幼升小', '6', '1');
INSERT INTO ne_template VALUES ('15', '小升初', '6', '1');

-- ----------------------------
-- Table structure for ne_template_detail
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS ne_template_detail';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE ne_template_detail (
  id number(19) NOT NULL,
  name varchar2(255) DEFAULT NULL,
  type number(10) DEFAULT NULL,
  orders number(10) DEFAULT NULL,
  ne_template_id number(19) DEFAULT NULL,
  code_ varchar2(255) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id UNIQUE  (id)
)  ;

CREATE INDEX ne_template_id ON ne_template_detail (ne_template_id);

-- ----------------------------
-- Records of ne_template_detail
-- ----------------------------
INSERT INTO ne_template_detail VALUES ('1', '系统名称', '1', '1', '1', 'xtmc');
INSERT INTO ne_template_detail VALUES ('2', '系统说明', '1', '2', '1', 'xtsm');
INSERT INTO ne_template_detail VALUES ('3', '模块名称', '1', '1', '2', 'mkmc');
INSERT INTO ne_template_detail VALUES ('4', '模块说明', '1', '2', '2', 'mksm');
INSERT INTO ne_template_detail VALUES ('5', '功能名称', '1', '1', '3', 'gnmc');
INSERT INTO ne_template_detail VALUES ('6', '功能说明', '1', '2', '3', 'gnsm');
INSERT INTO ne_template_detail VALUES ('7', '硬件名称', '1', '1', '4', 'yjmc');
INSERT INTO ne_template_detail VALUES ('8', '硬件说明', '1', '2', '4', 'yjsm');
INSERT INTO ne_template_detail VALUES ('9', '硬件地址', '1', '3', '4', 'yjdz');
INSERT INTO ne_template_detail VALUES ('10', '软件名称', '1', '1', '5', 'rjmc');
INSERT INTO ne_template_detail VALUES ('11', '软件说明', '1', '2', '5', 'rjsm');
INSERT INTO ne_template_detail VALUES ('12', '招生学段', '1', '1', '6', 'zsxd');
INSERT INTO ne_template_detail VALUES ('13', '招生规则', '1', '1', '6', 'zsgz');
INSERT INTO ne_template_detail VALUES ('14', '寄宿制形式', '1', '1', '6', 'jszxx');
INSERT INTO ne_template_detail VALUES ('15', '农民工学校', '1', '1', '6', 'nmgxx');

-- ----------------------------
-- Table structure for network_elements
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS network_elements';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE network_elements (
  id number(19) NOT NULL,
  parent_id number(19) DEFAULT NULL check (parent_id > 0),
  name varchar2(255) DEFAULT NULL,
  orders number(10) DEFAULT NULL check (orders > 0),
  type varchar2(255) DEFAULT NULL,
  ne_template number(19) DEFAULT NULL check (ne_template > 0),
  section varchar2(255) DEFAULT NULL ,
  rule varchar2(255) DEFAULT NULL ,
  boarding varchar2(255) DEFAULT NULL ,
  migrant number(10) DEFAULT NULL ,
  ne_path varchar2(255) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id UNIQUE  (id)
)  ;

CREATE INDEX parent_id ON network_elements (parent_id);

-- ----------------------------
-- Records of network_elements
-- ----------------------------

-- ----------------------------
-- Table structure for org_company
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS org_company';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE org_company (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of org_company
-- ----------------------------
INSERT INTO org_company VALUES ('1', null, 'Devaeye科技有限公司', null, '1', null, '1');

-- ----------------------------
-- Table structure for org_department
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS org_department';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE org_department (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  DESCN varchar2(200) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of org_department
-- ----------------------------
INSERT INTO org_department VALUES ('1', null, '市场部', null, '1', null, '1');
INSERT INTO org_department VALUES ('2', null, '财务部', null, '1', null, '1');
INSERT INTO org_department VALUES ('3', null, '人事部', null, '1', null, '1');
INSERT INTO org_department VALUES ('4', null, '研发部', null, '1', null, '1');

-- ----------------------------
-- Table structure for party_entity
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS party_entity';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE party_entity (
  ID number(19) NOT NULL,
  TYPE_ID number(19) DEFAULT NULL,
  NAME varchar2(100) DEFAULT NULL,
  REF varchar2(100) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  LEVEL number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PARTY_ENTITY_TYPE FOREIGN KEY (TYPE_ID) REFERENCES party_type (ID)
) ;

CREATE INDEX FK_PARTY_ENTITY_TYPE ON party_entity (TYPE_ID);
CREATE INDEX I_PARTY_ENTITY_REFERENCE_TYPE ON party_entity (REF,TYPE_ID);
CREATE INDEX I_PARTY_ENTITY_NAME ON party_entity (NAME);

-- ----------------------------
-- Records of party_entity
-- ----------------------------
INSERT INTO party_entity VALUES ('1', '2', 'Devaeye科技有限公司', '1', '1', null);
INSERT INTO party_entity VALUES ('2', '3', '市场部', '1', '1', null);
INSERT INTO party_entity VALUES ('3', '3', '财务部', '2', '1', null);
INSERT INTO party_entity VALUES ('4', '3', '人事部', '3', '1', null);
INSERT INTO party_entity VALUES ('5', '3', '研发部', '4', '1', null);
INSERT INTO party_entity VALUES ('6', '4', '平台组', '6', '1', null);
INSERT INTO party_entity VALUES ('7', '4', 'OA组', '7', '1', null);
INSERT INTO party_entity VALUES ('8', '1', 'Lingo', '1', '1', null);
INSERT INTO party_entity VALUES ('9', '1', 'Vivian', '2', '1', null);
INSERT INTO party_entity VALUES ('10', '1', 'Steven', '3', '1', null);
INSERT INTO party_entity VALUES ('11', '1', 'King', '4', '1', null);
INSERT INTO party_entity VALUES ('12', '1', 'John', '5', '1', null);
INSERT INTO party_entity VALUES ('13', '1', 'William', '6', '1', null);
INSERT INTO party_entity VALUES ('14', '1', 'Adam', '7', '1', null);
INSERT INTO party_entity VALUES ('15', '5', '总经理', null, '1', '2');
INSERT INTO party_entity VALUES ('16', '5', '经理', null, '1', '1');
INSERT INTO party_entity VALUES ('10008', '1', 'Robot', '8', '1', null);
INSERT INTO party_entity VALUES ('10009', '1', 'Bob', '9', '1', null);
INSERT INTO party_entity VALUES ('10010', '1', 'Alice', '10', '1', null);
INSERT INTO party_entity VALUES ('10011', '1', 'Mike', '11', '1', null);
INSERT INTO party_entity VALUES ('10012', '1', 'Justin', '12', '1', null);
INSERT INTO party_entity VALUES ('10013', '1', 'Tom', '13', '1', null);
INSERT INTO party_entity VALUES ('10014', '1', 'James', '14', '1', null);
INSERT INTO party_entity VALUES ('10015', '1', 'Joe', '15', '1', null);
INSERT INTO party_entity VALUES ('10016', '1', 'Paul', '16', '1', null);
INSERT INTO party_entity VALUES ('10017', '1', 'Jane', '17', '1', null);
INSERT INTO party_entity VALUES ('10018', '1', 'Marry', '18', '1', null);
INSERT INTO party_entity VALUES ('10019', '1', 'Ben', '19', '1', null);
INSERT INTO party_entity VALUES ('10020', '1', 'Bot', '20', '1', null);
INSERT INTO party_entity VALUES ('10021', '1', 'Jack', '21', '1', null);
INSERT INTO party_entity VALUES ('10022', '1', 'Martin', '22', '1', null);
INSERT INTO party_entity VALUES ('10023', '1', 'Alex', '23', '1', null);
INSERT INTO party_entity VALUES ('10024', '1', 'Daniel', '24', '1', null);
INSERT INTO party_entity VALUES ('10025', '1', 'Eric', '25', '1', null);
INSERT INTO party_entity VALUES ('10026', '1', 'Leon', '26', '1', null);
INSERT INTO party_entity VALUES ('10027', '1', 'Clark', '27', '1', null);
INSERT INTO party_entity VALUES ('10028', '1', 'David', '28', '1', null);
INSERT INTO party_entity VALUES ('10029', '1', 'Henry', '29', '1', null);
INSERT INTO party_entity VALUES ('10030', '1', 'Helen', '30', '1', null);
INSERT INTO party_entity VALUES ('10031', '1', 'Sarah', '31', '1', null);
INSERT INTO party_entity VALUES ('30011', '3', '行政部', null, '1', null);
INSERT INTO party_entity VALUES ('30012', '3', '销售部', null, '1', null);
INSERT INTO party_entity VALUES ('30013', '3', '客服部', null, '1', null);

-- ----------------------------
-- Table structure for party_struct
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS party_struct';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE party_struct (
  STRUCT_TYPE_ID number(19) NOT NULL,
  PARENT_ENTITY_ID number(19) DEFAULT NULL,
  CHILD_ENTITY_ID number(19) NOT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  ID number(19) DEFAULT '0' NOT NULL,
  PART_TIME number(10) DEFAULT NULL,
  LINK number(10) DEFAULT NULL,
  ADMIN number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PARTY_STRUCT_CHILD FOREIGN KEY (CHILD_ENTITY_ID) REFERENCES party_entity (ID),
  CONSTRAINT FK_PARTY_STRUCT_PARENT FOREIGN KEY (PARENT_ENTITY_ID) REFERENCES party_entity (ID),
  CONSTRAINT FK_PARTY_STRUCT_TYPE FOREIGN KEY (STRUCT_TYPE_ID) REFERENCES party_struct_type (ID)
) ;

CREATE INDEX FK_PARTY_STRUCT_TYPE ON party_struct (STRUCT_TYPE_ID);
CREATE INDEX FK_PARTY_STRUCT_PARENT ON party_struct (PARENT_ENTITY_ID);
CREATE INDEX FK_PARTY_STRUCT_CHILD ON party_struct (CHILD_ENTITY_ID);

-- ----------------------------
-- Records of party_struct
-- ----------------------------
INSERT INTO party_struct VALUES ('1', '1', '2', '0', '1', '1', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '1', '3', '0', '1', '2', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '1', '4', '0', '1', '3', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '1', '5', '0', '1', '4', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '5', '6', '0', '1', '5', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '5', '7', '0', '1', '6', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '7', '8', '0', '1', '7', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '6', '9', '0', '1', '8', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '2', '10', '0', '1', '9', '0', '0', '1');
INSERT INTO party_struct VALUES ('1', '3', '13', '0', '1', '12', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', '4', '14', '0', '1', '13', '0', '0', '0');
INSERT INTO party_struct VALUES ('1', null, '1', null, '1', '20', null, null, null);
INSERT INTO party_struct VALUES ('1', '1', '15', '0', '1', '101', '0', '0', '1');
INSERT INTO party_struct VALUES ('1', '5', '16', '0', '1', '102', '0', '0', '1');
INSERT INTO party_struct VALUES ('1', '15', '12', '0', '1', '103', '0', '0', '1');
INSERT INTO party_struct VALUES ('1', '16', '11', '0', '1', '104', '0', '0', '1');
INSERT INTO party_struct VALUES ('1', '1', '30011', null, '1', '201', null, null, null);
INSERT INTO party_struct VALUES ('1', '2', '30012', null, '1', '202', null, null, null);
INSERT INTO party_struct VALUES ('1', '2', '30013', null, '1', '203', null, null, null);
INSERT INTO party_struct VALUES ('1', '30011', '10008', null, '1', '301', null, null, null);
INSERT INTO party_struct VALUES ('1', '30011', '10009', null, '1', '302', null, null, null);
INSERT INTO party_struct VALUES ('1', '30011', '10010', null, '1', '303', null, null, null);
INSERT INTO party_struct VALUES ('1', '30012', '10011', null, '1', '304', null, null, null);
INSERT INTO party_struct VALUES ('1', '30012', '10012', null, '1', '305', null, null, null);
INSERT INTO party_struct VALUES ('1', '30012', '10013', null, '1', '306', null, null, null);
INSERT INTO party_struct VALUES ('1', '30013', '10014', null, '1', '307', null, null, null);
INSERT INTO party_struct VALUES ('1', '30013', '10015', null, '1', '308', null, null, null);
INSERT INTO party_struct VALUES ('1', '30013', '10016', null, '1', '309', null, null, null);
INSERT INTO party_struct VALUES ('1', '1', '10017', null, '1', '310', null, null, null);
INSERT INTO party_struct VALUES ('1', '1', '10018', null, '1', '311', null, null, null);
INSERT INTO party_struct VALUES ('1', '2', '10019', null, '1', '312', null, null, null);
INSERT INTO party_struct VALUES ('1', '2', '10021', null, '1', '313', null, null, null);
INSERT INTO party_struct VALUES ('1', '3', '10022', null, '1', '314', null, null, null);
INSERT INTO party_struct VALUES ('1', '3', '10023', null, '1', '315', null, null, null);
INSERT INTO party_struct VALUES ('1', '4', '10024', null, '1', '316', null, null, null);
INSERT INTO party_struct VALUES ('1', '4', '10025', null, '1', '317', null, null, null);
INSERT INTO party_struct VALUES ('1', '5', '10026', null, '1', '318', null, null, null);
INSERT INTO party_struct VALUES ('1', '5', '10027', null, '1', '319', null, null, null);
INSERT INTO party_struct VALUES ('1', '6', '10028', null, '1', '320', null, null, null);
INSERT INTO party_struct VALUES ('1', '6', '10029', null, '1', '321', null, null, null);
INSERT INTO party_struct VALUES ('1', '7', '10030', null, '1', '322', null, null, null);
INSERT INTO party_struct VALUES ('1', '7', '10031', null, '1', '323', null, null, null);

-- ----------------------------
-- Table structure for party_struct_rule
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS party_struct_rule';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE party_struct_rule (
  STRUCT_TYPE_ID number(19) NOT NULL,
  PARENT_TYPE_ID number(19) DEFAULT NULL,
  CHILD_TYPE_ID number(19) NOT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  ID number(19) DEFAULT '0' NOT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PARTY_STRUCT_RULE_TYPE FOREIGN KEY (STRUCT_TYPE_ID) REFERENCES party_struct_type (ID),
  CONSTRAINT FK_PARTY_STRUCT_RULE_TYPE_CHILD FOREIGN KEY (CHILD_TYPE_ID) REFERENCES party_type (ID),
  CONSTRAINT FK_PARTY_STRUCT_RULE_TYPE_PARENT FOREIGN KEY (PARENT_TYPE_ID) REFERENCES party_type (ID)
) ;

CREATE INDEX FK_PARTY_STRUCT_RULE_TYPE ON party_struct_rule (STRUCT_TYPE_ID);
CREATE INDEX FK_PARTY_STRUCT_RULE_TYPE_PARENT ON party_struct_rule (PARENT_TYPE_ID);
CREATE INDEX FK_PARTY_STRUCT_RULE_TYPE_CHILD ON party_struct_rule (CHILD_TYPE_ID);

-- ----------------------------
-- Records of party_struct_rule
-- ----------------------------
INSERT INTO party_struct_rule VALUES ('1', '2', '2', '1', '1');
INSERT INTO party_struct_rule VALUES ('1', '2', '3', '1', '2');
INSERT INTO party_struct_rule VALUES ('1', '2', '4', '1', '3');
INSERT INTO party_struct_rule VALUES ('1', '2', '1', '1', '4');
INSERT INTO party_struct_rule VALUES ('1', '3', '3', '1', '5');
INSERT INTO party_struct_rule VALUES ('1', '3', '4', '1', '6');
INSERT INTO party_struct_rule VALUES ('1', '3', '1', '1', '7');
INSERT INTO party_struct_rule VALUES ('1', '4', '4', '1', '8');
INSERT INTO party_struct_rule VALUES ('1', '4', '1', '1', '9');
INSERT INTO party_struct_rule VALUES ('1', '2', '5', '1', '10');
INSERT INTO party_struct_rule VALUES ('1', '3', '5', '1', '11');
INSERT INTO party_struct_rule VALUES ('1', '4', '5', '1', '12');
INSERT INTO party_struct_rule VALUES ('1', '5', '1', '1', '14');

-- ----------------------------
-- Table structure for party_struct_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS party_struct_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE party_struct_type (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  REF varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of party_struct_type
-- ----------------------------
INSERT INTO party_struct_type VALUES ('1', '行政组织', null, '1', '0');

-- ----------------------------
-- Table structure for party_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS party_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE party_type (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  REF varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of party_type
-- ----------------------------
INSERT INTO party_type VALUES ('1', '人员', '1', '1', 'user');
INSERT INTO party_type VALUES ('2', '公司', '1', '0', 'company');
INSERT INTO party_type VALUES ('3', '部门', '1', '0', 'department');
INSERT INTO party_type VALUES ('4', '小组', '1', '0', 'group');
INSERT INTO party_type VALUES ('5', '岗位', '1', '2', null);

-- ----------------------------
-- Table structure for performance_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS performance_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE performance_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT NULL,
  END_TIME timestamp(0) DEFAULT NULL,
  EMPLOYEE_ID varchar2(64) DEFAULT NULL,
  SUPERIOUR_ID varchar2(64) DEFAULT NULL,
  SCORE varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of performance_info
-- ----------------------------

-- ----------------------------
-- Table structure for person_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS person_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE person_info (
  ID number(19) NOT NULL,
  CODE varchar2(200) DEFAULT NULL,
  USERNAME varchar2(200) DEFAULT NULL,
  FAMILY_NAME varchar2(200) DEFAULT NULL,
  GIVEN_NAME varchar2(200) DEFAULT NULL,
  FULL_NAME varchar2(200) DEFAULT NULL,
  CELLPHONE varchar2(50) DEFAULT NULL,
  TELEPHONE varchar2(200) DEFAULT NULL,
  EMAIL varchar2(200) DEFAULT NULL,
  IM varchar2(200) DEFAULT NULL,
  COUNTRY varchar2(200) DEFAULT NULL,
  PROVINCE varchar2(200) DEFAULT NULL,
  CITY varchar2(200) DEFAULT NULL,
  BUILDING varchar2(200) DEFAULT NULL,
  FLOOR varchar2(200) DEFAULT NULL,
  SEAT varchar2(200) DEFAULT NULL,
  EMPLOYEE_NO varchar2(50) DEFAULT NULL,
  EMPLOYEE_TYPE varchar2(50) DEFAULT NULL,
  CARD varchar2(200) DEFAULT NULL,
  COMPANY_CODE varchar2(200) DEFAULT NULL,
  COMPANY_NAME varchar2(200) DEFAULT NULL,
  DEPARTMENT_CODE varchar2(200) DEFAULT NULL,
  DEPARTMENT_NAME varchar2(200) DEFAULT NULL,
  POSITION_CODE varchar2(200) DEFAULT NULL,
  POSITION_NAME varchar2(200) DEFAULT NULL,
  GENDER varchar2(500) DEFAULT NULL,
  BIRTHDAY timestamp(0) DEFAULT NULL,
  ID_CARD_TYPE varchar2(50) DEFAULT NULL,
  ID_CARD_VALUE varchar2(50) DEFAULT NULL,
  NATIONALITY varchar2(200) DEFAULT NULL,
  STAR varchar2(50) DEFAULT NULL,
  BLOOD varchar2(50) DEFAULT NULL,
  CLOTH_SIZE varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of person_info
-- ----------------------------
INSERT INTO person_info VALUES ('1', '1', 'lingo', 'Devaeye', 'Lingo', 'Lingo Devaeye', '18012345678', null, 'lingo@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('2', '2', 'vivian', 'Devaeye', 'Vivian', 'Vivian Devaeye', '18012345678', null, 'vivian@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('3', '3', 'steven', 'Demo', 'Steven', 'Steven', '18012345678', null, 'steven@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('4', '4', 'king', 'Demo', 'King', 'King', '18012345678', null, 'king@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('5', '5', 'john', 'Demo', 'John', 'John', '18012345678', null, 'john@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('6', '6', 'william', '', 'William', 'William', '18012345678', null, 'william@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('7', '7', 'adam', 'Demo', 'Adam', 'Adam', '18012345678', null, 'adam@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('8', '8', 'robot', 'Demo', 'Robot', 'Robot', '18012345678', null, 'robot@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('9', '9', 'bob', 'Devaeye', 'Bob', 'Bob Devaeye', '18012345678', null, 'bob@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('10', '10', 'alice', 'Devaeye', 'Alice', 'Alice Devaeye', '18012345678', null, 'alice@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('11', '11', 'mike', 'Devaeye', 'Mike', 'Mike Devaeye', '18012345678', null, 'mike@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('12', '12', 'justin', 'Devaeye', 'Justin', 'Justin Devaeye', '18012345678', null, 'justin@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('13', '13', 'tom', 'Devaeye', 'Tom', 'Tom Devaeye', '18012345678', null, 'tom@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('14', '14', 'james', 'Devaeye', 'James', 'James Devaeye', '18012345678', null, 'james@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('15', '15', 'joe', 'Devaeye', 'Joe', 'Joe Devaeye', '18012345678', null, 'joe@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('16', '16', 'paul', 'Devaeye', 'Paul', 'Paul Devaeye', '18012345678', null, 'paul@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('17', '17', 'jane', 'Devaeye', 'Jane', 'Jane Devaeye', '18012345678', null, 'jane@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('18', '18', 'marry', 'Devaeye', 'Marry', 'Marry Devaeye', '18012345678', null, 'marry@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('19', '19', 'ben', 'Devaeye', 'Ben', 'Ben Devaeye', '18012345678', null, 'ben@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('20', '20', 'bot', 'Devaeye', 'Bot', 'Bot Devaeye', '18012345678', null, 'bot@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('21', '21', 'jack', 'Devaeye', 'Jack', 'Jack Devaeye', '18012345678', null, 'jack@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('22', '22', 'martin', 'Devaeye', 'Martin', 'Martin Devaeye', '18012345678', null, 'marin@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('23', '23', 'alex', 'Devaeye', 'Alex', 'Alex Devaeye', '18012345678', null, 'alex@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('24', '24', 'daniel', 'Devaeye', 'Daniel', 'Daniel Devaeye', '18012345678', null, 'daniel@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('25', '25', 'eric', 'Devaeye', 'Eric', 'Eric Devaeye', '18012345678', null, 'eric@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('26', '26', 'leon', 'Devaeye', 'Leon', 'Leon Devaeye', '18012345678', null, 'leon@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('27', '27', 'clark', 'Devaeye', 'Clark', 'Clark Devaeye', '18012345678', null, 'clark@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('28', '28', 'david', 'Devaeye', 'David', 'David Devaeye', '18012345678', null, 'david@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('29', '29', 'henry', 'Devaeye', 'Henry', 'Henry Devaeye', '18012345678', null, 'henry@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('30', '30', 'helen', 'Devaeye', 'Helen', 'Helen Devaeye', '18012345678', null, 'helen@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('31', '31', 'sarah', 'Devaeye', 'Sarah', 'Sarah Devaeye', '18012345678', null, 'sarah@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('32', '32', 'sam', 'Devaeye', 'Sam', 'Sam Devaeye', '18012345678', null, 'sam@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('33', '33', 'claire', 'Devaeye', 'Claire', 'Claire Devaeye', '18012345678', null, 'claire@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO person_info VALUES ('34', '34', 'thomas', 'Devaeye', 'Thomas', 'Thomas Devaeye', '18012345678', null, 'thomas@devaeye.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for pim_device
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS pim_device';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE pim_device (
  ID number(19) NOT NULL,
  CODE varchar2(64) DEFAULT NULL,
  NAME varchar2(64) DEFAULT NULL,
  TYPE varchar2(64) DEFAULT NULL,
  SESSION_ID varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of pim_device
-- ----------------------------

-- ----------------------------
-- Table structure for pim_favorite
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS pim_favorite';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE pim_favorite (
  ID number(19) NOT NULL,
  MODULE_TYPE varchar2(50) DEFAULT NULL,
  MODULE_ID varchar2(64) DEFAULT NULL,
  TITLE varchar2(100) DEFAULT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  TAGS varchar2(200) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of pim_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for pim_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS pim_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE pim_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PHOTO varchar2(200) DEFAULT NULL,
  BIRTHDAY date DEFAULT NULL,
  ADDRESS varchar2(200) DEFAULT NULL,
  TEL varchar2(200) DEFAULT NULL,
  EMAIL varchar2(200) DEFAULT NULL,
  ORG varchar2(200) DEFAULT NULL,
  TITLE varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  DEPARTMENT varchar2(100) DEFAULT NULL,
  IMPP varchar2(100) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  REF varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of pim_info
-- ----------------------------
INSERT INTO pim_info VALUES ('1', '国栋', null, null, null, '15801234567', 'admin@devaeye.com', 'Devaeye', 'Java程序员', '1', '1', 'IT', '1370000000', 'internal', '1');

-- ----------------------------
-- Table structure for pim_note
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS pim_note';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE pim_note (
  ID number(19) NOT NULL,
  TITLE varchar2(100) DEFAULT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CLIENT_X number(10) DEFAULT NULL,
  CLIENT_Y number(10) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of pim_note
-- ----------------------------

-- ----------------------------
-- Table structure for pim_phrase
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS pim_phrase';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE pim_phrase (
  ID number(19) NOT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of pim_phrase
-- ----------------------------

-- ----------------------------
-- Table structure for pim_remind
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS pim_remind';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE pim_remind (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  REPEAT_TYPE varchar2(64) DEFAULT NULL,
  REPEAT_PEROID number(10) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  REMIND_TIME varchar2(50) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of pim_remind
-- ----------------------------

-- ----------------------------
-- Table structure for pim_schedule
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS pim_schedule';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE pim_schedule (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  LOCATION varchar2(200) DEFAULT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  TYPE number(10) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  END_TIME timestamp(0) DEFAULT '0000-00-00 00:00:00' NOT NULL,
  ALERT_TIME varchar2(50) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  REF varchar2(100) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of pim_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for pim_schedule_participant
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS pim_schedule_participant';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE pim_schedule_participant (
  ID number(19) NOT NULL,
  TYPE number(10) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  SCHEDULE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PIM_SCHEDULE_PARTICIPANT_SCHEDULE FOREIGN KEY (SCHEDULE_ID) REFERENCES pim_schedule (ID)
) ;

CREATE INDEX FK_PIM_SCHEDULE_PARTICIPANT_SCHEDULE ON pim_schedule_participant (SCHEDULE_ID);

-- ----------------------------
-- Records of pim_schedule_participant
-- ----------------------------

-- ----------------------------
-- Table structure for plm_category
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_category';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_category (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of plm_category
-- ----------------------------
INSERT INTO plm_category VALUES ('1', '通用工具', '1', null, null, null);
INSERT INTO plm_category VALUES ('2', '系统工具', '2', null, null, null);
INSERT INTO plm_category VALUES ('3', '基础组件', '3', null, null, null);
INSERT INTO plm_category VALUES ('4', '业务模块', '4', null, null, null);
INSERT INTO plm_category VALUES ('5', '内容管理', '5', null, null, null);
INSERT INTO plm_category VALUES ('99', '孵化器', '99', null, null, null);

-- ----------------------------
-- Table structure for plm_comment
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_comment';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_comment (
  ID number(19) NOT NULL,
  CONTENT clob,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  ISSUE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PIM_COMMENT_ISSUE FOREIGN KEY (ISSUE_ID) REFERENCES plm_issue (ID)
) ;

CREATE INDEX FK_PIM_COMMENT_ISSUE ON plm_comment (ISSUE_ID);

-- ----------------------------
-- Records of plm_comment
-- ----------------------------

-- ----------------------------
-- Table structure for plm_component
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_component';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_component (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  PROJECT_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PIM_COMPONENT_PROJECT FOREIGN KEY (PROJECT_ID) REFERENCES plm_project (ID)
) ;

CREATE INDEX FK_PIM_COMPONENT_PROJECT ON plm_component (PROJECT_ID);

-- ----------------------------
-- Records of plm_component
-- ----------------------------

-- ----------------------------
-- Table structure for plm_config
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_config';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_config (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of plm_config
-- ----------------------------
INSERT INTO plm_config VALUES ('1', 'default', '默认配置');

-- ----------------------------
-- Table structure for plm_issue
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_issue';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_issue (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  CONTENT clob,
  SEVERITY number(10) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT NULL,
  COMPLETE_TIME timestamp(0) DEFAULT NULL,
  REPORTER_ID varchar2(64) DEFAULT NULL,
  ASSIGNEE_ID varchar2(64) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  STEP varchar2(50) DEFAULT NULL,
  PROJECT_ID number(19) DEFAULT NULL,
  SPRINT_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PLM_ISSUE_PROJECT FOREIGN KEY (PROJECT_ID) REFERENCES plm_project (ID),
  CONSTRAINT FK_PLM_ISSUE_SPRINT FOREIGN KEY (SPRINT_ID) REFERENCES plm_sprint (ID)
) ;

CREATE INDEX FK_PLM_ISSUE_PROJECT ON plm_issue (PROJECT_ID);
CREATE INDEX FK_PLM_ISSUE_SPRINT ON plm_issue (SPRINT_ID);

-- ----------------------------
-- Records of plm_issue
-- ----------------------------
INSERT INTO plm_issue VALUES ('1', 'story', '文档支持权限配置', 'Lemon2群，依然爱你(934039020)提出的，在domino中有个读者域、作者域  用来控制文档的权限', null, '2015-02-11 03:26:41', null, null, '1', '1', 'active', 'preConfirm', '11', '1');
INSERT INTO plm_issue VALUES ('2', 'story', '整理表结构设计图', '', null, '2015-02-11 06:06:09', null, null, '1', '1', 'active', 'dev', '11', '1');
INSERT INTO plm_issue VALUES ('3', 'story', '站内消息发给多人', '', null, '2015-02-11 07:36:05', null, null, '1', '1', 'active', 'preDev', '11', '1');
INSERT INTO plm_issue VALUES ('5', 'story', '电子表单支持增删行列', '', null, '2015-02-12 06:48:40', null, null, '1', '1', 'active', 'dev', '11', '1');
INSERT INTO plm_issue VALUES ('6', 'story', '梳理权限', '1.规划目前的功能点n2.规划哪些功能点需要哪些权限n3.改代码', null, '2015-02-13 06:44:09', null, null, '1', '1', 'active', 'dev', '11', '1');

-- ----------------------------
-- Table structure for plm_issue_component
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_issue_component';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_issue_component (
  ISSUE_ID number(19) DEFAULT '0' NOT NULL,
  COMPONENT_ID number(19) DEFAULT '0' NOT NULL,
  PRIMARY KEY (ISSUE_ID,COMPONENT_ID)
 ,
  CONSTRAINT FK_PIM_ISSUE_COMPONENT_COMPONENT FOREIGN KEY (COMPONENT_ID) REFERENCES plm_component (ID),
  CONSTRAINT FK_PIM_ISSUE_COMPONENT_ISSUE FOREIGN KEY (ISSUE_ID) REFERENCES plm_issue (ID)
) ;

CREATE INDEX FK_PIM_ISSUE_COMPONENT_COMPONENT ON plm_issue_component (COMPONENT_ID);

-- ----------------------------
-- Records of plm_issue_component
-- ----------------------------

-- ----------------------------
-- Table structure for plm_issue_version
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_issue_version';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_issue_version (
  ISSUE_ID number(19) DEFAULT '0' NOT NULL,
  VERSION_ID number(19) DEFAULT '0' NOT NULL,
  PRIMARY KEY (ISSUE_ID,VERSION_ID)
 ,
  CONSTRAINT FK_PIM_ISSUE_VERSION_ISSUE FOREIGN KEY (ISSUE_ID) REFERENCES plm_issue (ID),
  CONSTRAINT FK_PIM_ISSUE_VERSION_VERSION FOREIGN KEY (VERSION_ID) REFERENCES plm_version (ID)
) ;

CREATE INDEX FK_PIM_ISSUE_VERSION_VERSION ON plm_issue_version (VERSION_ID);

-- ----------------------------
-- Records of plm_issue_version
-- ----------------------------

-- ----------------------------
-- Table structure for plm_log
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_log';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_log (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  LOG_TIME timestamp(0) DEFAULT NULL,
  CONTENT clob,
  ISSUE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PIM_LOG_ISSUE FOREIGN KEY (ISSUE_ID) REFERENCES plm_issue (ID)
) ;

CREATE INDEX FK_PIM_LOG_ISSUE ON plm_log (ISSUE_ID);

-- ----------------------------
-- Records of plm_log
-- ----------------------------
INSERT INTO plm_log VALUES ('1', 'create', '1', '2015-02-11 03:26:41', null, '1');
INSERT INTO plm_log VALUES ('2', 'create', '1', '2015-02-11 06:06:09', null, '2');
INSERT INTO plm_log VALUES ('3', 'create', '1', '2015-02-11 07:36:05', null, '3');
INSERT INTO plm_log VALUES ('5', 'create', '1', '2015-02-12 06:48:40', null, '5');
INSERT INTO plm_log VALUES ('6', 'update', null, '2015-02-12 14:17:24', null, '1');
INSERT INTO plm_log VALUES ('7', 'update', null, '2015-02-12 14:17:26', null, '1');
INSERT INTO plm_log VALUES ('8', 'update', null, '2015-02-12 14:17:36', null, '5');
INSERT INTO plm_log VALUES ('9', 'update', null, '2015-02-12 14:17:38', null, '2');
INSERT INTO plm_log VALUES ('10', 'update', null, '2015-02-12 14:17:39', null, '3');
INSERT INTO plm_log VALUES ('11', 'update', null, '2015-02-12 14:17:41', null, '3');
INSERT INTO plm_log VALUES ('12', 'update', null, '2015-02-12 14:17:42', null, '2');
INSERT INTO plm_log VALUES ('13', 'update', null, '2015-02-12 14:17:44', null, '2');
INSERT INTO plm_log VALUES ('14', 'update', null, '2015-02-12 14:18:40', null, '1');
INSERT INTO plm_log VALUES ('15', 'update', null, '2015-02-12 14:18:46', null, '5');
INSERT INTO plm_log VALUES ('16', 'update', null, '2015-02-12 14:18:47', null, '2');
INSERT INTO plm_log VALUES ('17', 'update', null, '2015-02-12 14:18:49', null, '1');
INSERT INTO plm_log VALUES ('18', 'update', null, '2015-02-12 14:18:55', null, '5');
INSERT INTO plm_log VALUES ('19', 'update', null, '2015-02-12 14:18:56', null, '5');
INSERT INTO plm_log VALUES ('20', 'create', '1', '2015-02-13 06:44:09', null, '6');
INSERT INTO plm_log VALUES ('21', 'update', null, '2015-02-24 16:20:34', null, '3');
INSERT INTO plm_log VALUES ('22', 'update', null, '2015-02-24 16:20:36', null, '2');
INSERT INTO plm_log VALUES ('23', 'update', null, '2015-02-24 16:20:38', null, '1');
INSERT INTO plm_log VALUES ('24', 'update', null, '2015-02-24 16:20:40', null, '5');
INSERT INTO plm_log VALUES ('25', 'update', null, '2015-02-24 16:20:42', null, '6');
INSERT INTO plm_log VALUES ('26', 'update', null, '2015-02-24 16:20:44', null, '6');
INSERT INTO plm_log VALUES ('27', 'update', null, '2015-02-26 03:49:04', null, '3');
INSERT INTO plm_log VALUES ('28', 'update', null, '2015-02-26 03:49:06', null, '3');
INSERT INTO plm_log VALUES ('29', 'update', null, '2015-02-26 03:49:08', null, '2');
INSERT INTO plm_log VALUES ('30', 'update', null, '2015-02-26 03:49:09', null, '5');
INSERT INTO plm_log VALUES ('31', 'update', null, '2015-02-26 03:49:10', null, '6');
INSERT INTO plm_log VALUES ('32', 'update', null, '2015-02-26 09:19:42', null, '3');
INSERT INTO plm_log VALUES ('33', 'update', null, '2015-02-26 09:19:44', null, '1');
INSERT INTO plm_log VALUES ('34', 'update', null, '2015-02-26 09:19:46', null, '2');
INSERT INTO plm_log VALUES ('35', 'update', null, '2015-02-26 09:19:47', null, '5');
INSERT INTO plm_log VALUES ('36', 'update', null, '2015-02-26 09:19:49', null, '6');
INSERT INTO plm_log VALUES ('37', 'update', null, '2015-02-26 09:50:29', null, '3');
INSERT INTO plm_log VALUES ('38', 'update', null, '2015-02-26 09:50:31', null, '2');
INSERT INTO plm_log VALUES ('39', 'update', null, '2015-02-26 09:50:40', null, '1');
INSERT INTO plm_log VALUES ('40', 'update', null, '2015-02-26 09:50:42', null, '6');
INSERT INTO plm_log VALUES ('41', 'update', null, '2015-02-26 09:50:44', null, '5');
INSERT INTO plm_log VALUES ('42', 'complete issue', null, '2015-02-26 09:50:49', null, '6');
INSERT INTO plm_log VALUES ('43', 'reopen issue', null, '2015-02-26 09:50:57', null, '6');
INSERT INTO plm_log VALUES ('44', 'update', null, '2015-02-26 09:50:59', null, '1');
INSERT INTO plm_log VALUES ('45', 'update', null, '2015-02-26 09:51:02', null, '6');

-- ----------------------------
-- Table structure for plm_project
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_project';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_project (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  LOGO varchar2(200) DEFAULT NULL,
  SUMMARY clob,
  WIKI_URL varchar2(200) DEFAULT NULL,
  SOURCE_URL varchar2(200) DEFAULT NULL,
  URL varchar2(200) DEFAULT NULL,
  LEADER_ID varchar2(64) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CATEGORY_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PIM_PROJECT_CATEGORY FOREIGN KEY (CATEGORY_ID) REFERENCES plm_category (ID)
) ;

CREATE INDEX FK_PIM_PROJECT_CATEGORY ON plm_project (CATEGORY_ID);

-- ----------------------------
-- Records of plm_project
-- ----------------------------
INSERT INTO plm_project VALUES ('11', 'PARENT', '全局配置', null, null, null, null, null, '1', '1', null, null, null, '1');
INSERT INTO plm_project VALUES ('12', 'FRONTEND', '前端框架', null, null, null, null, null, '1', '2', null, null, null, '1');
INSERT INTO plm_project VALUES ('13', 'BACKEND', '后端框架', null, null, null, null, null, '1', '3', null, null, null, '1');
INSERT INTO plm_project VALUES ('14', 'TEST', '测试工具', null, null, null, null, null, '1', '4', null, null, null, '1');
INSERT INTO plm_project VALUES ('15', 'CORE', '核心工具', null, null, null, null, null, '1', '5', null, null, null, '1');
INSERT INTO plm_project VALUES ('16', 'SECURITY', '权限控制', null, null, null, null, null, '1', '6', null, null, null, '1');
INSERT INTO plm_project VALUES ('21', 'DICT', '数据字典', null, null, null, null, null, '1', '1', null, null, null, '2');
INSERT INTO plm_project VALUES ('22', 'MAIL', '邮件', null, null, null, null, null, '1', '2', null, null, null, '2');
INSERT INTO plm_project VALUES ('23', 'STORE', '附件', null, null, null, null, null, '1', '3', null, null, null, '2');
INSERT INTO plm_project VALUES ('24', 'TEMPLATE', '模板', null, null, null, null, null, '1', '4', null, null, null, '2');
INSERT INTO plm_project VALUES ('25', 'WHITELIST', '白名单', null, null, null, null, null, '1', '5', null, null, null, '2');
INSERT INTO plm_project VALUES ('26', 'WORKCAL', '工作日历', null, null, null, null, null, '1', '6', null, null, null, '2');
INSERT INTO plm_project VALUES ('27', 'AUDIT', '审计日志', null, null, null, null, null, '1', '7', null, null, null, '2');
INSERT INTO plm_project VALUES ('28', 'ONLINE', '在线列表', null, null, null, null, null, '1', '8', null, null, null, '2');
INSERT INTO plm_project VALUES ('31', 'USER', '用户管理', null, null, null, null, null, '1', '1', null, null, null, '3');
INSERT INTO plm_project VALUES ('32', 'ORG', '组织机构', null, null, null, null, null, '1', '2', null, null, null, '3');
INSERT INTO plm_project VALUES ('33', 'AUTH', '权限控制', null, null, null, null, null, '1', '3', null, null, null, '3');
INSERT INTO plm_project VALUES ('34', 'FORM', '电子表单', null, null, null, null, null, '1', '4', null, null, null, '3');
INSERT INTO plm_project VALUES ('35', 'TASK', '任务中心', null, null, null, null, null, '1', '5', null, null, null, '3');
INSERT INTO plm_project VALUES ('36', 'BPM', '业务流程', null, null, null, null, null, '1', '6', null, null, null, '3');
INSERT INTO plm_project VALUES ('37', 'OPERATION', '操作', null, null, null, null, null, '1', '7', null, null, null, '3');
INSERT INTO plm_project VALUES ('41', 'PIM', '个人事务', null, null, null, null, null, '1', '1', null, null, null, '4');
INSERT INTO plm_project VALUES ('42', 'LOGISTIC', '行政管理', null, null, null, null, null, '1', '2', null, null, null, '4');
INSERT INTO plm_project VALUES ('43', 'LEMON', 'LemonOA', null, null, null, null, null, '1', '3', null, null, null, '4');
INSERT INTO plm_project VALUES ('44', 'PLM', '项目追踪', null, null, null, null, null, '1', '4', null, null, null, '4');
INSERT INTO plm_project VALUES ('51', 'NEWS', '新闻', null, null, null, null, null, '1', '1', null, null, null, '5');
INSERT INTO plm_project VALUES ('52', 'FORUM', '论坛', null, null, null, null, null, '1', '2', null, null, null, '5');
INSERT INTO plm_project VALUES ('53', 'WIKI', 'WIKI', null, null, null, null, null, '1', '3', null, null, null, '5');
INSERT INTO plm_project VALUES ('54', 'ASK', '问答', null, null, null, null, null, '1', '4', null, null, null, '5');
INSERT INTO plm_project VALUES ('55', 'MSG', '站内信', null, null, null, null, null, '1', '5', null, null, null, '5');
INSERT INTO plm_project VALUES ('56', 'SNS', '互动', null, null, null, null, null, '1', '6', null, null, null, '5');
INSERT INTO plm_project VALUES ('9901', 'TENANT', '多租户', null, null, null, null, null, '1', '1', null, null, null, '99');
INSERT INTO plm_project VALUES ('9902', 'ACL', '数据权限', null, null, null, null, null, '1', '2', null, null, null, '99');
INSERT INTO plm_project VALUES ('9903', 'REPORT', '报表管理', null, null, null, null, null, '1', '3', null, null, null, '99');
INSERT INTO plm_project VALUES ('9904', 'EXPORT', '导出管理', null, null, null, null, null, '1', '4', null, null, null, '99');
INSERT INTO plm_project VALUES ('9905', 'DEV', '研发管理', null, null, null, null, null, '1', '5', null, null, null, '99');
INSERT INTO plm_project VALUES ('9906', 'HR', '人事管理', null, null, null, null, null, '1', '6', null, null, null, '99');
INSERT INTO plm_project VALUES ('9907', 'APP', '移动端', null, null, null, null, null, '1', '7', null, null, null, '99');
INSERT INTO plm_project VALUES ('9908', 'IM', '即时通讯', null, null, null, null, null, '1', '8', null, null, null, '99');
INSERT INTO plm_project VALUES ('9909', 'DEEP', '深度学习', null, null, null, null, null, '1', '9', null, null, null, '99');
INSERT INTO plm_project VALUES ('9910', 'JAVAMAIL', '邮件客户端', null, null, null, null, null, '1', '10', null, null, null, '99');
INSERT INTO plm_project VALUES ('9911', 'SMS', '短信', null, null, null, null, null, '1', '11', null, null, null, '99');

-- ----------------------------
-- Table structure for plm_sprint
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_sprint';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_sprint (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  START_TIME timestamp(0) DEFAULT NULL,
  END_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  CONFIG_ID number(19) DEFAULT NULL,
  PROJECT_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PIM_SPRINT_CONFIG FOREIGN KEY (CONFIG_ID) REFERENCES plm_config (ID),
  CONSTRAINT FK_PIM_SPRINT_PROJECT FOREIGN KEY (PROJECT_ID) REFERENCES plm_project (ID)
) ;

CREATE INDEX FK_PIM_SPRINT_CONFIG ON plm_sprint (CONFIG_ID);
CREATE INDEX FK_PIM_SPRINT_PROJECT ON plm_sprint (PROJECT_ID);

-- ----------------------------
-- Records of plm_sprint
-- ----------------------------
INSERT INTO plm_sprint VALUES ('1', null, 'global-1.0.0.0', null, '2015-01-01 00:00:00', '2015-01-31 00:00:00', 'active', '1', '11');

-- ----------------------------
-- Table structure for plm_step
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_step';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_step (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  ACTION varchar2(50) DEFAULT NULL,
  CONFIG_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PIM_STEP_CONFIG FOREIGN KEY (CONFIG_ID) REFERENCES plm_config (ID)
) ;

CREATE INDEX FK_PIM_STEP_CONFIG ON plm_step (CONFIG_ID);

-- ----------------------------
-- Records of plm_step
-- ----------------------------
INSERT INTO plm_step VALUES ('1', 'request', '需求池', '1', 'none', '1');
INSERT INTO plm_step VALUES ('2', 'preDev', '准备开发', '2', 'none', '1');
INSERT INTO plm_step VALUES ('3', 'dev', '开发中', '3', 'start', '1');
INSERT INTO plm_step VALUES ('4', 'preTest', '准备测试', '4', 'stop', '1');
INSERT INTO plm_step VALUES ('5', 'test', '测试中', '5', 'start', '1');
INSERT INTO plm_step VALUES ('6', 'preConfirm', '准备验证', '6', 'stop', '1');
INSERT INTO plm_step VALUES ('7', 'confirm', '验证完成', '7', 'complete', '1');

-- ----------------------------
-- Table structure for plm_version
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS plm_version';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE plm_version (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  PROJECT_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PIM_VERSION_PROJECT FOREIGN KEY (PROJECT_ID) REFERENCES plm_project (ID)
) ;

CREATE INDEX FK_PIM_VERSION_PROJECT ON plm_version (PROJECT_ID);

-- ----------------------------
-- Records of plm_version
-- ----------------------------
INSERT INTO plm_version VALUES ('11', '1.0.0', 'active', null, null, '1', '11');

-- ----------------------------
-- Table structure for portal_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS portal_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE portal_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  COLUMN_LAYOUT varchar2(100) DEFAULT NULL,
  SHARED_STATUS varchar2(10) DEFAULT NULL,
  GLOBAL_STATUS varchar2(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of portal_info
-- ----------------------------
INSERT INTO portal_info VALUES ('1', null, null, null, null, '4-4-4', 'true', 'true', null);

-- ----------------------------
-- Table structure for portal_item
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS portal_item';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE portal_item (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  COLUMN_INDEX number(10) DEFAULT NULL,
  ROW_INDEX number(10) DEFAULT NULL,
  DATA varchar2(200) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  WIDGET_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PORTAL_ITEM_INFO FOREIGN KEY (INFO_ID) REFERENCES portal_info (ID),
  CONSTRAINT FK_PORTAL_ITEM_WIDGET FOREIGN KEY (WIDGET_ID) REFERENCES portal_widget (ID)
) ;

CREATE INDEX FK_PORTAL_ITEM_INFO ON portal_item (INFO_ID);
CREATE INDEX FK_PORTAL_ITEM_WIDGET ON portal_item (WIDGET_ID);

-- ----------------------------
-- Records of portal_item
-- ----------------------------
INSERT INTO portal_item VALUES ('1', '待办任务', '1', '1', null, '1', '1', null);
INSERT INTO portal_item VALUES ('2', '我的流程', '2', '1', null, '1', '2', null);
INSERT INTO portal_item VALUES ('3', '常用流程', '3', '1', null, '1', '3', null);
INSERT INTO portal_item VALUES ('4', '通知公告', '1', '2', null, '1', '4', null);
INSERT INTO portal_item VALUES ('5', '常用工具', '2', '2', null, '1', '5', null);
INSERT INTO portal_item VALUES ('6', '天气预报', '3', '2', null, '1', '6', null);
INSERT INTO portal_item VALUES ('7', 'Android', '1', '3', null, '1', '10', null);
INSERT INTO portal_item VALUES ('8', '私信', '2', '3', null, '1', '9', null);

-- ----------------------------
-- Table structure for portal_ref
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS portal_ref';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE portal_ref (
  ID number(19) NOT NULL,
  INFO_ID number(19) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_PORTAL_REF_INFO FOREIGN KEY (INFO_ID) REFERENCES portal_info (ID)
) ;

CREATE INDEX FK_PORTAL_REF_INFO ON portal_ref (INFO_ID);

-- ----------------------------
-- Records of portal_ref
-- ----------------------------
INSERT INTO portal_ref VALUES ('515743578849280', '1', '1', null);

-- ----------------------------
-- Table structure for portal_widget
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS portal_widget';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE portal_widget (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  URL varchar2(200) DEFAULT NULL,
  DATA varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of portal_widget
-- ----------------------------
INSERT INTO portal_widget VALUES ('1', '待办任务', '/rs/humantask/widget/personalTasks', null, null);
INSERT INTO portal_widget VALUES ('2', '我的流程', '/rs/bpm/widget/runningProcesses', null, null);
INSERT INTO portal_widget VALUES ('3', '常用流程', '/rs/bpm/widget/processes', null, null);
INSERT INTO portal_widget VALUES ('4', '通知公告', '/rs/cms/widget/articles', null, null);
INSERT INTO portal_widget VALUES ('5', '常用工具', '/widgets/tools.html', null, null);
INSERT INTO portal_widget VALUES ('6', '天气预报', '/widgets/weather.html', null, null);
INSERT INTO portal_widget VALUES ('7', '地图', '/widgets/map.html', null, null);
INSERT INTO portal_widget VALUES ('8', '时钟', '/widgets/clock.html', null, null);
INSERT INTO portal_widget VALUES ('9', '私信', '/rs/msg/widget/msg', null, null);
INSERT INTO portal_widget VALUES ('10', 'Android', '/widgets/android.html', null, null);

-- ----------------------------
-- Table structure for sendmail_attachment
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sendmail_attachment';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sendmail_attachment (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  PATH varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  TEMPLATE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_SENDMAIL_ATTACHMENT_TEMPLATE FOREIGN KEY (TEMPLATE_ID) REFERENCES sendmail_template (ID)
) ;

CREATE INDEX FK_SENDMAIL_ATTACHMENT_TEMPLATE ON sendmail_attachment (TEMPLATE_ID);

-- ----------------------------
-- Records of sendmail_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sendmail_config
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sendmail_config';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sendmail_config (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  HOST varchar2(200) DEFAULT NULL,
  USERNAME varchar2(200) DEFAULT NULL,
  PASSWORD varchar2(200) DEFAULT NULL,
  SMTP_AUTH number(10) DEFAULT NULL,
  SMTP_STARTTLS number(10) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  DEFAULT_FROM varchar2(200) DEFAULT NULL,
  TEST_MAIL varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PORT number(10) DEFAULT NULL,
  SMTP_SSL number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of sendmail_config
-- ----------------------------
INSERT INTO sendmail_config VALUES ('1', 'default', 'mail.devaeye.com', 'bot@devaeye.com', 'bot2mossle', '1', '0', 'normal', 'bot@devaeye.com', null, '1', '465', '1');

-- ----------------------------
-- Table structure for sendmail_history
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sendmail_history';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sendmail_history (
  ID number(19) NOT NULL,
  SUBJECT varchar2(50) DEFAULT NULL,
  SENDER varchar2(200) DEFAULT NULL,
  RECEIVER varchar2(200) DEFAULT NULL,
  CC varchar2(200) DEFAULT NULL,
  BCC varchar2(200) DEFAULT NULL,
  CONTENT clob,
  ATTACHMENT varchar2(200) DEFAULT NULL,
  DATA clob,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  INFO varchar2(200) DEFAULT NULL,
  CONFIG_ID number(19) DEFAULT NULL,
  TEMPLATE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_SENDMAIL_HISTORY_CONFIG FOREIGN KEY (CONFIG_ID) REFERENCES sendmail_config (ID),
  CONSTRAINT FK_SENDMAIL_HISTORY_TEMPLATE FOREIGN KEY (TEMPLATE_ID) REFERENCES sendmail_template (ID)
) ;

CREATE INDEX FK_SENDMAIL_HISTORY_CONFIG ON sendmail_history (CONFIG_ID);
CREATE INDEX FK_SENDMAIL_HISTORY_TEMPLATE ON sendmail_history (TEMPLATE_ID);

-- ----------------------------
-- Records of sendmail_history
-- ----------------------------

-- ----------------------------
-- Table structure for sendmail_queue
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sendmail_queue';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sendmail_queue (
  ID number(19) NOT NULL,
  SUBJECT varchar2(50) DEFAULT NULL,
  SENDER varchar2(200) DEFAULT NULL,
  RECEIVER varchar2(200) DEFAULT NULL,
  CC varchar2(200) DEFAULT NULL,
  BCC varchar2(200) DEFAULT NULL,
  CONTENT clob,
  ATTACHMENT varchar2(200) DEFAULT NULL,
  DATA clob,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  INFO varchar2(200) DEFAULT NULL,
  CONFIG_ID number(19) DEFAULT NULL,
  TEMPLATE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_SENDMAIL_QUEUE_CONFIG FOREIGN KEY (CONFIG_ID) REFERENCES sendmail_config (ID),
  CONSTRAINT FK_SENDMAIL_QUEUE_TEMPLATE FOREIGN KEY (TEMPLATE_ID) REFERENCES sendmail_template (ID)
) ;

CREATE INDEX FK_SENDMAIL_QUEUE_CONFIG ON sendmail_queue (CONFIG_ID);
CREATE INDEX FK_SENDMAIL_QUEUE_TEMPLATE ON sendmail_queue (TEMPLATE_ID);

-- ----------------------------
-- Records of sendmail_queue
-- ----------------------------

-- ----------------------------
-- Table structure for sendmail_template
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sendmail_template';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sendmail_template (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  RECEIVER varchar2(200) DEFAULT NULL,
  SENDER varchar2(200) DEFAULT NULL,
  CC varchar2(200) DEFAULT NULL,
  BCC varchar2(200) DEFAULT NULL,
  SUBJECT varchar2(200) DEFAULT NULL,
  CONTENT clob,
  MANUAL number(10) DEFAULT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of sendmail_template
-- ----------------------------
INSERT INTO sendmail_template VALUES ('1', 'test', '国栋<admin@devaeye.com>,vivian<vivian@devaeye.com>', '测试<admin@devaeye.com>', null, null, 'test', 'test', '0', null);
INSERT INTO sendmail_template VALUES ('2', 'template', '演示<admin@devaeye.com>', '测试<admin@devaeye.com>', null, null, 'template', '${name}<#list list as item>${item}</#list>', '1', null);

-- ----------------------------
-- Table structure for sendsms_config
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sendsms_config';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sendsms_config (
  ID number(19) DEFAULT '0' NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  HOST varchar2(200) DEFAULT NULL,
  USERNAME varchar2(200) DEFAULT NULL,
  PASSWORD varchar2(200) DEFAULT NULL,
  APP_ID varchar2(50) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  MOBILE_FIELD_NAME varchar2(50) DEFAULT NULL,
  MESSAGE_FIELD_NAME varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of sendsms_config
-- ----------------------------
INSERT INTO sendsms_config VALUES ('1', 'default', 'http://localhost/sms', 'username', 'password', '1', null, 'mobile', 'message', null);

-- ----------------------------
-- Table structure for sendsms_history
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sendsms_history';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sendsms_history (
  ID number(19) DEFAULT '0' NOT NULL,
  MOBILE varchar2(50) DEFAULT NULL,
  MESSAGE varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  INFO varchar2(200) DEFAULT NULL,
  CONFIG_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_SENDSMS_HISTORY_CONFIG FOREIGN KEY (CONFIG_ID) REFERENCES sendsms_config (ID)
) ;

CREATE INDEX FK_SENDSMS_HISTORY_CONFIG ON sendsms_history (CONFIG_ID);

-- ----------------------------
-- Records of sendsms_history
-- ----------------------------

-- ----------------------------
-- Table structure for sendsms_queue
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sendsms_queue';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sendsms_queue (
  ID number(19) DEFAULT '0' NOT NULL,
  MOBILE varchar2(50) DEFAULT NULL,
  MESSAGE varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  INFO varchar2(200) DEFAULT NULL,
  CONFIG_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_SENDSMS_QUEUE_CONFIG FOREIGN KEY (CONFIG_ID) REFERENCES sendsms_config (ID)
) ;

CREATE INDEX FK_SENDSMS_QUEUE_CONFIG ON sendsms_queue (CONFIG_ID);

-- ----------------------------
-- Records of sendsms_queue
-- ----------------------------

-- ----------------------------
-- Table structure for sign_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS sign_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE sign_info (
  ID number(19) NOT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  CATALOG varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  REF varchar2(100) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of sign_info
-- ----------------------------

-- ----------------------------
-- Table structure for store_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS store_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE store_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  MODEL varchar2(50) DEFAULT NULL,
  PATH varchar2(200) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  SIZE number(19) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  TENANT_ID varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of store_info
-- ----------------------------

-- ----------------------------
-- Table structure for task_conf_user
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_conf_user';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_conf_user (
  ID number(19) NOT NULL,
  BUSINESS_KEY varchar2(200) DEFAULT NULL,
  CODE varchar2(200) DEFAULT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of task_conf_user
-- ----------------------------

-- ----------------------------
-- Table structure for task_deadline
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_deadline';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_deadline (
  ID number(19) NOT NULL,
  TYPE varchar2(100) DEFAULT NULL,
  DEADLINE_TIME timestamp(0) DEFAULT NULL,
  TRIGGER_TIME timestamp(0) DEFAULT NULL,
  REPEAT_TIMES number(10) DEFAULT NULL,
  NOTIFICATION_TYPE varchar2(200) DEFAULT NULL,
  NOTIFICATION_RECEIVER varchar2(200) DEFAULT NULL,
  NOTIFICATION_TEMPLATE_CODE varchar2(200) DEFAULT NULL,
  REASSIGNMENT varchar2(200) DEFAULT NULL,
  OPERATION varchar2(200) DEFAULT NULL,
  TASK_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_DEADLINE_TASK FOREIGN KEY (TASK_ID) REFERENCES task_info (ID)
) ;

CREATE INDEX FK_TASK_DEADLINE_TASK ON task_deadline (TASK_ID);

-- ----------------------------
-- Records of task_deadline
-- ----------------------------

-- ----------------------------
-- Table structure for task_def_base
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_def_base';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_def_base (
  ID number(19) NOT NULL,
  CODE varchar2(100) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  PROCESS_DEFINITION_ID varchar2(200) DEFAULT NULL,
  FORM_KEY varchar2(200) DEFAULT NULL,
  FORM_TYPE varchar2(50) DEFAULT NULL,
  COUNTERSIGN_TYPE varchar2(50) DEFAULT NULL,
  COUNTERSIGN_USER varchar2(200) DEFAULT NULL,
  COUNTERSIGN_STRATEGY varchar2(50) DEFAULT NULL,
  COUNTERSIGN_RATE number(10) DEFAULT NULL,
  ASSIGN_STRATEGY varchar2(100) DEFAULT NULL,
  PROCESS_DEFINITION_KEY varchar2(100) DEFAULT NULL,
  PROCESS_DEFINITION_VERSION number(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of task_def_base
-- ----------------------------
INSERT INTO task_def_base VALUES ('1', 'taskuser-2', '部门领导审批', 'vacation:1:12', 'vacation-department', 'internal', null, null, null, null, null, 'vacation', '1');
INSERT INTO task_def_base VALUES ('2', 'taskuser-3', '人事审批', 'vacation:1:12', 'vacation-hr', 'internal', null, null, null, null, null, 'vacation', '1');
INSERT INTO task_def_base VALUES ('3', 'taskuser-6', '销假', 'vacation:1:12', 'vacation-finish', 'internal', null, null, null, null, null, 'vacation', '1');
INSERT INTO task_def_base VALUES ('4', 'usertask2', null, null, null, null, null, null, null, null, null, 'publish', '1');
INSERT INTO task_def_base VALUES ('5', 'usertask3', null, null, null, null, null, null, null, null, null, 'publish', '1');
INSERT INTO task_def_base VALUES ('101', 'usertask1', '发起申请', 'permission:1:4', 'permission-request', 'internal', null, null, null, null, null, 'permission', '1');
INSERT INTO task_def_base VALUES ('102', 'usertask2', '部门经理审批', 'permission:1:4', 'permission-department', 'internal', null, null, null, null, null, 'permission', '1');
INSERT INTO task_def_base VALUES ('103', 'usertask3', '总经理审批', 'permission:1:4', 'permission-manager', 'internal', null, null, null, null, null, 'permission', '1');
INSERT INTO task_def_base VALUES ('515741684334592', 'taskuser-1', '发文', 'publish:1:8', 'publish-request', 'internal', null, null, null, null, null, 'publish', '1');
INSERT INTO task_def_base VALUES ('515741685579776', 'taskuser-2', '部门领导审批', 'publish:1:8', 'publish-manager', 'internal', null, null, null, null, null, 'publish', '1');
INSERT INTO task_def_base VALUES ('515741686218752', 'taskuser-3', '会签', 'publish:1:8', 'publish-countersign', 'internal', 'parallel', null, 'percent', '100', null, 'publish', '1');
INSERT INTO task_def_base VALUES ('515741688152064', 'taskuser-6', '归档', 'publish:1:8', 'publish-finish', 'internal', null, null, null, null, null, 'publish', '1');
INSERT INTO task_def_base VALUES ('515741694803968', 'taskuser-1', '填写请假单', 'vacation:1:12', 'vacation-request', 'internal', null, null, null, null, null, 'vacation', '1');
INSERT INTO task_def_base VALUES ('515741695492096', 'taskuser-5', '调整申请', 'vacation:1:12', 'vacation-modify', 'internal', null, null, null, null, null, 'vacation', '1');

-- ----------------------------
-- Table structure for task_def_deadline
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_def_deadline';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_def_deadline (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  DURATION varchar2(100) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  ESCALATION_TYPE varchar2(50) DEFAULT NULL,
  NOTIFICATION_CONDITION varchar2(200) DEFAULT NULL,
  NOTIFICATION_TYPE varchar2(200) DEFAULT NULL,
  NOTIFICATION_RECEIVER varchar2(200) DEFAULT NULL,
  NOTIFICATION_TEMPLATE_CODE varchar2(200) DEFAULT NULL,
  REASSGINMENT varchar2(200) DEFAULT NULL,
  OPERATION varchar2(200) DEFAULT NULL,
  BASE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_DEF_DEADLINE_BASE FOREIGN KEY (BASE_ID) REFERENCES task_def_base (ID)
) ;

CREATE INDEX FK_TASK_DEF_DEADLINE_BASE ON task_def_deadline (BASE_ID);

-- ----------------------------
-- Records of task_def_deadline
-- ----------------------------
INSERT INTO task_def_deadline VALUES ('1', 'completion', 'PT1H', null, null, null, 'mail,msg', '任务接收人', 'timeout', null, null, '3');

-- ----------------------------
-- Table structure for task_def_escalation
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_def_escalation';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_def_escalation (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  ESCALATION_CONDITION varchar2(200) DEFAULT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  DEADLINE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_DEF_ESCALATION_DEADLINE FOREIGN KEY (DEADLINE_ID) REFERENCES task_def_deadline (ID)
) ;

CREATE INDEX FK_TASK_DEF_ESCALATION_DEADLINE ON task_def_escalation (DEADLINE_ID);

-- ----------------------------
-- Records of task_def_escalation
-- ----------------------------

-- ----------------------------
-- Table structure for task_def_notification
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_def_notification';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_def_notification (
  ID number(19) NOT NULL,
  EVENT_NAME varchar2(100) DEFAULT NULL,
  RECEIVER varchar2(200) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  TEMPLATE_CODE varchar2(200) DEFAULT NULL,
  BASE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_DEF_NOTIFICATION_BASE FOREIGN KEY (BASE_ID) REFERENCES task_def_base (ID)
) ;

CREATE INDEX FK_TASK_DEF_NOTIFICATION_BASE ON task_def_notification (BASE_ID);

-- ----------------------------
-- Records of task_def_notification
-- ----------------------------
INSERT INTO task_def_notification VALUES ('1', 'create', '任务接收人', 'mail,msg', 'arrival-assignee', '1');
INSERT INTO task_def_notification VALUES ('2', 'create', '流程发起人', 'mail,msg', 'arrival-initiator', '2');
INSERT INTO task_def_notification VALUES ('3', 'complete', '1', 'mail,msg', 'complete', '3');
INSERT INTO task_def_notification VALUES ('101', 'create', '任务接收人', 'mail,msg', 'arrival-assignee', '102');
INSERT INTO task_def_notification VALUES ('102', 'create', '任务接收人', 'mail,msg', 'arrival-assignee', '103');
INSERT INTO task_def_notification VALUES ('103', 'complete', '流程发起人', 'mail,msg', 'complete', '103');

-- ----------------------------
-- Table structure for task_def_operation
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_def_operation';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_def_operation (
  ID number(19) NOT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  BASE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_DEF_OPERATION_BASE FOREIGN KEY (BASE_ID) REFERENCES task_def_base (ID)
) ;

CREATE INDEX FK_TASK_DEF_OPERATION_BASE ON task_def_operation (BASE_ID);

-- ----------------------------
-- Records of task_def_operation
-- ----------------------------
INSERT INTO task_def_operation VALUES ('1', 'saveDraft', null, null, null, '1');
INSERT INTO task_def_operation VALUES ('2', 'completeTask', null, null, null, '1');
INSERT INTO task_def_operation VALUES ('3', 'saveDraft', null, null, null, '2');
INSERT INTO task_def_operation VALUES ('4', 'completeTask', null, null, null, '2');
INSERT INTO task_def_operation VALUES ('5', 'saveDraft', null, null, null, '3');
INSERT INTO task_def_operation VALUES ('6', 'completeTask', null, null, null, '3');
INSERT INTO task_def_operation VALUES ('7', 'saveDraft', null, null, null, '4');
INSERT INTO task_def_operation VALUES ('8', 'completeTask', null, null, null, '4');
INSERT INTO task_def_operation VALUES ('9', 'rollbackPrevious', null, null, null, '4');
INSERT INTO task_def_operation VALUES ('10', 'saveDraft', null, null, null, '5');
INSERT INTO task_def_operation VALUES ('11', 'completeTask ', null, null, null, '5');
INSERT INTO task_def_operation VALUES ('12', 'rollbackPrevious', null, null, null, '3');
INSERT INTO task_def_operation VALUES ('101', 'saveDraft', null, null, null, '102');
INSERT INTO task_def_operation VALUES ('102', 'completeTask', null, null, null, '102');
INSERT INTO task_def_operation VALUES ('103', 'rollbackPrevious', null, null, null, '102');
INSERT INTO task_def_operation VALUES ('104', 'rollbackInitiator', null, null, null, '102');
INSERT INTO task_def_operation VALUES ('105', 'transfer', null, null, null, '102');
INSERT INTO task_def_operation VALUES ('106', 'delegateTask', null, null, null, '102');
INSERT INTO task_def_operation VALUES ('107', 'communicate', null, null, null, '102');
INSERT INTO task_def_operation VALUES ('108', 'addCounterSign', null, null, null, '102');
INSERT INTO task_def_operation VALUES ('201', 'saveDraft', null, null, null, '103');
INSERT INTO task_def_operation VALUES ('202', 'completeTask', null, null, null, '103');
INSERT INTO task_def_operation VALUES ('203', 'rollbackPrevious', null, null, null, '103');
INSERT INTO task_def_operation VALUES ('204', 'rollbackInitiator', null, null, null, '103');
INSERT INTO task_def_operation VALUES ('205', 'transfer', null, null, null, '103');
INSERT INTO task_def_operation VALUES ('206', 'delegateTask', null, null, null, '103');
INSERT INTO task_def_operation VALUES ('207', 'communicate', null, null, null, '103');
INSERT INTO task_def_operation VALUES ('208', 'addCounterSign', null, null, null, '103');

-- ----------------------------
-- Table structure for task_def_user
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_def_user';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_def_user (
  ID number(19) NOT NULL,
  VALUE varchar2(200) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  CATALOG varchar2(200) DEFAULT NULL,
  BASE_ID number(19) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_DEF_USER_BASE FOREIGN KEY (BASE_ID) REFERENCES task_def_base (ID)
) ;

CREATE INDEX FK_TASK_DEF_USER_BASE ON task_def_user (BASE_ID);

-- ----------------------------
-- Records of task_def_user
-- ----------------------------
INSERT INTO task_def_user VALUES ('515741671440384', '常用语:流程发起人', 'user', 'assignee', '101', null);
INSERT INTO task_def_user VALUES ('515741672521728', '岗位:经理', 'user', 'assignee', '102', null);
INSERT INTO task_def_user VALUES ('515741677027328', '岗位:总经理', 'user', 'assignee', '103', null);
INSERT INTO task_def_user VALUES ('515741685383168', '常用语:流程发起人', 'user', 'assignee', '515741684334592', null);
INSERT INTO task_def_user VALUES ('515741685661696', '常用语:直接上级', 'user', 'assignee', '515741685579776', null);
INSERT INTO task_def_user VALUES ('515741686398976', '${countersignUser}', 'user', 'assignee', '515741686218752', null);
INSERT INTO task_def_user VALUES ('515741688299520', '常用语:流程发起人', 'user', 'assignee', '515741688152064', null);
INSERT INTO task_def_user VALUES ('515741694885888', '常用语:流程发起人', 'user', 'assignee', '515741694803968', null);
INSERT INTO task_def_user VALUES ('515741695098880', '常用语:直接上级', 'user', 'assignee', '1', null);
INSERT INTO task_def_user VALUES ('515741695344640', '7', 'user', 'assignee', '2', null);
INSERT INTO task_def_user VALUES ('515741695623168', '常用语:流程发起人', 'user', 'assignee', '515741695492096', null);
INSERT INTO task_def_user VALUES ('515741696032768', '常用语:流程发起人', 'user', 'assignee', '3', null);

-- ----------------------------
-- Table structure for task_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_info (
  ID number(19) NOT NULL,
  BUSINESS_KEY varchar2(100) DEFAULT NULL,
  CODE varchar2(100) DEFAULT NULL,
  NAME varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  CATEGORY varchar2(200) DEFAULT NULL,
  FORM varchar2(100) DEFAULT NULL,
  TENANT_ID varchar2(100) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  SUSPEND_STATUS varchar2(50) DEFAULT NULL,
  DELEGATE_STATUS varchar2(50) DEFAULT NULL,
  COMPLETE_STATUS varchar2(50) DEFAULT NULL,
  SKIP_STATUS varchar2(50) DEFAULT NULL,
  ESCALATE_STATUS varchar2(50) DEFAULT NULL,
  COPY_STATUS varchar2(50) DEFAULT NULL,
  COPY_TASK_ID varchar2(64) DEFAULT NULL,
  PRESENTATION_NAME varchar2(200) DEFAULT NULL,
  PRESENTATION_SUBJECT varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  ACTIVATION_TIME timestamp(0) DEFAULT NULL,
  CLAIM_TIME timestamp(0) DEFAULT NULL,
  COMPLETE_TIME timestamp(0) DEFAULT NULL,
  EXPIRATION_TIME timestamp(0) DEFAULT NULL,
  LAST_MODIFIED_TIME timestamp(0) DEFAULT NULL,
  DURATION varchar2(50) DEFAULT NULL,
  CREATOR varchar2(64) DEFAULT NULL,
  INITIATOR varchar2(64) DEFAULT NULL,
  ASSIGNEE varchar2(64) DEFAULT NULL,
  OWNER varchar2(64) DEFAULT NULL,
  LAST_MODIFIER varchar2(64) DEFAULT NULL,
  SWIMLANE varchar2(100) DEFAULT NULL,
  PARENT_ID number(19) DEFAULT NULL,
  TASK_ID varchar2(200) DEFAULT NULL,
  EXECUTION_ID varchar2(200) DEFAULT NULL,
  PROCESS_INSTANCE_ID varchar2(200) DEFAULT NULL,
  PROCESS_DEFINITION_ID varchar2(200) DEFAULT NULL,
  ATTR1 varchar2(100) DEFAULT NULL,
  ATTR2 varchar2(100) DEFAULT NULL,
  ATTR3 varchar2(100) DEFAULT NULL,
  ATTR4 varchar2(100) DEFAULT NULL,
  ATTR5 varchar2(100) DEFAULT NULL,
  PROCESS_BUSINESS_KEY varchar2(200) DEFAULT NULL,
  PROCESS_STARTER varchar2(64) DEFAULT NULL,
  CATALOG varchar2(100) DEFAULT NULL,
  ACTION varchar2(200) DEFAULT NULL,
  COMMENT varchar2(200) DEFAULT NULL,
  MESSAGE varchar2(200) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_INFO_PARENT FOREIGN KEY (PARENT_ID) REFERENCES task_info (ID)
) ;

CREATE INDEX FK_TASK_INFO_PARENT ON task_info (PARENT_ID);

-- ----------------------------
-- Records of task_info
-- ----------------------------

-- ----------------------------
-- Table structure for task_log
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_log';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_log (
  ID number(19) NOT NULL,
  EVENT_TYPE varchar2(100) DEFAULT NULL,
  EVENT_TIME timestamp(0) DEFAULT NULL,
  CREATOR varchar2(64) DEFAULT NULL,
  START_OWNER varchar2(64) DEFAULT NULL,
  END_OWNER varchar2(64) DEFAULT NULL,
  TASK_STATUS varchar2(50) DEFAULT NULL,
  CONTENT clob,
  PRIORITY number(10) DEFAULT NULL,
  TASK_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_LOG_TASK FOREIGN KEY (TASK_ID) REFERENCES task_info (ID)
) ;

CREATE INDEX FK_TASK_LOG_TASK ON task_log (TASK_ID);

-- ----------------------------
-- Records of task_log
-- ----------------------------

-- ----------------------------
-- Table structure for task_participant
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS task_participant';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE task_participant (
  ID number(19) NOT NULL,
  CATEGORY varchar2(200) DEFAULT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  TASK_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TASK_PARTICIPANT_TASK FOREIGN KEY (TASK_ID) REFERENCES task_info (ID)
) ;

CREATE INDEX FK_TASK_PARTICIPANT_TASK ON task_participant (TASK_ID);

-- ----------------------------
-- Records of task_participant
-- ----------------------------

-- ----------------------------
-- Table structure for template_field
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS template_field';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE template_field (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  CONTENT clob,
  INFO_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_TEMPLATE_FIELD_INFO FOREIGN KEY (INFO_ID) REFERENCES template_info (ID)
) ;

CREATE INDEX FK_TEMPLATE_FIELD_INFO ON template_field (INFO_ID);

-- ----------------------------
-- Records of template_field
-- ----------------------------
INSERT INTO template_field VALUES ('1', 'subject', null, '${humanTask.presentationSubject}需要您审批', '1', '1');
INSERT INTO template_field VALUES ('2', 'content', null, '${task.assignee}您好，您有新任务需要处理——${humanTask.presentationSubject}。<br><a href="${baseUrl}/operation/task-operation-viewTaskForm.do?humanTaskId=${humanTask.id?c}">${baseUrl}/operation/task-operation-viewTaskForm.do?humanTaskId=${humanTask.id?c}</a>', '1', '1');
INSERT INTO template_field VALUES ('3', 'subject', null, '您的流程${humanTask.presentationSubject}已经到达${task.name}环节', '2', '1');
INSERT INTO template_field VALUES ('4', 'content', null, '${initiator}您好，您的流程${humanTask.presentationSubject}已经到达${task.name}环节。<br><a href="${baseUrl}/bpm/workspace-viewHistory.do?processInstanceId=${humanTask.processInstanceId}">${baseUrl}/bpm/workspace-viewHistory.do?processInstanceId=${humanTask.processInstanceId}</a>', '2', '1');
INSERT INTO template_field VALUES ('5', 'subject', null, '您的流程${humanTask.presentationSubject}已经完成${task.name}环节', '3', '1');
INSERT INTO template_field VALUES ('6', 'content', null, '${initiator}您好，您的流程${humanTask.presentationSubject}已经完成${task.name}环节。<br><a href="${baseUrl}/bpm/workspace-viewHistory.do?processInstanceId=${humanTask.processInstanceId}">${baseUrl}/bpm/workspace-viewHistory.do?processInstanceId=${humanTask.processInstanceId}</a>', '3', '1');
INSERT INTO template_field VALUES ('7', 'subject', null, '您负责的任务${humanTask.presentationSubject}即将过期', '4', '1');
INSERT INTO template_field VALUES ('8', 'content', null, '${task.assignee}您好，您负责的任务${humanTask.presentationSubject}即将过期。<br><a href="${baseUrl}/operation/task-operation-viewTaskForm.do?humanTaskId=${humanTask.id?c}">${baseUrl}/operation/task-operation-viewTaskForm.do?humanTaskId=${humanTask.id?c}</a>', '4', '1');

-- ----------------------------
-- Table structure for template_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS template_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE template_info (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  CODE varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of template_info
-- ----------------------------
INSERT INTO template_info VALUES ('1', '任务到达（任务处理人）', 'arrival-assignee', '1');
INSERT INTO template_info VALUES ('2', '任务到达（流程发起人）', 'arrival-initiator', '1');
INSERT INTO template_info VALUES ('3', '任务完成', 'complete', '1');
INSERT INTO template_info VALUES ('4', '任务超时提醒', 'timeout', '1');

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS user_account';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE user_account (
  ID number(19) NOT NULL,
  USERNAME varchar2(50) DEFAULT NULL,
  PASSWORD varchar2(50) DEFAULT NULL,
  SCOPE_ID varchar2(50) DEFAULT NULL,
  USER_BASE_ID number(19) DEFAULT NULL,
  TYPE_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_USER_ACCOUNT_TYPE FOREIGN KEY (TYPE_ID) REFERENCES user_account_type (ID),
  CONSTRAINT FK_USER_ACCOUNT_USER_BASE FOREIGN KEY (USER_BASE_ID) REFERENCES user_base (ID)
) ;

CREATE INDEX FK_USER_ACCOUNT_TYPE ON user_account (TYPE_ID);
CREATE INDEX FK_USER_ACCOUNT_USER_BASE ON user_account (USER_BASE_ID);

-- ----------------------------
-- Records of user_account
-- ----------------------------

-- ----------------------------
-- Table structure for user_account_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS user_account_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE user_account_type (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  SCOPE_ID varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of user_account_type
-- ----------------------------

-- ----------------------------
-- Table structure for user_attr
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS user_attr';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE user_attr (
  ID number(19) NOT NULL,
  BOOLEAN_VALUE number(10) DEFAULT NULL,
  DATE_VALUE timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  LONG_VALUE number(19) DEFAULT NULL,
  DOUBLE_VALUE binary_double DEFAULT NULL,
  STRING_VALUE varchar2(200) DEFAULT NULL,
  USER_BASE_ID number(19) DEFAULT NULL,
  USER_SCHEMA_ID number(19) DEFAULT NULL,
  SCOPE_ID varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_USER_ATTR_USER_BASE FOREIGN KEY (USER_BASE_ID) REFERENCES user_base (ID),
  CONSTRAINT FK_USER_ATTR_USER_SCHEMA FOREIGN KEY (USER_SCHEMA_ID) REFERENCES user_schema (ID)
) ;

CREATE INDEX FK_USER_ATTR_USER_BASE ON user_attr (USER_BASE_ID);
CREATE INDEX FK_USER_ATTR_USER_SCHEMA ON user_attr (USER_SCHEMA_ID);

-- ----------------------------
-- Records of user_attr
-- ----------------------------

-- ----------------------------
-- Table structure for user_base
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS user_base';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE user_base (
  ID number(19) NOT NULL,
  USERNAME varchar2(50) DEFAULT NULL,
  DISPLAY_NAME varchar2(50) DEFAULT NULL,
  PASSWORD varchar2(50) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  USER_REPO_ID number(19) DEFAULT NULL,
  SCOPE_ID varchar2(50) DEFAULT NULL,
  EMAIL varchar2(100) DEFAULT NULL,
  MOBILE varchar2(50) DEFAULT NULL,
  first_name varchar2(50) DEFAULT NULL,
  last_name varchar2(50) DEFAULT NULL,
  full_name varchar2(50) DEFAULT NULL,
  nick_name varchar2(50) DEFAULT NULL,
  avatar varchar2(200) DEFAULT NULL,
  description varchar2(200) DEFAULT NULL,
  gender varchar2(10) DEFAULT NULL,
  birthday date DEFAULT NULL,
  location varchar2(50) DEFAULT NULL,
  station varchar2(50) DEFAULT NULL,
  telephone varchar2(50) DEFAULT NULL,
  language varchar2(50) DEFAULT NULL,
  country varchar2(50) DEFAULT NULL,
  timezone varchar2(50) DEFAULT NULL,
  employee_no varchar2(64) DEFAULT NULL,
  card_no varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_USER_BASE_REPO FOREIGN KEY (USER_REPO_ID) REFERENCES user_repo (ID)
) ;

CREATE INDEX FK_USER_BASE_REPO ON user_base (USER_REPO_ID);

-- ----------------------------
-- Records of user_base
-- ----------------------------
INSERT INTO user_base VALUES ('1', 'lingo', '临远', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '1', '1', '1', '1', 'lingo.devaeye@gmail.com', '18012345678', null, null, null, '临远', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO user_base VALUES ('2', 'vivian', '薇薇安', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '1', '2', '1', '1', 'vivian.devaeye@gmail.com', '18012345678', null, null, null, '薇薇安', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO user_base VALUES ('3', 'steven', '史蒂文', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '1', '3', '1', '1', 'demo.devaeye@gmail.com', '18012345678', null, null, null, '史蒂文', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO user_base VALUES ('4', 'king', '金', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '1', '4', '1', '1', 'demo.devaeye@gmail.com', '18012345678', null, null, null, '金', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO user_base VALUES ('5', 'john', '约翰', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '1', '5', '1', '1', 'demo.devaeye@gmail.com', '18012345678', null, null, null, '约翰', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO user_base VALUES ('6', 'william', '威廉', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '1', '6', '1', '1', 'demo.devaeye@gmail.com', '18012345678', null, null, null, '威廉', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO user_base VALUES ('7', 'adam', '亚当', 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '1', '7', '1', '1', 'demo.devaeye@gmail.com', '18012345678', null, null, null, '亚当', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO user_base VALUES ('8', 'robot', null, 'a1ccdbc7f295e0aeda5dc4e0f2677ea3', '1', '1', '1', '1', null, null, null, null, null, '罗伯特', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_repo
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS user_repo';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE user_repo (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(50) DEFAULT NULL,
  ref varchar2(200) DEFAULT NULL,
  SCOPE_ID varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of user_repo
-- ----------------------------
INSERT INTO user_repo VALUES ('1', 'default', '默认', '1', '1');

-- ----------------------------
-- Table structure for user_schema
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS user_schema';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE user_schema (
  ID number(19) NOT NULL,
  CODE varchar2(50) DEFAULT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  READ_ONLY number(10) DEFAULT NULL,
  NOT_NULL number(10) DEFAULT NULL,
  UNIQUE_CONSTRAINT number(10) DEFAULT NULL,
  VALIDATOR varchar2(200) DEFAULT NULL,
  CONVERSION_PATTERN varchar2(200) DEFAULT NULL,
  MULTIPLE number(10) DEFAULT NULL,
  ENUMERATION_KEYS varchar2(200) DEFAULT NULL,
  ENUMERATION_VALUES varchar2(200) DEFAULT NULL,
  USER_REPO_ID number(19) DEFAULT NULL,
  SCOPE_ID varchar2(50) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_USER_SCHEMA_REPO FOREIGN KEY (USER_REPO_ID) REFERENCES user_repo (ID)
) ;

CREATE INDEX FK_USER_SCHEMA_REPO ON user_schema (USER_REPO_ID);

-- ----------------------------
-- Records of user_schema
-- ----------------------------

-- ----------------------------
-- Table structure for visitor_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS visitor_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE visitor_info (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  MOBILE varchar2(50) DEFAULT NULL,
  COMPANY_NAME varchar2(200) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  VISIT_TIME timestamp(0) DEFAULT NULL,
  LEAVE_TIME timestamp(0) DEFAULT NULL,
  ENTER_TIME timestamp(0) DEFAULT NULL,
  STATUS number(10) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of visitor_info
-- ----------------------------

-- ----------------------------
-- Table structure for vote_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS vote_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE vote_info (
  ID number(19) NOT NULL,
  NAME varchar2(100) DEFAULT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  STATUS varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of vote_info
-- ----------------------------

-- ----------------------------
-- Table structure for vote_item
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS vote_item';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE vote_item (
  ID number(19) NOT NULL,
  NAME varchar2(100) DEFAULT NULL,
  STYLE varchar2(50) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  HEAD_COUNT number(10) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_VOTE_ITEM_INFO FOREIGN KEY (INFO_ID) REFERENCES vote_info (ID)
) ;

CREATE INDEX FK_VOTE_ITEM_INFO ON vote_item (INFO_ID);

-- ----------------------------
-- Records of vote_item
-- ----------------------------

-- ----------------------------
-- Table structure for vote_user
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS vote_user';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE vote_user (
  ID number(19) NOT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  ITEM_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_VOTE_USER_ITEM FOREIGN KEY (ITEM_ID) REFERENCES vote_item (ID)
) ;

CREATE INDEX FK_VOTE_USER_ITEM ON vote_user (ITEM_ID);

-- ----------------------------
-- Records of vote_user
-- ----------------------------

-- ----------------------------
-- Table structure for whitelist_app
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS whitelist_app';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE whitelist_app (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TYPE_ID number(19) DEFAULT NULL,
  USER_ID varchar2(50) DEFAULT NULL,
  DESCRIPTION varchar2(200) DEFAULT NULL,
  FORCE_RELOGIN number(10) DEFAULT NULL,
  CODE varchar2(64) DEFAULT NULL,
  USERNAME varchar2(64) DEFAULT NULL,
  PASSWORD varchar2(200) DEFAULT NULL,
  LEVEL number(10) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_WHITELIST_APP_TYPE FOREIGN KEY (TYPE_ID) REFERENCES whitelist_type (ID)
) ;

CREATE INDEX FK_WHITELIST_APP_TYPE ON whitelist_app (TYPE_ID);

-- ----------------------------
-- Records of whitelist_app
-- ----------------------------

-- ----------------------------
-- Table structure for whitelist_host
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS whitelist_host';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE whitelist_host (
  ID number(19) NOT NULL,
  VALUE varchar2(50) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  APP_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_WHITELIST_HOST_APP FOREIGN KEY (APP_ID) REFERENCES whitelist_app (ID)
) ;

CREATE INDEX FK_WHITELIST_HOST_APP ON whitelist_host (APP_ID);

-- ----------------------------
-- Records of whitelist_host
-- ----------------------------

-- ----------------------------
-- Table structure for whitelist_ip
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS whitelist_ip';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE whitelist_ip (
  ID number(19) NOT NULL,
  VALUE varchar2(50) DEFAULT NULL,
  PRIORITY number(10) DEFAULT NULL,
  APP_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_WHITELIST_IP_APP FOREIGN KEY (APP_ID) REFERENCES whitelist_app (ID)
) ;

CREATE INDEX FK_WHITELIST_IP_APP ON whitelist_ip (APP_ID);

-- ----------------------------
-- Records of whitelist_ip
-- ----------------------------

-- ----------------------------
-- Table structure for whitelist_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS whitelist_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE whitelist_type (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  CODE varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of whitelist_type
-- ----------------------------

-- ----------------------------
-- Table structure for work_report_acl
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS work_report_acl';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE work_report_acl (
  ID number(19) NOT NULL,
  TYPE varchar2(200) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_WORK_REPORT_ACL_INFO FOREIGN KEY (INFO_ID) REFERENCES work_report_info (ID)
) ;

CREATE INDEX FK_WORK_REPORT_ACL_INFO ON work_report_acl (INFO_ID);

-- ----------------------------
-- Records of work_report_acl
-- ----------------------------

-- ----------------------------
-- Table structure for work_report_attachment
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS work_report_attachment';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE work_report_attachment (
  ID number(19) NOT NULL,
  NAME varchar2(200) DEFAULT NULL,
  FILE_SIZE number(19) DEFAULT NULL,
  REF varchar2(200) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  INFO_ID number(19) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_WORK_REPORT_ATTACHMENT_INFO FOREIGN KEY (INFO_ID) REFERENCES work_report_info (ID)
) ;

CREATE INDEX FK_WORK_REPORT_ATTACHMENT_INFO ON work_report_attachment (INFO_ID);

-- ----------------------------
-- Records of work_report_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for work_report_info
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS work_report_info';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE work_report_info (
  ID number(19) NOT NULL,
  TYPE varchar2(50) DEFAULT NULL,
  CONTENT varchar2(200) DEFAULT NULL,
  REPORT_DATE date DEFAULT NULL,
  CREATE_TIME timestamp(0) DEFAULT NULL,
  USER_ID varchar2(64) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of work_report_info
-- ----------------------------

-- ----------------------------
-- Table structure for workcal_part
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS workcal_part';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE workcal_part (
  ID number(19) NOT NULL,
  SHIFT number(10) DEFAULT NULL,
  START_TIME varchar2(5) DEFAULT NULL,
  END_TIME varchar2(5) DEFAULT NULL,
  RULE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_WORKCAL_PART_RULE FOREIGN KEY (RULE_ID) REFERENCES workcal_rule (ID)
) ;

CREATE INDEX FK_WORKCAL_PART_RULE ON workcal_part (RULE_ID);

-- ----------------------------
-- Records of workcal_part
-- ----------------------------
INSERT INTO workcal_part VALUES ('1', '0', '9:00', '12:00', '1', '1');
INSERT INTO workcal_part VALUES ('2', '1', '13:00', '18:00', '1', '1');
INSERT INTO workcal_part VALUES ('3', '0', '9:00', '12:00', '2', '1');
INSERT INTO workcal_part VALUES ('4', '1', '13:00', '18:00', '2', '1');
INSERT INTO workcal_part VALUES ('5', '0', '9:00', '12:00', '3', '1');
INSERT INTO workcal_part VALUES ('6', '1', '13:00', '18:00', '3', '1');
INSERT INTO workcal_part VALUES ('7', '0', '9:00', '12:00', '4', '1');
INSERT INTO workcal_part VALUES ('8', '1', '13:00', '18:00', '4', '1');
INSERT INTO workcal_part VALUES ('9', '0', '9:00', '12:00', '5', '1');
INSERT INTO workcal_part VALUES ('10', '1', '13:00', '18:00', '5', '1');
INSERT INTO workcal_part VALUES ('11', '0', '9:00', '12:00', '12', '1');
INSERT INTO workcal_part VALUES ('12', '1', '13:00', '18:00', '12', '1');
INSERT INTO workcal_part VALUES ('13', '0', '9:00', '12:00', '20', '1');
INSERT INTO workcal_part VALUES ('14', '1', '13:00', '18:00', '20', '1');
INSERT INTO workcal_part VALUES ('15', '0', '9:00', '12:00', '26', '1');
INSERT INTO workcal_part VALUES ('16', '1', '13:00', '18:00', '26', '1');
INSERT INTO workcal_part VALUES ('17', '0', '9:00', '12:00', '29', '1');
INSERT INTO workcal_part VALUES ('18', '1', '13:00', '18:00', '29', '1');
INSERT INTO workcal_part VALUES ('19', '0', '9:00', '12:00', '37', '1');
INSERT INTO workcal_part VALUES ('20', '1', '13:00', '18:00', '37', '1');
INSERT INTO workcal_part VALUES ('21', '0', '9:00', '12:00', '6', '1');
INSERT INTO workcal_part VALUES ('22', '1', '13:00', '18:00', '6', '1');
INSERT INTO workcal_part VALUES ('23', '0', '9:00', '12:00', '7', '1');
INSERT INTO workcal_part VALUES ('24', '1', '13:00', '18:00', '7', '1');
INSERT INTO workcal_part VALUES ('25', '0', '9:00', '12:00', '8', '1');
INSERT INTO workcal_part VALUES ('26', '1', '13:00', '18:00', '8', '1');
INSERT INTO workcal_part VALUES ('27', '0', '9:00', '12:00', '9', '1');
INSERT INTO workcal_part VALUES ('28', '1', '13:00', '18:00', '9', '1');
INSERT INTO workcal_part VALUES ('29', '0', '9:00', '12:00', '10', '1');
INSERT INTO workcal_part VALUES ('30', '1', '13:00', '18:00', '10', '1');
INSERT INTO workcal_part VALUES ('31', '0', '9:00', '12:00', '43', '1');
INSERT INTO workcal_part VALUES ('32', '1', '13:00', '18:00', '43', '1');
INSERT INTO workcal_part VALUES ('33', '0', '9:00', '12:00', '44', '1');
INSERT INTO workcal_part VALUES ('34', '1', '13:00', '18:00', '44', '1');
INSERT INTO workcal_part VALUES ('35', '0', '9:00', '12:00', '52', '1');
INSERT INTO workcal_part VALUES ('36', '1', '13:00', '18:00', '52', '1');
INSERT INTO workcal_part VALUES ('37', '0', '9:00', '12:00', '69', null);
INSERT INTO workcal_part VALUES ('38', '1', '13:00', '18:00', '69', null);
INSERT INTO workcal_part VALUES ('39', '0', '9:00', '12:00', '70', null);
INSERT INTO workcal_part VALUES ('40', '1', '13:00', '18:00', '70', null);
INSERT INTO workcal_part VALUES ('1601', '0', '9:00', '12:00', '1601', '1');
INSERT INTO workcal_part VALUES ('1602', '1', '13:00', '18:00', '1601', '1');
INSERT INTO workcal_part VALUES ('1603', '0', '9:00', '12:00', '1602', '1');
INSERT INTO workcal_part VALUES ('1604', '1', '13:00', '18:00', '1602', '1');
INSERT INTO workcal_part VALUES ('1605', '0', '9:00', '12:00', '1603', '1');
INSERT INTO workcal_part VALUES ('1606', '1', '13:00', '18:00', '1603', '1');
INSERT INTO workcal_part VALUES ('1607', '0', '9:00', '12:00', '1604', '1');
INSERT INTO workcal_part VALUES ('1608', '1', '13:00', '18:00', '1604', '1');
INSERT INTO workcal_part VALUES ('1609', '0', '9:00', '12:00', '1605', '1');
INSERT INTO workcal_part VALUES ('1610', '1', '13:00', '18:00', '1605', '1');
INSERT INTO workcal_part VALUES ('1611', '0', '9:00', '12:00', '1612', '1');
INSERT INTO workcal_part VALUES ('1612', '1', '13:00', '18:00', '1612', '1');
INSERT INTO workcal_part VALUES ('1613', '0', '9:00', '12:00', '1620', '1');
INSERT INTO workcal_part VALUES ('1614', '1', '13:00', '18:00', '1620', '1');
INSERT INTO workcal_part VALUES ('1615', '0', '9:00', '12:00', '1626', '1');
INSERT INTO workcal_part VALUES ('1616', '1', '13:00', '18:00', '1626', '1');
INSERT INTO workcal_part VALUES ('1617', '0', '9:00', '12:00', '1629', '1');
INSERT INTO workcal_part VALUES ('1618', '1', '13:00', '18:00', '1629', '1');
INSERT INTO workcal_part VALUES ('1619', '0', '9:00', '12:00', '1635', '1');
INSERT INTO workcal_part VALUES ('1620', '1', '13:00', '18:00', '1635', '1');
INSERT INTO workcal_part VALUES ('1621', '0', '9:00', '12:00', '1636', '1');
INSERT INTO workcal_part VALUES ('1622', '1', '13:00', '18:00', '1636', '1');

-- ----------------------------
-- Table structure for workcal_rule
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS workcal_rule';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE workcal_rule (
  ID number(19) NOT NULL,
  YEAR number(10) DEFAULT NULL,
  WEEK number(10) DEFAULT NULL,
  NAME varchar2(50) DEFAULT NULL,
  WORK_DATE timestamp(0) DEFAULT SYSTIMESTAMP NOT NULL,
  STATUS number(10) DEFAULT NULL,
  TYPE_ID number(19) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
 ,
  CONSTRAINT FK_WORKCAL_RULE_TYPE FOREIGN KEY (TYPE_ID) REFERENCES workcal_type (ID)
) ;

CREATE INDEX FK_WORKCAL_RULE_TYPE ON workcal_rule (TYPE_ID);

-- ----------------------------
-- Records of workcal_rule
-- ----------------------------
INSERT INTO workcal_rule VALUES ('1', '2014', '2', '周一', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('2', '2014', '3', '周二', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('3', '2014', '4', '周三', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('4', '2014', '5', '周四', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('5', '2014', '6', '周五', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('6', '2015', '2', '周一', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('7', '2015', '3', '周二', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('8', '2015', '4', '周三', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('9', '2015', '5', '周四', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('10', '2015', '6', '周五', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('11', '2014', null, '元旦', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('12', '2014', null, '春节调休', '2017-02-12 19:06:57', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('13', '2014', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('14', '2014', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('15', '2014', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('16', '2014', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('17', '2014', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('18', '2014', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('19', '2014', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('20', '2014', null, '春节调休', '2017-02-12 19:06:57', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('21', '2014', null, '清明节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('22', '2014', null, '清明节补休', '2017-02-12 19:06:57', '3', '1', '1');
INSERT INTO workcal_rule VALUES ('23', '2014', null, '劳动节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('24', '2014', null, '劳动节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('25', '2014', null, '劳动节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('26', '2014', null, '劳动节调休', '2017-02-12 19:06:57', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('27', '2014', null, '端午节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('28', '2014', null, '中秋节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('29', '2014', null, '国庆节调休', '2017-02-12 19:06:57', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('30', '2014', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('31', '2014', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('32', '2014', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('33', '2014', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('34', '2014', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('35', '2014', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('36', '2014', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('37', '2014', null, '国庆节调休', '2017-02-12 19:06:57', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('41', '2015', null, '元旦', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('42', '2015', null, '元旦补休', '2017-02-12 19:06:57', '3', '1', '1');
INSERT INTO workcal_rule VALUES ('43', '2015', null, '元旦调休', '2017-02-12 19:06:57', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('44', '2015', null, '春节调休', '2017-02-12 19:06:57', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('45', '2015', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('46', '2015', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('47', '2015', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('48', '2015', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('49', '2015', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('50', '2015', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('51', '2015', null, '春节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('52', '2015', null, '春节调休', '2017-02-12 19:06:57', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('53', '2015', null, '清明节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('54', '2015', null, '清明节补休', '2017-02-12 19:06:57', '3', '1', '1');
INSERT INTO workcal_rule VALUES ('55', '2015', null, '劳动节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('56', '2015', null, '端午节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('57', '2015', null, '端午节补休', '2017-02-12 19:06:57', '3', '1', '1');
INSERT INTO workcal_rule VALUES ('58', '2015', null, '中秋节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('60', '2015', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('61', '2015', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('62', '2015', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('63', '2015', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('64', '2015', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('65', '2015', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('66', '2015', null, '国庆节', '2017-02-12 19:06:57', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('67', '2015', null, '胜利日', '2015-09-03 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('68', '2015', null, '胜利日补休', '2015-09-04 00:00:00', '3', '1', '1');
INSERT INTO workcal_rule VALUES ('69', '2015', null, '胜利日调休', '2015-09-06 00:00:00', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('70', '2015', null, '国庆节调休', '2015-10-10 00:00:00', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('1601', '2016', '2', '周一', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('1602', '2016', '3', '周二', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('1603', '2016', '4', '周三', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('1604', '2016', '5', '周四', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('1605', '2016', '6', '周五', '2017-02-12 19:06:57', '0', '1', '1');
INSERT INTO workcal_rule VALUES ('1611', '2016', null, '元旦', '2016-01-01 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1612', '2016', null, '春节调休', '2016-02-06 00:00:00', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('1613', '2016', null, '春节', '2016-02-07 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1614', '2016', null, '春节', '2016-02-08 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1615', '2016', null, '春节', '2016-02-09 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1616', '2016', null, '春节', '2016-02-10 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1617', '2016', null, '春节', '2016-02-11 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1618', '2016', null, '春节', '2016-02-12 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1619', '2016', null, '春节', '2016-02-13 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1620', '2016', null, '春节调休', '2016-02-14 00:00:00', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('1621', '2016', null, '清明节', '2016-04-04 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1622', '2016', null, '劳动节', '2016-05-01 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1623', '2016', null, '劳动节补休', '2016-05-02 00:00:00', '3', '1', '1');
INSERT INTO workcal_rule VALUES ('1624', '2016', null, '端午节', '2016-06-09 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1625', '2016', null, '端午节补休', '2016-06-10 00:00:00', '3', '1', '1');
INSERT INTO workcal_rule VALUES ('1626', '2016', null, '端午节调休', '2016-06-12 00:00:00', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('1627', '2016', null, '中秋节', '2016-09-15 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1628', '2016', null, '中秋节补休', '2016-09-16 00:00:00', '3', '1', '1');
INSERT INTO workcal_rule VALUES ('1629', '2016', null, '中秋节调休', '2016-09-18 00:00:00', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('1630', '2016', null, '国庆节', '2016-10-03 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1631', '2016', null, '国庆节', '2016-10-04 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1632', '2016', null, '国庆节', '2016-10-05 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1633', '2016', null, '国庆节', '2016-10-06 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1634', '2016', null, '国庆节', '2016-10-07 00:00:00', '1', '1', '1');
INSERT INTO workcal_rule VALUES ('1635', '2016', null, '国庆节调休', '2016-10-08 00:00:00', '2', '1', '1');
INSERT INTO workcal_rule VALUES ('1636', '2016', null, '国庆节调休', '2016-10-09 00:00:00', '2', '1', '1');

-- ----------------------------
-- Table structure for workcal_type
-- ----------------------------
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE IF EXISTS workcal_type';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE workcal_type (
  ID number(19) NOT NULL,
  NAME varchar2(50) DEFAULT NULL,
  TENANT_ID varchar2(64) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- ----------------------------
-- Records of workcal_type
-- ----------------------------
INSERT INTO workcal_type VALUES ('1', '默认', '1');
