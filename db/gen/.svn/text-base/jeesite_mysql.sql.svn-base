SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables*/

DROP TABLE IF EXISTS gen_scheme;
DROP TABLE IF EXISTS gen_table_column;
DROP TABLE IF EXISTS gen_table;
DROP TABLE IF EXISTS gen_template; 




/* Create Tables */

CREATE TABLE gen_scheme
(
	id varchar(64) NOT NULL COMMENT '编号',
	name varchar(200) COMMENT '名称',
	category varchar(2000) COMMENT '分类',
	package_name varchar(500) COMMENT '生成包路径',
	module_name varchar(30) COMMENT '生成模块名',
	sub_module_name varchar(30) COMMENT '生成子模块名',
	function_name varchar(500) COMMENT '生成功能名',
	function_name_simple varchar(100) COMMENT '生成功能名（简写）',
	function_author varchar(100) COMMENT '生成功能作者',
	gen_table_id varchar(200) COMMENT '生成表编号',
	IO_ARTIFACT varchar(100) COMMENT '导入导出工具包',
	PROJECT_PATH varchar(500) COMMENT '工程路径',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除；2：审核）',
	PRIMARY KEY (id)
) COMMENT = '生成方案';


CREATE TABLE gen_table
(
	id varchar(64) NOT NULL COMMENT '编号',
	name varchar(200) COMMENT '名称',
	comments varchar(500) COMMENT '描述',
	class_name varchar(100) COMMENT '实体类名称',
	parent_table varchar(200) COMMENT '关联父表',
	parent_table_fk varchar(100) COMMENT '关联父表外键',
	DATA_SOURCE varchar(2) COMMENT '数据源（空：默认；2：数据源2；3：数据源3；4：数据源4；5：数据源5；n：数据源n）',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除；2：审核）',
	PRIMARY KEY (id)
) COMMENT = '业务表';


CREATE TABLE gen_table_column
(
	id varchar(64) NOT NULL COMMENT '编号',
	gen_table_id varchar(64) COMMENT '归属表编号',
	name varchar(200) COMMENT '名称',
	comments varchar(500) COMMENT '描述',
	jdbc_type varchar(100) COMMENT '列的数据类型的字节长度',
	java_type varchar(500) COMMENT 'JAVA类型',
	java_field varchar(200) COMMENT 'JAVA字段名',
	is_pk char(1) COMMENT '是否主键',
	is_null char(1) COMMENT '是否可为空',
	is_insert char(1) COMMENT '是否为插入字段',
	is_edit char(1) COMMENT '是否编辑字段',
	is_list char(1) COMMENT '是否列表字段',
	is_query char(1) COMMENT '是否查询字段',
	query_type varchar(200) COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
	show_type varchar(200) COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
	dict_type varchar(200) COMMENT '字典类型',
	settings varchar(2000) COMMENT '其它设置（扩展字段JSON）',
	sort decimal COMMENT '排序（升序）',
	IS_CSV char(1) COMMENT '是否CSV字段',
	CSV_COLUMN_ACCESS_TYPE varchar(50) COMMENT 'CSV列数据访问方式：[READ]导入只读，但不导该出字段；[READ_WRITE]导入只读，并导该出字段；[WRITE]导入文件不含该字段，但导该出字段',
	CSV_POSITION decimal(3) COMMENT 'CSV文件列位置',
	DEFAULT_VALUE varchar(500) COMMENT '默认值',
	FORMAT varchar(500) COMMENT '格式化(#,##0.0;yyyy/MM/dd;HH:mm:ss)',
	IS_EXCEL char(1) COMMENT '是否EXCEL字段',
	EXCEL_VALUE varchar(500) COMMENT 'EXCEL导出字段名（默认调用当前字段的“get”方法，如指定导出字段为对象，请填写“对象名.对象属性”，例：“area.name”、“office.name”）',
	EXCEL_TITLE varchar(500) COMMENT 'EXCEL导出字段标题（需要添加批注请用“**”分隔，标题**批注，仅对导出模板有效）',
	EXCEL_TYPE varchar(2) COMMENT 'EXCEL字段类型（0：导出导入；1：仅导出；2：仅导入）',
	EXCEL_ALIGN varchar(2) COMMENT 'EXCEL导出字段对齐方式（0：自动；1：靠左；2：居中；3：靠右）',
	ORDER_TYPE varchar(5) COMMENT '结果排序方式（非排序字段、升序ASC、降序DESC）',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除；2：审核）',
	PRIMARY KEY (id)
) COMMENT = '业务表字段';


CREATE TABLE gen_template
(
	id varchar(64) NOT NULL COMMENT '编号',
	name varchar(200) COMMENT '名称',
	category varchar(2000) COMMENT '分类',
	file_path varchar(500) COMMENT '生成文件路径',
	file_name varchar(200) COMMENT '生成文件名',
	content text COMMENT '内容',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除；2：审核）',
	PRIMARY KEY (id)
) COMMENT = '代码模板表';



/* Create Indexes */

CREATE INDEX gen_scheme_del_flag ON gen_scheme (del_flag ASC);
CREATE INDEX gen_table_name ON gen_table (name ASC);
CREATE INDEX gen_table_del_flag ON gen_table (del_flag ASC);
CREATE INDEX gen_table_column_table_id ON gen_table_column (gen_table_id ASC);
CREATE INDEX gen_table_column_name ON gen_table_column (name ASC);
CREATE INDEX gen_table_column_sort ON gen_table_column (sort ASC);
CREATE INDEX gen_table_column_del_flag ON gen_table_column (del_flag ASC);
CREATE INDEX gen_template_del_falg ON gen_template (del_flag ASC);



