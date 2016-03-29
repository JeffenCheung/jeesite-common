
/* Drop Indexes */

DROP INDEX sys_area_parent_id;
DROP INDEX sys_area_parent_ids;
DROP INDEX sys_area_del_flag;
DROP INDEX sys_dict_value;
DROP INDEX sys_dict_label;
DROP INDEX sys_dict_del_flag;
DROP INDEX sys_log_create_by;
DROP INDEX sys_log_request_uri;
DROP INDEX sys_log_type;
DROP INDEX sys_log_create_date;
DROP INDEX sys_mdict_parent_id;
DROP INDEX sys_mdict_parent_ids;
DROP INDEX sys_mdict_del_flag;
DROP INDEX sys_menu_parent_id;
DROP INDEX sys_menu_parent_ids;
DROP INDEX sys_menu_del_flag;
DROP INDEX sys_office_parent_id;
DROP INDEX sys_office_parent_ids;
DROP INDEX sys_office_del_flag;
DROP INDEX sys_office_type;
DROP INDEX sys_role_del_flag;
DROP INDEX sys_role_enname;
DROP INDEX sys_user_office_id;
DROP INDEX sys_user_login_name;
DROP INDEX SYS_USER_NAME;
DROP INDEX sys_user_company_id;
DROP INDEX sys_user_update_date;
DROP INDEX sys_user_del_flag;
DROP INDEX SYS_USER_POST_ID;
DROP INDEX sys_post_ORG_ID;
DROP INDEX sys_post_del_flag;
DROP INDEX sys_post_POST_LEVEL;


/* Drop Tables */

DROP TABLE sys_user_role CASCADE CONSTRAINTS;
DROP TABLE sys_user CASCADE CONSTRAINTS;
DROP TABLE sys_role_office CASCADE CONSTRAINTS;
DROP TABLE sys_office CASCADE CONSTRAINTS;
DROP TABLE sys_area CASCADE CONSTRAINTS;
DROP TABLE sys_dict CASCADE CONSTRAINTS;
DROP TABLE sys_log CASCADE CONSTRAINTS;
DROP TABLE sys_mdict CASCADE CONSTRAINTS;
DROP TABLE sys_role_menu CASCADE CONSTRAINTS;
DROP TABLE sys_menu CASCADE CONSTRAINTS;
DROP TABLE sys_role CASCADE CONSTRAINTS;
-- 职务表
DROP TABLE sys_post CASCADE CONSTRAINTS;
-- 国际化
DROP TABLE sys_muti_lang CASCADE CONSTRAINTS;


/* Create Tables */

-- 区域表
CREATE TABLE sys_area
(
	id varchar2(64) NOT NULL,
	parent_id varchar2(64) NOT NULL,
	parent_ids varchar2(2000) NOT NULL,
	name nvarchar2(100) NOT NULL,
	sort number(10,0) NOT NULL,
	code varchar2(100),
	type char(1),
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 字典表
CREATE TABLE sys_dict
(
	id varchar2(64) NOT NULL,
	value varchar2(100) NOT NULL,
	label varchar2(100) NOT NULL,
	type varchar2(100) NOT NULL,
	description nvarchar2(100) NOT NULL,
	sort number(10,0) NOT NULL,
	parent_id varchar2(64) DEFAULT '0',
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 日志表
CREATE TABLE sys_log
(
	id varchar2(64) NOT NULL,
	type char(1) DEFAULT '1',
	title nvarchar2(500),
	create_by varchar2(64),
	create_date timestamp,
	remote_addr varchar2(255),
	user_agent varchar2(255),
	request_uri varchar2(255),
	method varchar2(5),
	params clob,
	exception clob,
	PRIMARY KEY (id)
);


-- 多级字典表
CREATE TABLE sys_mdict
(
	id varchar2(64) NOT NULL,
	parent_id varchar2(64) NOT NULL,
	parent_ids varchar2(2000) NOT NULL,
	name nvarchar2(100) NOT NULL,
	sort number(10,0) NOT NULL,
	description nvarchar2(100),
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 菜单表
CREATE TABLE sys_menu
(
	id varchar2(64) NOT NULL,
	parent_id varchar2(64) NOT NULL,
	parent_ids varchar2(2000) NOT NULL,
	name nvarchar2(100) NOT NULL,
	sort number(10,0) NOT NULL,
	href varchar2(2000),
	target varchar2(20),
	icon varchar2(100),
	is_show char(1) NOT NULL,
	permission varchar2(200),
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 机构表
CREATE TABLE sys_office
(
	id varchar2(64) NOT NULL,
	parent_id varchar2(64) NOT NULL,
	parent_ids varchar2(2000) NOT NULL,
	name nvarchar2(100) NOT NULL,
	sort number(10,0) NOT NULL,
	area_id varchar2(64) NOT NULL,
	code varchar2(100),
	type char(1) NOT NULL,
	grade char(1) NOT NULL,
	address nvarchar2(255),
	zip_code varchar2(100),
	master nvarchar2(100),
	phone nvarchar2(200),
	fax nvarchar2(200),
	email nvarchar2(200),
	USEABLE varchar2(64),
	PRIMARY_PERSON varchar2(64),
	DEPUTY_PERSON varchar2(64),
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 角色表
CREATE TABLE sys_role
(
	id varchar2(64) NOT NULL,
	office_id varchar2(64),
	name nvarchar2(100) NOT NULL,
	enname varchar2(255),
	role_type varchar2(255),
	data_scope char(1),
	is_sys varchar2(64),
	useable varchar2(64),
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);

-- 职位表
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
  is '删除标记（0：正常；1：删除；2：审核）';


-- 角色-菜单
CREATE TABLE sys_role_menu
(
	role_id varchar2(64) NOT NULL,
	menu_id varchar2(64) NOT NULL,
	PRIMARY KEY (role_id, menu_id)
);


-- 角色-机构
CREATE TABLE sys_role_office
(
	role_id varchar2(64) NOT NULL,
	office_id varchar2(64) NOT NULL,
	PRIMARY KEY (role_id, office_id)
);


-- 用户表
CREATE TABLE sys_user
(
	id varchar2(64) NOT NULL,
	company_id varchar2(64) NOT NULL,
	office_id varchar2(64) NOT NULL,
	login_name varchar2(100) NOT NULL,
	password varchar2(100) NOT NULL,
	no varchar2(100),
	name nvarchar2(100) NOT NULL,
	email nvarchar2(200),
	phone varchar2(200),
	mobile varchar2(200),
	user_type char(1),
	photo varchar2(1000),
	login_ip varchar2(100),
	login_date timestamp,
	login_flag varchar2(64),
	REOPEN_DATE timestamp,
	CLOSE_TYPE varchar2(64),
	FLOOR_ID VARCHAR2(64) default '0' not null,
	USER_LEVEL NUMBER(1,0) default 1 not null,
	SSID NVARCHAR2(50),
	ACCOUNT_TYPE NUMBER(1,0) default 0 not null,
	POST_ID VARCHAR2(64) default '0' not null,
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	tags clob,
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 用户-角色
CREATE TABLE sys_user_role
(
	user_id varchar2(64) NOT NULL,
	role_id varchar2(64) NOT NULL,
	PRIMARY KEY (user_id, role_id)
);



/* Create Indexes */

CREATE INDEX sys_area_parent_id ON sys_area (parent_id);
CREATE INDEX sys_area_parent_ids ON sys_area (parent_ids);
CREATE INDEX sys_area_del_flag ON sys_area (del_flag);
CREATE INDEX sys_dict_value ON sys_dict (value);
CREATE INDEX sys_dict_label ON sys_dict (label);
CREATE INDEX sys_dict_del_flag ON sys_dict (del_flag);
CREATE INDEX sys_log_create_by ON sys_log (create_by);
CREATE INDEX sys_log_request_uri ON sys_log (request_uri);
CREATE INDEX sys_log_type ON sys_log (type);
CREATE INDEX sys_log_create_date ON sys_log (create_date);
CREATE INDEX sys_mdict_parent_id ON sys_mdict (parent_id);
CREATE INDEX sys_mdict_parent_ids ON sys_mdict (parent_ids);
CREATE INDEX sys_mdict_del_flag ON sys_mdict (del_flag);
CREATE INDEX sys_menu_parent_id ON sys_menu (parent_id);
CREATE INDEX sys_menu_parent_ids ON sys_menu (parent_ids);
CREATE INDEX sys_menu_del_flag ON sys_menu (del_flag);
CREATE INDEX sys_office_parent_id ON sys_office (parent_id);
CREATE INDEX sys_office_parent_ids ON sys_office (parent_ids);
CREATE INDEX sys_office_del_flag ON sys_office (del_flag);
CREATE INDEX sys_office_type ON sys_office (type);
CREATE INDEX sys_role_del_flag ON sys_role (del_flag);
CREATE INDEX sys_role_enname ON sys_role (enname);
CREATE INDEX sys_user_office_id ON sys_user (office_id);
CREATE INDEX sys_user_login_name ON sys_user (login_name);
CREATE INDEX SYS_USER_NAME ON sys_user (name);
CREATE INDEX sys_user_company_id ON sys_user (company_id);
CREATE INDEX sys_user_update_date ON sys_user (update_date);
CREATE INDEX sys_user_del_flag ON sys_user (del_flag);
-- Create/Recreate indexes 
create index SYS_USER_POST_ID on SYS_USER (post_id);

CREATE INDEX sys_post_ORG_ID ON sys_post (ORG_ID);
CREATE INDEX sys_post_del_flag ON sys_post (del_flag);
CREATE INDEX sys_post_POST_LEVEL ON sys_post (POST_LEVEL);



/* Create Tables */

-- 语言
CREATE TABLE sys_muti_lang
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 语言主键
	lang_key varchar2(50) NOT NULL,
	-- 内容
	lang_context nvarchar2(500) NOT NULL,
	-- 语言
	lang_code varchar2(50) NOT NULL,
	-- 创建者
	create_by varchar2(64) NOT NULL,
	-- 创建时间
	create_date timestamp NOT NULL,
	-- 更新者
	update_by varchar2(64) NOT NULL,
	-- 更新时间
	update_date timestamp NOT NULL,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记（0：正常；1：删除；2：审核）
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);



/* Comments */

COMMENT ON TABLE sys_muti_lang IS '语言';
COMMENT ON COLUMN sys_muti_lang.id IS '编号';
COMMENT ON COLUMN sys_muti_lang.lang_key IS '语言主键';
COMMENT ON COLUMN sys_muti_lang.lang_context IS '内容';
COMMENT ON COLUMN sys_muti_lang.lang_code IS '语言';
COMMENT ON COLUMN sys_muti_lang.create_by IS '创建者';
COMMENT ON COLUMN sys_muti_lang.create_date IS '创建时间';
COMMENT ON COLUMN sys_muti_lang.update_by IS '更新者';
COMMENT ON COLUMN sys_muti_lang.update_date IS '更新时间';
COMMENT ON COLUMN sys_muti_lang.remarks IS '备注信息';
COMMENT ON COLUMN sys_muti_lang.del_flag IS '删除标记（0：正常；1：删除；2：审核）';


COMMENT ON TABLE sys_area IS '区域表';
COMMENT ON COLUMN  sys_area.id  IS '编号';
COMMENT ON COLUMN  sys_area.parent_id  IS '父级编号';
COMMENT ON COLUMN  sys_area.parent_ids  IS '所有父级编号';
COMMENT ON COLUMN  sys_area.name  IS '名称';
COMMENT ON COLUMN  sys_area.sort  IS '排序';
COMMENT ON COLUMN  sys_area.code  IS '区域编码';
COMMENT ON COLUMN  sys_area.type  IS '区域类型';
COMMENT ON COLUMN  sys_area.create_by  IS '创建者';
COMMENT ON COLUMN  sys_area.create_date  IS '创建时间';
COMMENT ON COLUMN  sys_area.update_by  IS '更新者';
COMMENT ON COLUMN  sys_area.update_date  IS '更新时间';
COMMENT ON COLUMN  sys_area.remarks  IS '备注信息';
COMMENT ON COLUMN  sys_area.del_flag IS '删除标记（0：正常；1：删除；2：审核）';
                                        
                                        
COMMENT ON TABLE sys_dict IS '字典表';
COMMENT ON COLUMN  sys_dict.id  IS '编号';
COMMENT ON COLUMN  sys_dict.value  IS '数据值';
COMMENT ON COLUMN  sys_dict.label  IS '标签名';
COMMENT ON COLUMN  sys_dict.type  IS '类型';
COMMENT ON COLUMN  sys_dict.description  IS '描述';
COMMENT ON COLUMN  sys_dict.sort  IS '排序（升序）';
COMMENT ON COLUMN  sys_dict.parent_id  IS '父级编号';
COMMENT ON COLUMN  sys_dict.create_by  IS '创建者';
COMMENT ON COLUMN  sys_dict.create_date  IS '创建时间';
COMMENT ON COLUMN  sys_dict.update_by  IS '更新者';
COMMENT ON COLUMN  sys_dict.update_date  IS '更新时间';
COMMENT ON COLUMN  sys_dict.remarks  IS '备注信息';
COMMENT ON COLUMN  sys_dict.del_flag IS '删除标记（0：正常；1：删除；2：审核）';
                                        
                                        
COMMENT ON TABLE sys_log IS '日志表';
COMMENT ON COLUMN  sys_log.id  IS '编号';
COMMENT ON COLUMN  sys_log.type  IS '日志类型';
COMMENT ON COLUMN  sys_log.title  IS '日志标题';
COMMENT ON COLUMN  sys_log.create_by  IS '创建者';
COMMENT ON COLUMN  sys_log.create_date  IS '创建时间';
COMMENT ON COLUMN  sys_log.remote_addr  IS '操作IP地址';
COMMENT ON COLUMN  sys_log.user_agent  IS '用户代理';
COMMENT ON COLUMN  sys_log.request_uri  IS '请求URI';
COMMENT ON COLUMN  sys_log.method  IS '操作方式';
COMMENT ON COLUMN  sys_log.params  IS '操作提交的数据';
COMMENT ON COLUMN  sys_log.exception  IS '异常信息';
                                        
                                        
COMMENT ON TABLE sys_mdict IS '多级字典表';
COMMENT ON COLUMN  sys_mdict.id  IS '编号';
COMMENT ON COLUMN  sys_mdict.parent_id  IS '父级编号';
COMMENT ON COLUMN  sys_mdict.parent_ids  IS '所有父级编号';
COMMENT ON COLUMN  sys_mdict.name  IS '名称';
COMMENT ON COLUMN  sys_mdict.sort  IS '排序';
COMMENT ON COLUMN  sys_mdict.description  IS '描述';
COMMENT ON COLUMN  sys_mdict.create_by  IS '创建者';
COMMENT ON COLUMN  sys_mdict.create_date  IS '创建时间';
COMMENT ON COLUMN  sys_mdict.update_by  IS '更新者';
COMMENT ON COLUMN  sys_mdict.update_date  IS '更新时间';
COMMENT ON COLUMN  sys_mdict.remarks  IS '备注信息';
COMMENT ON COLUMN  sys_mdict.del_flag IS '删除标记（0：正常；1：删除；2：审核）';
                                        
                                        
COMMENT ON TABLE sys_menu IS '菜单表';
COMMENT ON COLUMN  sys_menu.id  IS '编号';
COMMENT ON COLUMN  sys_menu.parent_id  IS '父级编号';
COMMENT ON COLUMN  sys_menu.parent_ids  IS '所有父级编号';
COMMENT ON COLUMN  sys_menu.name  IS '名称';
COMMENT ON COLUMN  sys_menu.sort  IS '排序';
COMMENT ON COLUMN  sys_menu.href  IS '链接';
COMMENT ON COLUMN  sys_menu.target  IS '目标';
COMMENT ON COLUMN  sys_menu.icon  IS '图标';
COMMENT ON COLUMN  sys_menu.is_show  IS '是否在菜单中显示';
COMMENT ON COLUMN  sys_menu.permission  IS '权限标识';
COMMENT ON COLUMN  sys_menu.create_by  IS '创建者';
COMMENT ON COLUMN  sys_menu.create_date  IS '创建时间';
COMMENT ON COLUMN  sys_menu.update_by  IS '更新者';
COMMENT ON COLUMN  sys_menu.update_date  IS '更新时间';
COMMENT ON COLUMN  sys_menu.remarks  IS '备注信息';
COMMENT ON COLUMN  sys_menu.del_flag IS '删除标记（0：正常；1：删除；2：审核）';
                                        
                                        
COMMENT ON TABLE sys_office IS '机构表';
COMMENT ON COLUMN  sys_office.id  IS '编号';
COMMENT ON COLUMN  sys_office.parent_id  IS '父级编号';
COMMENT ON COLUMN  sys_office.parent_ids  IS '所有父级编号';
COMMENT ON COLUMN  sys_office.name  IS '名称';
COMMENT ON COLUMN  sys_office.sort  IS '排序';
COMMENT ON COLUMN  sys_office.area_id  IS '归属区域';
COMMENT ON COLUMN  sys_office.code  IS '区域编码';
COMMENT ON COLUMN  sys_office.type  IS '机构类型';
COMMENT ON COLUMN  sys_office.grade  IS '机构等级';
COMMENT ON COLUMN  sys_office.address  IS '联系地址';
COMMENT ON COLUMN  sys_office.zip_code  IS '邮政编码';
COMMENT ON COLUMN  sys_office.master  IS '负责人';
COMMENT ON COLUMN  sys_office.phone  IS '电话';
COMMENT ON COLUMN  sys_office.fax  IS '传真';
COMMENT ON COLUMN  sys_office.email  IS '邮箱';
COMMENT ON COLUMN  sys_office.USEABLE  IS '是否启用';
COMMENT ON COLUMN  sys_office.PRIMARY_PERSON  IS '主负责人';
COMMENT ON COLUMN  sys_office.DEPUTY_PERSON  IS '副负责人';
COMMENT ON COLUMN  sys_office.create_by  IS '创建者';
COMMENT ON COLUMN  sys_office.create_date  IS '创建时间';
COMMENT ON COLUMN  sys_office.update_by  IS '更新者';
COMMENT ON COLUMN  sys_office.update_date  IS '更新时间';
COMMENT ON COLUMN  sys_office.remarks  IS '备注信息';
COMMENT ON COLUMN  sys_office.del_flag IS '删除标记（0：正常；1：删除；2：审核）';
                                        
COMMENT ON TABLE sys_role IS '角色表';
COMMENT ON COLUMN  sys_role.id  IS '编号';
COMMENT ON COLUMN  sys_role.office_id  IS '归属机构';
COMMENT ON COLUMN  sys_role.name  IS '角色名称';
COMMENT ON COLUMN  sys_role.enname  IS '英文名称';
COMMENT ON COLUMN  sys_role.role_type  IS '角色类型';
COMMENT ON COLUMN  sys_role.data_scope  IS '数据范围';
COMMENT ON COLUMN  sys_role.is_sys  IS '是否系统数据';
COMMENT ON COLUMN  sys_role.useable  IS '是否可用';
COMMENT ON COLUMN  sys_role.create_by  IS '创建者';
COMMENT ON COLUMN  sys_role.create_date  IS '创建时间';
COMMENT ON COLUMN  sys_role.update_by  IS '更新者';
COMMENT ON COLUMN  sys_role.update_date  IS '更新时间';
COMMENT ON COLUMN  sys_role.remarks  IS '备注信息';
COMMENT ON COLUMN  sys_role.del_flag IS '删除标记（0：正常；1：删除；2：审核）';
                                        
                                        
COMMENT ON TABLE sys_role_menu IS '角色-菜单';
COMMENT ON COLUMN  sys_role_menu.role_id  IS '角色编号';
COMMENT ON COLUMN  sys_role_menu.menu_id  IS '菜单编号';
                                        
                                        
COMMENT ON TABLE sys_role_office IS '角色-机构';
COMMENT ON COLUMN  sys_role_office.role_id  IS '角色编号';
COMMENT ON COLUMN  sys_role_office.office_id  IS '机构编号';
                                        
                                        
                                        
COMMENT ON TABLE sys_user IS '用户表';
COMMENT ON COLUMN  sys_user.id  IS '编号';
COMMENT ON COLUMN  sys_user.company_id  IS '归属公司';
COMMENT ON COLUMN  sys_user.office_id  IS '归属部门';
COMMENT ON COLUMN  sys_user.login_name  IS '登录名';
COMMENT ON COLUMN  sys_user.password  IS '密码';
COMMENT ON COLUMN  sys_user.no  IS '工号';
COMMENT ON COLUMN  sys_user.name  IS '姓名';
COMMENT ON COLUMN  sys_user.email  IS '邮箱';
COMMENT ON COLUMN  sys_user.phone  IS '电话';
COMMENT ON COLUMN  sys_user.mobile  IS '手机';
COMMENT ON COLUMN  sys_user.user_type  IS '用户类型';
COMMENT ON COLUMN  sys_user.photo  IS '用户头像';
COMMENT ON COLUMN  sys_user.login_ip  IS '最后登陆IP';
COMMENT ON COLUMN  sys_user.login_date  IS '最后登陆时间';
COMMENT ON COLUMN  sys_user.login_flag  IS '是否可登录（0：否；1：是）';
COMMENT ON COLUMN  sys_user.REOPEN_DATE  IS '关停帐号截至时间';
COMMENT ON COLUMN  sys_user.CLOSE_TYPE  IS '关停帐号原因类型';

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

COMMENT ON COLUMN  sys_user.create_by  IS '创建者';
COMMENT ON COLUMN  sys_user.create_date  IS '创建时间';
COMMENT ON COLUMN  sys_user.update_by  IS '更新者';
COMMENT ON COLUMN  sys_user.update_date  IS '更新时间';
COMMENT ON COLUMN  sys_user.remarks  IS '备注信息';
COMMENT ON COLUMN  sys_user.tags  IS '标签';
COMMENT ON COLUMN  sys_user.del_flag IS '删除标记（0：正常；1：删除；2：审核）';
                                        
COMMENT ON TABLE sys_user_role IS '用户-角色';
COMMENT ON COLUMN  sys_user_role.user_id  IS '用户编号';
COMMENT ON COLUMN  sys_user_role.role_id  IS '角色编号';



