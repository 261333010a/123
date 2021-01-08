------------------------------第九章
----------练习一
如下练习，使用相关子查询完成
1.查询比所在职位平均工资高的员工姓名，职位。
select ename,job
from emp e
where sal > (select avg(sal) from emp where deptno = e.deptno)

2.查询工资为其部门最低工资的员工编号，姓名，工资。
select empno,ename,sal
from emp e
where sal = (select min(sal) from emp where deptno = e.deptno)

----------练习二
如下练习，用相关子查询完成
1.查询所有雇员编号，名字和部门名字
select empno,ename,(select dname from dept where deptno = e.deptno) 部门名字
from emp e

2.查询哪些员工是经理？
select empno,ename,job
from emp e
where 0 < (select count(1) from emp where mgr = e.empno)

3.查询哪些员工不是经理？
select empno,ename,job
from emp e
where 0 = (select count(1) from emp where mgr = e.empno)

4.查询每个部门工资最低的两个员工编号，姓名，工资
select empno,ename,sal
from emp e
where 2 < (select count(1) from emp where deptno = e.deptno and sal < e.sal)

-----------练习三
如下练习，用exists或not exists完成
1.列出至少有一个雇员的所有部门名称。
select deptno,dname
from dept d
where exists (select '1' from emp where deptno = d.deptno)

2.列出一个雇员都没有的所有部门名称。
select deptno,dname
from dept d
where not exists (select '1' from emp where deptno = d.deptno)

----------课后作业
如下练习，使用相关子查询完成。
1.查询薪水多于他所在部门平均薪水的雇员名字，部门号。
select ename,deptno
from emp e
where sal > (select avg(sal) from emp where deptno = e.deptno)

2.查询员工姓名和直接上级的名字。
select ename,(select ename from emp where e.mgr = empno) 经理
from emp e

3.查询每个部门工资最高的员工姓名，工资。
select ename,sal
from emp e
where sal = (select max(sal) from emp where deptno = e.deptno)

4.查询每个部门工资前两名高的员工姓名，工资。
select ename,sal
from emp e
where 2 > (select count(1) from emp where deptno = e.deptno and sal > e.sal)



