DROP TABLE "mock_log";
DROP TABLE "mock_response";
DROP TABLE "mock_url";
DROP TABLE "mock_url_logic";
DROP TABLE "sqlite_sequence";
DROP TABLE "sys_config";
DROP TABLE "sys_dict_data";
DROP TABLE "sys_dict_type";
DROP TABLE "sys_menu";
DROP TABLE "sys_user";

CREATE TABLE "mock_log" ( 
  "log_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
  , "request_method" TEXT
  , "request_ip" TEXT
  , "hit_url" TEXT
  , "request_url" TEXT
  , "response_detail" TEXT
  , "request_detail" TEXT
  , "del_flag" INTEGER DEFAULT 0
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" TEXT
);
CREATE TABLE "mock_response" ( 
  "response_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
  , "url_id" INTEGER
  , "content" TEXT
  , "status_code" INTEGER
  , "main" INTEGER DEFAULT 0
  , "description" TEXT
  , "custom_header" TEXT
  , "del_flag" INTEGER DEFAULT 0
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" TEXT
);
CREATE TABLE "mock_url" ( 
  "url_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
  , "url" TEXT(255) NOT NULL
  , "method" TEXT
  , "name" TEXT(150) NOT NULL
  , "description" TEXT(255)
  , "logic" TEXT
  , "del_flag" INTEGER DEFAULT 0
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" TEXT
);
CREATE TABLE "mock_url_logic" ( 
  "logic_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
  , "sub_url" TEXT(200) NOT NULL
  , "del_flag" INTEGER DEFAULT 0
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" TEXT
  , CONSTRAINT "un_sub_url" UNIQUE ("sub_url" COLLATE BINARY ASC) 
    ON CONFLICT IGNORE
);
CREATE TABLE sqlite_sequence(name, seq);
CREATE TABLE "sys_config" ( 
  "config_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
  , "config_name" TEXT
  , "config_key" TEXT
  , "config_value" TEXT
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" TEXT
  , "del_flag" INTEGER DEFAULT 0
);
CREATE TABLE "sys_dict_data" ( 
  "dict_code" INTEGER PRIMARY KEY AUTOINCREMENT
  , "dict_sort" INTEGER
  , "dict_label" TEXT
  , "dict_value" TEXT
  , "dict_type" TEXT
  , "css_class" TEXT
  , "list_class" TEXT
  , "is_default" INTEGER
  , "status" INTEGER
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" TEXT
  , "del_flag" INTEGER DEFAULT 0
);
CREATE TABLE "sys_dict_type" ( 
  "dict_id" INTEGER PRIMARY KEY AUTOINCREMENT
  , "dict_name" TEXT
  , "dict_type" INTEGER
  , "status" INTEGER
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" INTEGER
  , "del_flag" INTEGER DEFAULT 0
);
CREATE TABLE "sys_menu" ( 
  "menu_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
  , "menu_name" TEXT
  , "parent_id" INTEGER
  , "order_num" INTEGER
  , "url" TEXT
  , "target" TEXT
  , "menu_type" INTEGER
  , "visible" INTEGER
  , "icon" TEXT
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" TEXT
  , "user_display" INTEGER DEFAULT 1
  , "del_flag" INTEGER DEFAULT 0
);
CREATE TABLE "sys_user" ( 
  "user_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
  , "login_name" TEXT NOT NULL
  , "user_name" TEXT
  , "user_type" INTEGER DEFAULT 0
  , "email" TEXT
  , "phonenumber" TEXT
  , "sex" INTEGER
  , "avatar" TEXT
  , "password" TEXT
  , "salt" TEXT
  , "status" INTEGER DEFAULT 0
  , "del_flag" INTEGER DEFAULT 0
  , "login_ip" TEXT
  , "login_date" INTEGER
  , "create_by" INTEGER
  , "create_time" INTEGER
  , "update_by" INTEGER
  , "update_time" INTEGER
  , "remark" TEXT
);

-- vmock/vmock123
insert into "sys_user"("user_id","login_name","user_name","user_type","email","phonenumber","sex","avatar","password","salt","status","del_flag","login_ip","login_date","create_by","create_time","update_by","update_time","remark") values (1,'vmock','超级管理员',1,'','13999999999',1,'','568611dc5efd140df77f58d5ae7c84f6','fc4a41',0,0,'0:0:0:0:0:0:0:1',1576576125897,0,1574406396326,1,1576576125898,'管理员，能多看见【用户管理】和【系统参数】');

insert into "sqlite_sequence"("name","seq") values ('mock_url','1');
insert into "sqlite_sequence"("name","seq") values ('mock_url_logic','1');
insert into "sqlite_sequence"("name","seq") values ('mock_response','1');
insert into "sqlite_sequence"("name","seq") values ('sys_dict_data','19');
insert into "sqlite_sequence"("name","seq") values ('sys_dict_type','6');
insert into "sqlite_sequence"("name","seq") values ('mock_log','1');
insert into "sqlite_sequence"("name","seq") values ('sys_config','1');
insert into "sqlite_sequence"("name","seq") values ('sys_user','1');
insert into "sqlite_sequence"("name","seq") values ('sys_menu','4');

insert into "sys_config"("config_id","config_name","config_key","config_value","create_by","create_time","update_by","update_time","remark","del_flag") values (1,'邀请码','system.invitation.code','vmock',1,1575425366734,1,1575958917712,'用户由前台自己注册系统时，需要输入该邀请码验证身份，才能注册成功。',0);

insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (1,1,'男','0','sys_user_sex','','',0,0,0,2018,0,2018,'性别男',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (2,2,'女','1','sys_user_sex','','',0,0,0,2018,0,2018,'性别女',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (3,3,'未知','2','sys_user_sex','','',0,0,0,2018,0,2018,'性别未知',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (4,1,'显示','0','sys_show_hide','','primary',0,0,0,2018,0,2018,'显示菜单',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (5,2,'隐藏','1','sys_show_hide','','danger',0,0,0,2018,0,2018,'隐藏菜单',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (6,1,'正常','0','sys_normal_disable','','primary',0,0,0,2018,0,2018,'正常状态',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (7,2,'停用','1','sys_normal_disable','','danger',0,0,0,2018,0,2018,'停用状态',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (8,1,'是','Y','sys_yes_no','','primary',0,0,0,2018,0,2018,'系统默认是',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (9,2,'否','N','sys_yes_no','','danger',0,0,0,2018,0,2018,'系统默认否',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (10,1,'成功','0','sys_common_status','','primary',0,0,0,2018,0,2018,'正常状态',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (11,2,'失败','1','sys_common_status','','danger',0,0,0,2018,0,2018,'停用状态',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (12,1,'GET','GET','http_method','','',0,0,1,1574842414507,1,1574842414507,'',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (13,2,'HEAD','HEAD','http_method','','',0,0,1,1574842439909,1,1574842439909,'',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (14,3,'POST','POST','http_method','','',0,0,1,1574842448104,1,1574842448104,'',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (15,4,'PUT','PUT','http_method','','',0,0,1,1574842456031,1,1574842456031,'',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (16,5,'PATCH','PATCH','http_method','','',0,0,1,1574842473821,1,1574842473821,'',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (17,6,'DELETE','DELETE','http_method','','',0,0,1,1574842482767,1,1574842482767,'',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (18,7,'OPTIONS','OPTIONS','http_method','','',0,0,1,1574842497976,1,1574842497976,'',0);
insert into "sys_dict_data"("dict_code","dict_sort","dict_label","dict_value","dict_type","css_class","list_class","is_default","status","create_by","create_time","update_by","update_time","remark","del_flag") values (19,8,'TRACE','TRACE','http_method','','',0,0,1,1574842506060,1,1574842506060,'',0);

insert into "sys_dict_type"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark","del_flag") values (1,'用户性别',0,0,1,2018,1,2018,0,null);
insert into "sys_dict_type"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark","del_flag") values (2,'菜单状态',0,0,1,2018,1,2018,0,null);
insert into "sys_dict_type"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark","del_flag") values (3,'系统开关',0,0,1,2018,1,2018,0,null);
insert into "sys_dict_type"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark","del_flag") values (4,'系统是否',0,0,1,2018,1,2018,0,null);
insert into "sys_dict_type"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark","del_flag") values (5,'系统状态',0,0,1,2018,1,2018,0,null);
insert into "sys_dict_type"("dict_id","dict_name","dict_type","status","create_by","create_time","update_by","update_time","remark","del_flag") values (6,'请求方式',0,0,1,1574841344757,1,1574841344757,0,0);

insert into "sys_menu"("menu_id","menu_name","parent_id","order_num","url","target","menu_type","visible","icon","create_by","create_time","update_by","update_time","remark","user_display","del_flag") values (1,'用户管理',0,1,'/system/user','menuItem',0,0,'fa fa-user',0,1574406396326,0,1574406396326,'用户管理菜单',0,0);
insert into "sys_menu"("menu_id","menu_name","parent_id","order_num","url","target","menu_type","visible","icon","create_by","create_time","update_by","update_time","remark","user_display","del_flag") values (2,'系统参数',0,7,'/system/config','menuItem',0,0,'fa fa-cogs',0,1574406396326,0,1574406396326,'参数设置菜单',0,0);
insert into "sys_menu"("menu_id","menu_name","parent_id","order_num","url","target","menu_type","visible","icon","create_by","create_time","update_by","update_time","remark","user_display","del_flag") values (3,'接口日志',0,2,'/system/log','menuItem',0,0,'fa fa-book',0,1574406396326,0,1574406396326,'操作日志菜单',1,0);
insert into "sys_menu"("menu_id","menu_name","parent_id","order_num","url","target","menu_type","visible","icon","create_by","create_time","update_by","update_time","remark","user_display","del_flag") values (4,'接口一览',0,1,'/system/url','menuItem',0,0,'fa fa-cloud',0,1574406396326,0,1574406396326,'url路径菜单',1,0);

