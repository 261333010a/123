--------------------------------------第十六章
序列(sequence)
---创建序列 
create sequence sequenceName
minvalue 1 ----最小值
maxvalue 999999999 ----最大值
start with 1 ----开始值
increment by 1 ----每次增加值
cache 20 ----缓存数量 不用理

属性：currval 当前值 nextval 下一个值
先访问下一个值 ，在访问当前值
select sequenceName.nextval from dual ----每执行一次会产生一个新值
select sequenceName.currval from dual ----返回当前值
---利用序列生成主键id
insert into emp(empno,ename) values(sequenceName.nextval,'erha')

修改序列
alter sequence sequenceName [increment by ]...
ps:修改序列的语法不能修改start with 子句

删除序列
drop sequence sequenceName

rowid(伪列) 系统自动产生
标示每一条数据库行记录的物理地址，能比通过数据值查询更快的定位到一条行记录
select rowid,ename
from emp

格式：oooooo        fff            bbbbbb   rrr
      数据对象编号  相关文件编号  块编号   行编号


索引(index)
单列索引：建立在表中的某一列
语法：create index indexName on table (column)

复合索引：建立在表中某几列的组合上
语法：create index indexName on table (column1,column2)


适合创建索引的情况
  表数据量很大
  要查询的结果集在2%-4%左右
  经常用来做WHERE条件中的列或者多表连接的列
  查询列的数据范围分布很广
  查询列中包含大量的NULL值,因为空值不包含在索引中
  
不适合创建索引的情况
  数据量很小的表
  在查询中不常用来作为查询条件的列
  频繁更新的表
  索引列作为表达式的一部分被使用时，比如常查询的条件是SALARY*12，此时在SALARY列上创建索引是没有效果的
  查询条件中有单行函数时，用不上索引
  
索引缺点：①占用空间 ②降低dml操作的速度

删除索引：drop index indexName

同义词(synonym)
好处：
  可以简化对数据库对象的访问;
  方便对其他用户表的访问;
  简化过长的对象名称;
  节省大量的数据库空间，对不同用户的操作同一张表没有多少差别;
  扩展的数据库的使用范围，能够在不同的数据库用户之间实现无缝交互;
  同义词可以创建在不同一个数据库服务器上，通过网络实现连接;

创建同义词语法：create [public] synonym synonymName
                 for [schema.]对象名
                  
删除同义词：drop synonym synonymName

--------练习一
1.创建一个序列，该序列起始值从1开始，无最大值，增量是1，不循环。
create sequence test_seq
start with 1 -------起始值
minvalue 1 ----------最小值为1
nomaxvalue -------无最大值
increment by 1 --------每次增加1

2.查询序列的当前值及下一个值
select test_seq.nextval from dual-------下一个值
select test_seq.currval from dual-------当前值

3.使用第1题所建的序列，向部门表中插入两条记录，部门编号使用序列值，
部门名称分别为：Education、Market，城市分别为：DALLAS、WASHTON
insert into dept values(test_seq.nextval,'Education','DALLAS')
insert into dept values(test_seq.nextval,'Market','WASHTON')
SELECT * FROM DEPT

--------练习二
电脑不给力，做不了

--------练习三
1.有如下关系模式，
student(sno,sname,gender,birthday,email);--学生
course(cno,cname,type,credit);--课程
sc（sno,cno,grade);--选课
试分析哪些列上适合创建索引？
sno,cno

--------课后作业
1.创建序列，起始位1，自增为1，最小值为1，最大值为9999
create sequence test_ss
start with 1
minvalue 1
maxvalue 9999
increment by 1

2.创建序列，起始值为50，每次增加5；
create sequence test_se
start with 50
increment by 5

3.在表copy_dept中插入记录，其中部门号码采用上一步中创建的序列生成；
insert into copy_dept values(test_se.nextval,'Eat','shanghai')

4.请为工资创建索引，比较<10000,>1000,与round（sal）>10000,哪个索引有效，哪个索引无效；
create index ind_emp_sal on emp(sal)

select * from emp where sal < 10000
select * from emp where sal > 1000
select * from emp where round(sal) > 10000 ----无效 有函数









