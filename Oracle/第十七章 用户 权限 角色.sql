---------------------------------------第十七章
用户：一般由DBA(数据库管理员)创建和维护的，创建用户后，用户不可以执行任何Oracle操作，
      包括打开会话窗，只有赋予用户相关的权限，才能操作
      
用sys用户创建用户和给予用户quanxian

创建用户：create user userName identified by password 

分配权限：grant 权限 to 用户

删除用户：drop user userName

权限：
权限分类：
     系统权限：允许用户在数据库中执行指定的行为，一般可以理解成比较通用的一类权限。
     对象权限：允许用户访问和操作一个指定的对象，
                该对象是一个确切存储在数据库中的命名对象。
                
授予系统权限：grant 系统权限列表[,系统权限列表,...]  to 用户[,用户] [with admin option]
with admin option:允许权限的接受者再把此特权授予其他用户

回收系统权限：REVOKE sys_priv_list(系统权限列表) FROM user_list(用户);
注意：回收系统权限后，给予出去的权限不会被回收

授予对象权限：grant on 对象名 to [user/public] [with admin option]
回收对象权限：revoke 对象权限种类 ON 对象名 FROM user;
注意：回收对象权限后，给予出去的权限会被回收

角色：是权限的集合
创建角色：create role roleName

为角色授予权限：grant 权限列表 to roleName

通过角色为用户授权：grant roleName to 用户

通过角色从用户收回权限：revoke roleName from 用户
从角色回收权限：revoke 权限 from  roleName
删除角色：drop role roleName               
                
----------课后作业                
1.建立新用户neu
在sys用户上command：create user neu identified by 123456;

2.给用户neu授权,使其能够登录到数据库，能够查询scott下的emp表，
能修改emp表的sal,ename两个字段
grant create session to neu;-----登录到数据库
grant select on scott.emp to neu; ----查询scott下的emp表               
grant update on scott.emp to neu; ----修改emp表的sal,ename两个字段               
                
3.回收用户neu的登录权限
revoke create session from neu;

4.回收用户neu的所有对象权限
revoke all privilege on scott.emp from neu;                
                
5.建立角色role_neu
create role role_neu;               
                
6.给角色role_neu授权,使其能够登录到数据库
grant create session to role_neu; 
               
7.赋角色role_neu给用户neu
grant role_neu to neu               
                
8.删除角色role_neu
drop role role_neu                
                
9.删除用户neu
drop user neu                
                

