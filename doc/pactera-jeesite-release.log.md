# 框架迭代升级日志
***
#### [show note]
pactera-jeesite框架迭代项目实施过程中任何的技术问题单台帐，
随时记录问题日志、截图、解决方案等事务，方便记录分享：
jeesite-common\doc\0.FAQ-IssueRegisterTracking.xlsx

各pactera-jeesite，team PL：

除非front-end前端模块定制功能，
否则所有后台基本功能的UI、UE、widget等，框架都能实现生成或扩展，
大家注意研习，无需重复发明。

大家最好抽时间提出合理的框架升级需求并迭代发行。
目前这个框架产品三四个team在共用和迭代，各位PL一定要有j2ee 的platform意识，
项目上也需有明确的backstag/frontend前后台功能区分的设计规划。

pactera-jeesite框架迭代项目实施过程中任何的技术问题单台帐，
随时记录问题日志、截图、解决方案等事务，方便记录分享：
jeesite-common\doc\0.FAQ-IssueRegisterTracking.xlsx

### pactera-jeesite v1.2.9 release log:
#### [2015/10/20]
1) add: bootstrap-calendar demo
2) add: SOA RESTful feature
3) optimization：menu model properties n script
4) optimization： gen tagsinput code
5) add: bootstrap-tagsinput
6) add: manual: soa restful, maven command
7) fixed: gen code ng,one2many copy function of service

#### [2015/10/23]
1) add: multiple data source. 多数据源支持
2) optimization：configer data source 2、scan tables/gen codes from ds2
	db/gen/modify.sql：
	alter table GEN_TABLE add DATA_SOURCE VARCHAR2(2);
	comment on column GEN_TABLE.DATA_SOURCE
	  is '数据源（空：默认；2：数据源2；3：数据源3；4：数据源4；5：数据源5；n：数据源n) ';

#### [2015/10/28]
1) add:maven-source-plugin
2) optimization: performance the maven-war-plugin overlay & deploy.


#### [2015/11/3]
1) add: login authentication RESTful api

#### [2015/11/5]
1) add: DB modify sys_post 增加职位表
2) optimization：DB modify sys_user 增加职位、楼层等信息

#### [2015/11/7]
1) fix: login service cache clear

#### [2015/11/12]
1) add: install bat script n log

### pactera-jeesite v1.2.10 release log:
#### [2015/11/20]
1) version release: 1.2.10
2) add: table & fields ,SYS_POST\SYS_ACCOUT_BLOCK\SYS_SHORTCUT_MENU\用户职位工号楼层等信息(jeesite_oracle_modify.sql)
3) fix：菜单修改生成隐藏权限菜单时重复冒号的问题
4) optimization: mybatis show sql by log4j(researching :format sql)

#### [2015/12/1]
1) optimization: feature option n process：widget.ztree.office.async
2) add: dateformat.js, console.log/debug/info/warn/error

#### [2015/12/2]
1) fixed: UerDao.xml JOIN>LEFT JOIN
2) optimization: DictUtils getDictLabelById()

#### [2015/12/4]
1) add: dict tree tag. (via. floor dict of userform)
2) optimization: ztree version topup, 3.5.12>3.5.19 (used fnc getPath)

#### [2015/12/6]
1) add: post tree tag. (via. post of userform)
2) fixed：同步全树加载(需判断ID异步乱入，如职务节点自动异步刷新时，防止重复数据)

#### [2015/12/8]
1) optimization: add attribute tagCtrUrl/showPath for treeselect.tag 
2) add: room tree select tag process
3) optimization：treeData autoParam modify,id>nodeId
4) fixed：ztree serach by asyc nodes.
5) fixed：ztree missing js lib ztree.exhide-3.5
6) fixed：dict cache ng by getDictTreeByRootType

#### [2015/12/10]
1) optimization: add front login case

#### [2015/12/14]
1) fixed: dict cache clear ng
2) optimization: add user info for js

#### [2015/12/16]
1) optimization: upgraded select2 version n adapted pretty features , 3.4>4.0.1
2) optimization: update manual doc
3) optimization: modify input text dom height 20px to 30px

#### [2015/12/18]
1) optimization: fixed jbox version 2.3>2.3.1 with jquery latest v1.11.3

#### [2015/12/21]
1) optimization: user form add fields eg. post,floor...
2) new：split maven project jeesite-oa-core
3) fixed：ActTaskService.java, fixed taskCandidateUser() > taskCandidateOrAssigned()
4) optimization：ActTaskService.java.histoicFlowList(), modify for claiming task info

#### [2015/12/22]
1) modify role back：ActTaskService.java, taskCandidateUser()

#### [2015/12/27]
1) optimization：move cxf client artifact to jeesite-common
2) optimization: add datasources schema properties to BaseEntity
3) optimization: modify office list to pagelist
4) optimization: Act.java close @JsonIgnore of histIns for REST
5) optimization: implemented createNewGroup() of ActGroupEntityService
6) optimization: modify createNewUser() of ActUserEntityService
7) optimization：upgrade junit.version to 4.11 by maven properties
8) optimization：add REST api and modiy funs to ActTaskService.java
9) optimization：open task/trace/photo|info to actTaskHistoricList and todolist page.
10) optimization：UX modify from actModelList.jsp and actProcessList.jsp and so on
11) fixed：office pagelist synchronizing with officeindex. 
12) optimization：add tipsy to office pagelist unuseable status.

#### [2015/12/28]
1) new：add index field of name to sys_user
2) optimization：adapted tree node icon for current login user.
3) optimization：(modify: userIndex.jsp/officeIndex.jsp/selectUserToRole.jsp)move refreshTree fnc and async process to refreshOfficeTree by treeview.jsp
4) fixed：adapted office tree async/unsync case.
5) fixed：delete dummy code of DictUtils

#### [2016/1/1]
1) new：add unclaim action for todolist
2) optimization：add showmessagebox fnc to message.tag

#### [2016/1/6]
1) optimization：upgrate validation version from 1.11.1 to 1.14.0
2) optimization：featurs push request from sdair BI project.
3) fixed：frontJspPath login case
4) fixed：add pom configer with developers and distributionManagement for maven deploy
5) optimization：add dateDiff prototype to Date object of JS.

#### [2016/1/10]
1) fixed：checkbox status judging by .is(":checked") not attr("checked") in genTableForm
2) add：add icon resize vertical for sort column
3) add：add datatables demo

#### [2016/1/11]
1) fixed：menu title display ng
2) add: theme sdbi by sdair project
3) fixed: getConfig to fns:getConfigBoolean('widget.ztree.office.async')

#### [2016/1/13]
1) add：trace info light RESTful
2) add：@Description for RESTful api

#### [2016/1/16]
1) optimization：modify tiny bootstrap theme for sdbi

#### [2016/1/19]
1) optimization：iterated jerichotab.js upgrated 2.0.2, for cookie keeping tabsetting
2) new：jquery.cookie
3) fixed：adapted bootstrap theme for IE 

#### [2016/1/22]
1) optimization：add isOfficeCode for treeselect.tag
2) optimization：add cookie keeping cookieTabLast
3) optimization：upgraded datatables version to 1.10.11.dev.pactera
4) fixed：init-db sys_user sql ng.
5) fixed：addTab for level4 menu NG.
6) optimization：add field REOPEN_DATE/CLOSE_TYPE to sys_user

#### [2016/1/27]
1) add：jquery ui theme
2) add：jquery floatingmessage
3) add：highlight effect

#### [2016/1/30]
1) fixed：checkbox status judging by .is(":checked") not attr("checked") in gridify.js
2) add：bootstrap breadcrumb
3) add：jquery.jsonp.js 4 ajax-cross-domain

#### [2016/2/18]
1) performance：追加 非cargo方式启动的local配置，提高build速度
2) performance：追加 代码打包过滤，提高启动速度：通过-Dmaven.source.skip=true 关闭源码打包
3) add: move theme sdbi to platform from project
4) optimization: add input.required css via concursolutions

#### [2016/2/21]
1) fixed：double click head row to form by js: 【$("#contentTable tr")】 > 【$("#contentTable tbody tr")】
2) performance：search panel layout of list page, transform dropdown-menu for io/dba operate

#### [2016/2/24]
1) performance: Select the row without radio or checkbox for genTableForm
2) fixed: loop disabled select2 to change default theme
3) fixed: set required-disabled input to disabled style
4) optimization: add theme switch case to global options for login action.
5) optimization: modify layout class for digits dom

#### [2016/3/1]
1) branches: pactera-jeesite-1.2.10.ZH.police for 深航器械管理项目 since V1.2.10
http://219.143.215.116:8088/svn/产品/jeesite/branches/pactera-jeesite-1.2.10.ZH.police
2) fixed: 顶部菜单menu bar只有一个顶级功能菜单或顶级首页菜单时，不重复走初始化动作，否则菜单收拉异常。
3) fixed: set select2 default language to zh-CN.
4) optimization: toggle dict type dropdown list label to type description.
5) optimization: bang start and end date picker by onpicked function.

#### [2016/3/11]
1) add: markdown editor to oa notify page.
2) add: office info to userinfo

#### [2016/3/23]
1) optimization: claim to do list, add office data scope filter for kind of DATA_SCOPE_OFFICE* role.
* 判定流程发起人所在部门跟当前部门审批人是否在同一个组织，
待办签收列表，角色的数据权限设置为“所在部门及以下数据/所在部门数据”时，
可自动进行跨部门待办过滤（默认开启，可配置关闭）
* 【同部门测试账户】 je1/je1   sd_jsb/admin
* 【不同部门测试账户】lx_admin/admin
2) optimization: 组织机构异步加载(ajax)则通过sql遍历tree，否则内存递归遍历tree(Coding...)

#### [2016/4/1]
1) optimization: merge latest src from released github of ThinkGem.
2) optimization: move rest from web to oa project
3) add: (CI)Hudson>Jenkins continuous integration.

#### [2016/4/11]
2) optimization: add bottom-sticker.js for form-actions and list-pagination.
3) branches: pactera-jeesite-1.2.10.SC.bi for 山航常旅客和渠道项目 since V1.2.10
4) add: findbugs plugin for Jenkins of CI. / jetty plugin for booting.

### pactera-jeesite v1.2.11-SNAPSHOT release log:
#### [2016/4/14]
1) release: 1.2.11-SNAPSHOT
2）fixed: high warning by findbugs
3）optimization: parent pom setting for extends
4）fixed: Cancel rendering oa nofity info while the project of web dist dose not buildend the related oa artifact 
	,at the mean while global config is setted by oa.notify.remind.interval=0.

#### [2016/4/19]
1) add: background images cycling slideshow for login page.
2) add: append profile image to dropdown menu.
3) optimization: modify button's hover style via thoughtworks homepage.
4) optimization: add sitemap generator to menu list for seo base sitemapgen4j.
5) fix: In order to adapt to all scenarios , and modify the favicon.ico relative path to absolute path in the taglib.jsp .

#### [2016/5/6]
1) add: colResizable-1.6.js demo for testdatalist.jsp

#### [2016/5/20]
1) optimization: moidfy demo mode warn message from script to langtable.
2) optimization: add Typewriter action for project title

#### [2016/5/27]
1) fix: clone cell style to data format(poi)
2）fix: change page row number to total row number for list.

#### [2016/6/2]
1) optimization: iterated jerichotab.js upgrated 2.0.3, add afn_tabDblClick options.
2) optimization: add hotkeys to gridify for pagination