------------------------------第八章
--------练习一
1.分别使用联合运算及完全联合运算完成，按照时间升序顺序，查询员工7839的工作岗位列表。
-----联合运算
select hiredate 时间,job
from emp where empno = 7839
union
select begindate 时间,job
from emp_jobhistory

-----完全联合运算
(select begindate 时间,job
from  emp_jobhistory
union all
select hiredate 时间,job
from emp where empno = 7839)
order by 时间 

2.使用多表连接，查询每个部门的部门编号，部门人数，没有人数的部门显示0。
select d.deptno 部门编号,nvl(e.c,0) 部门人数-----显示0
from       
       (select deptno,count(1) c-----查询部门人数
        from emp
        group by deptno) e, dept d
where e.deptno(+) = d.deptno-----多表连接 左外连接
order by d.deptno

3.使用联合运算，查询每个部门的部门编号，部门人数，没有人数的部门显示0。
select deptno,count(1) 部门人数-----为数字
from emp
group by deptno
union
select deptno,nvl(null,0) 部门人数
from dept

4.使用联合运算，查询10号部门及20号部门的员工姓名，部门编号。
select deptno,ename
from emp
where deptno = 10
union
select deptno,ename
from emp
where deptno = 20

5. 使用集合运算，输出如下效果
select deptno 部门,loc 工作地点,to_char(null) 员工信息,to_date(null) 入职日期
from dept
union
select deptno,to_char(null),ename,hiredate
from emp
------------练习二
1.用集合运算，列出不包含job为SALESMAN 的部门的部门号。
select deptno 部门号
from emp
minus
select deptno
from emp
where job = 'SALESMAN'

2.写一个联合查询，列出下面的信息：EMP表中所有雇员的名字和部门编号,不管他们是否属于任何部门
select deptno,ename
from emp
union 
select deptno,to_char(null)
from dept

3.用集合运算查询出职位为SALESMAN和部门编号为10的人员编号、姓名、职位，不排除重复结果。
select empno,ename,job
from emp
where job = 'SALESMAN'
union all
select empno,ename,job
from emp
where deptno = 10

4.用集合查询出部门为10和20的所有人员编号、姓名、所在部门名称。
select empno,ename,dname
from emp e,dept d
where e.deptno = d.deptno
and d.deptno = 10
union
select empno,ename,dname
from emp e,dept d
where e.deptno = d.deptno
and d.deptno = 20








