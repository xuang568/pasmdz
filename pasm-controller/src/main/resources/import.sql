insert  into `tb_user`(`id`,`address`,`avatar`,`birthday`,`create_time`,`delete_status`,`description`,`email`,`locked`,`nick_name`,`password`,`sex`,`telephone`,`update_time`,`user_name`) values (1,'上海','https://gitee.com/uploads/78/559378_whoismy8023.png?1482721399','2018-07-07 17:17:17','2018-07-07 17:17:17',0,'超级管理员','1253217959@qq.com',0,'admin','3931MUEQD1939MQMLM4AISPVNE',1,'13761754708','2018-07-07 17:17:17','admin');
insert  into `tb_role`(`id`,`create_time`,`description`,`name`,`role_key`,`status`,`update_time`) values (1,'2017-01-09 17:25:30','超级管理员','administrator','administrator',0,'2017-01-09 17:26:25');
insert  into `tb_resource`(`id`,`create_time`,`description`,`icon`,`is_hide`,`level`,`name`,`sort`,`source_key`,`source_url`,`type`,`update_time`,`parent_id`) values (1,'2018-07-07 17:17:17','系统管理',NULL,0,1,'系统管理',1,'system:index','javascript:void(0);',1,'2018-07-07 17:17:17',NULL),(2,'2018-07-07 17:17:17','用户管理',NULL,0,2,'用户管理',1,'system:user:index','/user/index',1,'2018-07-07 17:17:17',1),(3,'2018-07-07 17:17:17','用户编辑',NULL,0,3,'用户编辑',1,'system:user:edit','/user/edit/**',2,'2018-07-07 17:17:17',2),(4,'2018-07-07 17:17:17','用户添加',NULL,0,3,'用户添加',2,'system:user:add','/user/add',2,'2018-07-07 17:17:17',2),(5,'2018-07-07 17:17:17','用户删除',NULL,0,3,'用户删除',3,'system:user:delete','/user/delete/**',2,'2018-07-07 17:17:17',2),(6,'2018-07-07 17:17:17','角色分配',NULL,0,3,'角色分配',4,'system:user:grant','/user/grant/**',2,'2018-07-07 17:17:17',2),(7,'2018-07-07 17:17:17','角色管理',NULL,0,2,'角色管理',2,'system:role:index','/role/index',1,'2018-07-07 17:17:17',1),(8,'2018-07-07 17:17:17','角色编辑',NULL,0,3,'角色编辑',1,'system:role:edit','/role/edit/**',2,'2018-07-07 17:17:17',7),(9,'2018-07-07 17:17:17','角色添加',NULL,0,3,'角色添加',2,'system:role:add','/role/add',2,'2018-07-07 17:17:17',7),(10,'2018-07-07 17:17:17','角色删除',NULL,0,3,'角色删除',3,'system:role:delete','/role/delete/**',2,'2018-07-07 17:17:17',7),(11,'2018-07-07 17:17:17','资源分配',NULL,0,3,'资源分配',4,'system:role:grant','/role/grant/**',2,'2018-07-07 17:17:17',7),(12,'2018-07-07 17:17:17','资源管理',NULL,0,2,'资源管理',3,'system:resource:index','/resource/index',1,'2018-07-07 17:17:17',1),(13,'2018-07-07 17:17:17','资源编辑',NULL,0,3,'资源编辑',1,'system:resource:edit','/resource/edit/**',2,'2018-07-07 17:17:17',12),(14,'2018-07-07 17:17:17','资源添加',NULL,0,3,'资源添加',2,'system:resource:add','/resource/add',2,'2018-07-07 17:17:17',12),(15,'2018-07-07 17:17:17','资源删除',NULL,0,3,'资源删除',3,'system:resource:delete','/resource/delete/*',2,'2018-07-07 17:17:17',12);
insert  into `tb_user_role`(`user_id`,`role_id`) values (1,1);
insert  into `tb_role_resource`(`role_id`,`resource_id`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15);
