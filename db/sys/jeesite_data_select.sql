-- /**
--  * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.
--  * merge data script
--  * Author: jeffen@pactera
--  * Date: 2015/10/1
--  * Version: 0.0.1
--  */

	--用户表数据
	select 
		id,
		company_id,
		office_id,
		login_name,
		password,
		no,
		name,
		email,
		phone,
		mobile,
		user_type,
		remarks,
		login_flag,
		create_by,
		to_char(create_date,'yyyy/mm/dd'),
		update_by,
		to_char(update_date,'yyyy/mm/dd'),
		del_flag,
		tags,
		FLOOR_ID,
		USER_LEVEL,
		SSID,
		ACCOUNT_TYPE,
		POST_ID
	from sys_user;

	--菜单表数据
	select id,
	   parent_id,
	   parent_ids,
	   name,
	   href,
	   target,
	   icon,
	   sort,
	   is_show,
	   permission,
	   remarks,
	   create_by,
	   create_date,
	   update_by,
	   update_date,
	   del_flag
	from sys_menu
	order by update_date desc;

	--字典表数据
	select id,
	   label,
	   value,
	   type,
	   description,
	   sort,
	   remarks,
	   create_by,
	   to_char(create_date,'yyyy/mm/dd'),
	   update_by,
	   to_char(update_date,'yyyy/mm/dd'),
	   del_flag
	from sys_dict order by update_date desc
	for update;

	--多国语言表
	select 
		ID,
		LANG_KEY,
		LANG_CONTEXT,
		LANG_CODE,
		CREATE_BY,
		to_char(CREATE_DATE,'yyyy/mm/dd'),
		UPDATE_BY,
		to_char(UPDATE_DATE,'yyyy/mm/dd'),
		REMARKS,
		DEL_FLAG
	from sys_muti_lang order by update_date desc;

	--职位表
	select 
	  ID,
	  ORG_ID,
	  POST_NAME,
	  POST_DES,
	  POST_LEVEL,
	  CREATE_BY,
	  CREATE_DATE,
	  UPDATE_BY,
	  UPDATE_DATE,
	  REMARKS,
	  DEL_FLAG
	from sys_post order by update_date desc
	for update;
   
	--角色菜单
	select *
	  from sys_role_menu t
	 where menu_id = '2b0fbd87f2e54f318b967277685b073d'
	    or role_id = '6'
