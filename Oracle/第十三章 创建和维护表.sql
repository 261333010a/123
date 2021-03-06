------------------------------------------第十三章
---------练习一
1.学校想做一个选课系统，其中涉及到课程表，学生表，请分别创建这两个表，自己思考表中应有的列及数据类型
create table tab_grade
(
       col_classid number(3),
       col_classname varchar2(40),
       col_classteacher varchar2(40)
)

create table tab_student
(
       col_sid number(3),
       col_sname varchar2(40),
       col_age number(3)
)
---------练习二
1.通过子查询的方式创建一个表dept10,该表保存10号部门的员工数据。
create table dept10 as (select * from emp where deptno = 10)

---------练习三
1.在员工表中添加一个性别列，列名为gender，类型为char(2)，默认值为“男”
alter table emp_new add(gender char(2))
alter table emp_new modify(gender default 1)


select empno, ename, job, mgr, hiredate, sal, comm, deptno, dname, gender from emp_new
2.修改员工表中性别列的数据类型为char(4)
alter table emp_new modify(gender char(4))

3.修改员工表中性别列的默认值为“女”
alter table emp_new modify(gender default 0)

4.删除员工表中的性别列
alter table emp_new drop column gender
alter table emp drop (gender)

---------课后作业
1.请分析按照以下要求都需要建立什么类型的字段?
(1)最大2000个字节定长字符串
char(2000)
(2)如果输入‘张三’ 后添空格6个
char(10)
(3)性别输入'男'或'女’
char(2)
(4)最大4000个字节变长字符串。
varchar2(4000)
(5)如果在数据库中输入'张三'则显示数据'张三’
varchar2(20)
(6)表示数字范围为- 10的125次方到10的126次方, 可以表示小数 也可以表示整数
number
(7)最大表示4位整数  -9999 到 9999
number(4)
(8)表示5位有效数字 2位小数的 一个小数  -999.99 到 999.99
number(5,2)
(9)包含年月日和时分秒
date
(10)包含年月日和时分秒毫秒
timestamp
(11)二进制大对象图像/声音
blob

2.创建表date_test,包含列d，类型为date型。
试向date_test表中插入两条记录，一条当前系统日期记录，一条记录为“1998-08-18”
create table date_test 
(
       d date
)
insert into date_test values(sysdate)
insert into date_test values(to_date('1998-08-18','yyyy-mm-dd'))

3.创建与dept表相同表结构的表dtest，将dept表中部门编号在40之前的信息插入该表。
create table dtest as (select * from dept where deptno < 40)

3.创建与emp表结构相同的表empl，并将其部门编号为前30号的员工信息复制到empl表。
create table empl as (select * from emp where deptno <= 30)

4.试为学生表student增加一列学生性别gender 默认值 “女”。
alter table tab_student add(gender char(2))
alter table tab_student modify(gender default 0)

5.试修改学生姓名列数据类型为定长字符型10位。
alter table tab_student modify(col_sname char(10))






