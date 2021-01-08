---------------------------------------第十四章
-----------练习一
1.学校有一个选课系统，其中包括如下关系模式：
系(系编号： 主键，
   系名称:  唯一键，
   系主任： 非空约束，
   系所在校去：取值范围只能在南湖校区和浑南校区)
班级(班级编号： 主键，
     班级名称： 唯一键，
     所属系：  外键)

create table tab_grade
(
       col_gradeid number(5) constraint grade_id_pk primary key,
       col_gradename varchar2(40) constraint grade_name_un unique,
       col_gradeboss varchar2(20) not null,
       col_gradeaddress varchar2(20) 
       constraint grade_add_ck check (col_gradeaddress in('南湖校区','浑南校区'))
)

create table tab_class
(
       col_classid number(10) constraint class_id_pk primary key,
       col_classname varchar2(20) constraint class_name_un unique,
       col_grade number(5) not null 
       constraint class_grade_fk references tab_grade(col_gradeid) 
)

2.创建学生表，包含如下属性:
学号 定长字符型 10位 主键
姓名 变长字符型 20位 非空
性别 定长字符型 2位 取值范围只能为男或女
出生日期 日期型 
所在班级 

create table tab_student
(
       col_sid char(10) constraint student_id_pk primary key,
       sname varchar2(20) not null,
       gender char(2) 
       constraint student_gen_ck check (gender between 0 and 1),
       birthday date,
       grade number(10) not null
)
drop table tab_student
-----------课后作业
1.简述5种约束的含义。
主键约束 primary key：一个表只能有1个主键约束，主键不能为空值，
                   主键的列的值不能重复，只能唯一
唯一约束 unique：唯一约束的列的值不能重复，只能唯一，允许有多个空值
                 每个表可以有多个唯一约束
非空约束 not null：被约束的列不能有空值，只能在列级添加
外键约束 foreign key：确保相关联的两个字段的关系，外键参照的是列必须是主键或者唯一键
                       外键列的值必须在引用列值的范围内，或者为空
检查性约束 check：确保某个列的所有行数据都必须满足的条件                       

2.创建学生关系sc，包括属性名：
选课流水号 数值型 主键；
学生编号 非空 外键
课程编号 非空 外键；
成绩     0-100之间

create table sc
(
       sc_classid number(4) primary key,
       sc_studentid char(10) not null
         constraint sc_sid_fk references tab_student(col_sid),
       sc_gradeid number(10) not null
         constraint sc_gid_fk references tab_class(col_classid),
       sc_achievement number(3) 
         constraint sc_ach_ck check (sc_achievement between 0 and 100)
)

3.创建copy_emp，要求格式同emp表完全一样，不包含数据。
create table copy_emp as (select * from emp where 1 = 0)

4.创建copy_dept，要求格式同dept表完全一样，不包含数据。
create table copy_dept as (select * from dept where 1 = 0)

5.设置copy_emp 表中外键deptno，参照copy_dept中deptno,语句能否成功,为什么？
alter table copy_emp add foreign key(deptno) references copy_dept(deptno)
原因：主键或唯一约束不匹配 deptno不是主键或唯一约束

6.追加copy_dept表中主键deptno
alter table copy_dept add primary key(deptno) 





