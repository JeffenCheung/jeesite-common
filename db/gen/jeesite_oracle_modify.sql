
/* modify Tables */

-- V1.2.9 add multiple data source select option by jeffen@pactera 2015/10/23 start
-- Add/modify columns 
alter table GEN_TABLE add DATA_SOURCE VARCHAR2(2);
-- Add comments to the columns 
comment on column GEN_TABLE.DATA_SOURCE
  is '数据源（空：默认；2：数据源2；3：数据源3；4：数据源4；5：数据源5；n：数据源n）';
-- V1.2.9 add multiple data source select option by jeffen@pactera 2015/10/23 end


-- Create table
create table TEST_DATA_DS2
(
  ID          VARCHAR2(64) not null,
  USER_ID     VARCHAR2(64),
  OFFICE_ID   VARCHAR2(64),
  AREA_ID     NVARCHAR2(64),
  NAME        NVARCHAR2(100),
  SEX         CHAR(1),
  IN_DATE     DATE,
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null,
  TAGS        CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TEST_DATA_DS2
  is '业务数据表-数据源2';
-- Add comments to the columns 
comment on column TEST_DATA_DS2.ID
  is '编号';
comment on column TEST_DATA_DS2.USER_ID
  is '归属用户';
comment on column TEST_DATA_DS2.OFFICE_ID
  is '归属部门';
comment on column TEST_DATA_DS2.AREA_ID
  is '归属区域';
comment on column TEST_DATA_DS2.NAME
  is '名称';
comment on column TEST_DATA_DS2.SEX
  is '性别';
comment on column TEST_DATA_DS2.IN_DATE
  is '加入日期';
comment on column TEST_DATA_DS2.CREATE_BY
  is '创建者';
comment on column TEST_DATA_DS2.CREATE_DATE
  is '创建时间';
comment on column TEST_DATA_DS2.UPDATE_BY
  is '更新者';
comment on column TEST_DATA_DS2.UPDATE_DATE
  is '更新时间';
comment on column TEST_DATA_DS2.REMARKS
  is '备注信息';
comment on column TEST_DATA_DS2.DEL_FLAG
  is '删除标记';
comment on column TEST_DATA_DS2.TAGS
  is '标签';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TEST_DATA_DS2
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index TEST_DATA_DS2_DEL_FLAG on TEST_DATA_DS2 (DEL_FLAG)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
