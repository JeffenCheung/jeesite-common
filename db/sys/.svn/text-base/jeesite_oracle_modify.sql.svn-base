
/* modify Tables */

-- V1.2.10 add fields from CRSC-CCIP by jeffen@pactera 2015/11/01 start
-- Add/modify columns 
alter table SYS_USER add FLOOR_ID VARCHAR2(64) default '0' not null;
alter table SYS_USER add USER_LEVEL NUMBER(1,0) default 1 not null;
alter table SYS_USER add SSID NVARCHAR2(50);
alter table SYS_USER add ACCOUNT_TYPE NUMBER(1,0) default 0 not null;
alter table SYS_USER add POST_ID VARCHAR2(64) default '0' not null;
-- Add comments to the columns 
comment on column SYS_USER.FLOOR_ID
  is '楼层ID';
comment on column SYS_USER.USER_LEVEL
  is '等级（1~9，数字越高代表等级越高）';
comment on column SYS_USER.SSID
  is 'AD域中对应的主键';
comment on column SYS_USER.ACCOUNT_TYPE
  is '账号类别：1-AD域导入；2-自建；';
comment on column SYS_USER.POST_ID
  is '职位ID';
  
  -- Add/modify columns 
alter table SYS_USER add REOPEN_DATE TIMESTAMP(6);
alter table SYS_USER add CLOSE_TYPE VARCHAR2(64);
-- Add comments to the columns 
comment on column SYS_USER.LOGIN_FLAG
  is '是否可登录（0：否；1：是）';
comment on column SYS_USER.REOPEN_DATE
  is '关停帐号截至时间';
comment on column SYS_USER.CLOSE_TYPE
  is '关停帐号原因类型';

-- Create/Recreate indexes 
create index SYS_USER_POST_ID on SYS_USER (post_id);
create index SYS_USER_NAME on SYS_USER (name);
CREATE INDEX sys_user_login_name ON sys_user (login_name);

-- Create table
create table SYS_POST
(
  ID     VARCHAR2(64) not null,
  ORG_ID      VARCHAR2(64) not null,
  POST_NAME   NVARCHAR2(200) default 'NICK-POST' not null,
  POST_DES    NVARCHAR2(50),
  POST_LEVEL  NUMBER(1,0) default 1 not null,
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE timestamp not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE timestamp not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null,
  PRIMARY KEY (id)
);
-- Add comments to the table 
comment on table SYS_POST
  is '职位表';
-- Add comments to the columns 
comment on column SYS_POST.ID
  is '编号';
comment on column SYS_POST.ORG_ID
  is '组织结构编码';
comment on column SYS_POST.POST_NAME
  is '职位名称';
comment on column SYS_POST.POST_DES
  is '职位描述';
comment on column SYS_POST.POST_LEVEL
  is '职位等级（1~9，数字越高代表等级越高）';
comment on column SYS_POST.CREATE_BY
  is '创建者';
comment on column SYS_POST.CREATE_DATE
  is '创建时间';
comment on column SYS_POST.UPDATE_BY
  is '更新者';
comment on column SYS_POST.UPDATE_DATE
  is '更新时间';
comment on column SYS_POST.REMARKS
  is '备注信息';
comment on column SYS_POST.DEL_FLAG
  is '删除标记';
  
CREATE INDEX sys_post_ORG_ID ON sys_post (ORG_ID);
CREATE INDEX sys_post_del_flag ON sys_post (del_flag);
CREATE INDEX sys_post_POST_LEVEL ON sys_post (POST_LEVEL);

-- V1.2.10 add fields from CRSC-CCIP by jeffen@pactera 2015/11/01 end


---------------------------------------------------
-- Export file for user CCIP_TEST                --
-- Created by JeffenPC on 11/20/2015, 6:09:19 PM --
---------------------------------------------------
/* Drop Tables */

DROP TABLE SYS_ACCOUT_BLOCK;
DROP TABLE SYS_SHORTCUT_MENU;

/* Create Tables */

CREATE TABLE SYS_ACCOUT_BLOCK
(
	ID VARCHAR2(64) NOT NULL,
	USER_ID VARCHAR2(64) ,--用户ID
	RES_TYPE VARCHAR2(64) ,--资源类型
	BLOCK_LONG NUMBER(2,0) NOT NULL,--封锁时长
	TIMES NUMBER(1,0) NOT NULL,--次数
	CREATE_BY VARCHAR2(64) NOT NULL,
	CREATE_DATE TIMESTAMP NOT NULL,
	UPDATE_BY VARCHAR2(64) NOT NULL,
	UPDATE_DATE TIMESTAMP NOT NULL,
	REMARKS NVARCHAR2(255),
	DEL_FLAG CHAR(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE SYS_SHORTCUT_MENU
(
	ID VARCHAR2(64) NOT NULL,
	MENU_ID  VARCHAR2(64)  NOT NULL,--菜单ID
	USER_ID VARCHAR2(64)  NOT NULL,--用户ID
	CREATE_BY VARCHAR2(64) NOT NULL,
	CREATE_DATE TIMESTAMP NOT NULL,
	UPDATE_BY VARCHAR2(64) NOT NULL,
	UPDATE_DATE TIMESTAMP NOT NULL,
	REMARKS NVARCHAR2(255),
	DEL_FLAG CHAR(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (ID)
);


/* Create Indexes */

CREATE INDEX SYS_ACCOUT_BLOCK_DEL_FLAG ON SYS_ACCOUT_BLOCK (DEL_FLAG);
CREATE INDEX SYS_SHORTCUT_MENU_DEL_FLAG ON SYS_SHORTCUT_MENU (DEL_FLAG);



/* Comments */

COMMENT ON TABLE SYS_ACCOUT_BLOCK IS '账号封锁时间表';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.ID IS '编号';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.USER_ID IS '用户编号';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.RES_TYPE IS '资源类型';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.BLOCK_LONG IS '封锁时长';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.TIMES IS '次数';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.CREATE_BY IS '创建者';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.CREATE_DATE IS '创建时间';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.UPDATE_BY IS '更新者';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.UPDATE_DATE IS '更新时间';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.REMARKS IS '备注信息';
COMMENT ON COLUMN SYS_ACCOUT_BLOCK.DEL_FLAG IS '删除标记（0：正常；1：删除；2：审核）';
COMMENT ON TABLE SYS_SHORTCUT_MENU IS '用户快捷菜单表';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.ID IS '编号';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.MENU_ID IS '菜单编号';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.USER_ID IS '用户编号';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.CREATE_BY IS '创建者';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.CREATE_DATE IS '创建时间';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.UPDATE_BY IS '更新者';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.UPDATE_DATE IS '更新时间';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.REMARKS IS '备注信息';
COMMENT ON COLUMN SYS_SHORTCUT_MENU.DEL_FLAG IS '删除标记（0：正常；1：删除；2：审核）';



