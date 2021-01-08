----------------------------等值连接
----------------内连接
select e.*,d.*
from emp e,dept d
where e.deptno = d.deptno
--sql标准语法
select e.*,d.*
from emp e
inner join dept d
on e.deptno = d.deptno

---------------左外连接
select e.*,d.deptno,d.dname
from emp e,dept d
where e.deptno = d.deptno(+)
--sql标准语法
select e.*,d.deptno,d.dname
from emp e
left join dept d
on e.deptno = d.deptno

---------------右外连接
select e.*,d.deptno,d.dname
from emp e,dept d
where e.deptno(+) = d.deptno
--sql标准语法
select e.*,d.deptno,d.dname
from emp e
right join dept d
on e.deptno = d.deptno

---------------全外连接
--sql标准语法
select e.*,d.deptno,d.dname
from emp e
full join dept d
on e.deptno = d.deptno

-------------自连接
-----与自己本身进行连接
select worker.ename,worker.mgr,boss.empno,boss.ename
from emp worker,emp boss
where worker.mgr = boss.empno
--sql标准语法
select worker.ename,worker.mgr,boss.empno,boss.ename
from emp worker join emp boss
on worker.mgr = boss.empno
----------------------------------非等值连接
-------写法一
select e.*,s.*
from emp e, salgrade s
where e.sal >=s.losal and e.sal <= s.hisal

-------写法二
select e.*,s.*
from emp e, salgrade s
where e.sal between s.losal and s.hisal

-------------------------------交叉连接
select e.*,d.*
from emp e
cross join dept d

--------------------------------自然连接
使用注意：
1.条件苛刻（列名称相同，数据类型相同；这样的列可以支持多个）
2.如果有个列名称相同，数据类型不同，可以使用using子句
3.USING子句中的用到的列不能使用表名和别名作为前缀。
4.NATURAL JOIN子句和USING子句是相互排斥的，不能同时使用。
select emp.ename,dept.dname
from emp
natural join dept

select e.ename,d.dname,d.loc
from emp e join dept d using(deptno)

--------------------------------ON子句
select e.ename,e.deptno,d.dname
from emp e 
join dept d
     on e.deptno = d.deptno

----------------------------第五章
-------练习一
1.写一个查询，显示所有员工姓名，部门编号，部门名称。
select e.ename,e.deptno,d.dname
from emp e, dept d
where e.deptno = d.deptno(+)
---------sql标准写法
select e.ename,e.deptno,d.dname
from emp e 
left join dept d
on e.deptno = d.deptno

2.写一个查询，显示所有工作在CHICAGO并且奖金不为空的员工姓名，工作地点，奖金
select e.ename,d.loc,e.comm
from emp e, dept d
where e.deptno = d.deptno(+)
and d.loc ='CHICAGO' and e.comm is not null
---------sql标准写法
select e.ename,d.loc,e.comm
from emp e 
left join dept d
on e.deptno = d.deptno
where d.loc ='CHICAGO' and e.comm is not null

3.写一个查询，显示所有姓名中含有A字符的员工姓名，工作地点。
select e.ename,d.loc
from emp e,dept d
where e.deptno = d.deptno(+)
and e.ename like '%A%'
---------sql标准写法
select e.ename,d.loc
from emp e 
left join dept d
on e.deptno = d.deptno
where e.ename like '%A%'

-----练习二
1.查询每个员工的编号，姓名，工资，工资等级，所在工作城市，按照工资等级进行升序排序。
select e.empno,e.ename,e.sal,s.grade,d.loc
from emp e,dept d,salgrade s
where e.deptno = d.deptno 
and e.sal between s.losal and s.hisal
order by s.grade
---------sql标准写法
select e.empno,e.ename,e.sal,s.grade,d.loc
from emp e 
join dept d
     on e.deptno = d.deptno
join salgrade s
     on e.sal between s.losal and s.hisal
order by s.grade

---------思考
思考：查询每个员工的姓名和直接上级姓名？(自身连接)
select worker.ename,worker.mgr,boss.empno,boss.ename
from emp worker,emp boss
where worker.mgr = boss.empno
--sql标准语法
select worker.ename,worker.mgr,boss.empno,boss.ename
from emp worker join emp boss
on worker.mgr = boss.empno

---------练习三
1.查询所有工作在NEW YORK和CHICAGO的员工姓名，员工编号，以及他们的经理姓名，经理编号。
select worker.ename,worker.empno,boss.ename,boss.empno
from emp worker,dept d,emp boss
where worker.mgr = boss.empno
and worker.deptno = d.deptno
and d.loc in ('NEW YORK','CHICAGO')
---------sql标准写法
select worker.ename,worker.empno,boss.ename,boss.empno
from emp worker 
join dept d
     on worker.deptno = d.deptno
join emp boss
     on worker.mgr = boss.empno
where d.loc in ('NEW YORK','CHICAGO')

2.第上一题的基础上，添加没有经理的员工King，并按照员工编号排序。
select worker.ename,worker.empno,boss.ename,boss.empno
from emp worker,dept d,emp boss
where worker.mgr = boss.empno(+)
and worker.deptno = d.deptno
and d.loc in ('NEW YORK','CHICAGO')
order by worker.empno
---------sql标准写法
select worker.ename,worker.empno,boss.ename,boss.empno
from emp worker 
join dept d
     on worker.deptno = d.deptno
left join emp boss
     on worker.mgr = boss.empno
where d.loc in ('NEW YORK','CHICAGO')

3.查询所有员工编号，姓名，部门名称，包括没有部门的员工也要显示出来。
select e.empno,e.ename,d.dname
from emp e,dept d
where e.deptno = d.deptno(+)
---------sql标准写法
select e.empno,e.ename,d.dname
from emp e
left join dept d
     on e.deptno = d.deptno
     
----------练习四
----使用SQL-99写法，完成如下练习
1.创建一个员工表和部门表的交叉连接。
select emp.*,dept.*
from emp
cross join dept

2.使用自然连接，显示入职日期在80年5月1日之后的员工姓名，部门名称，入职日期
select emp.ename,dept.dname,emp.hiredate
from emp
natural join dept
where emp.hiredate > to_date('1980-05-01','yyyy-mm-dd')

3.使用USING子句，显示工作在CHICAGO的员工姓名，部门名称，工作地点
select e.ename,d.dname,d.loc
from emp e join dept d using(deptno)
where loc = 'CHICAGO'

4.使用ON子句，显示工作在CHICAGO的员工姓名，部门名称，工作地点，薪资等级
select e.ename,d.dname,d.loc,s.grade
from emp e
join dept d
     on e.deptno = d.deptno
join salgrade s
     on e.sal between s.losal and s.hisal 
where d.loc = 'CHICAGO'
5.使用左连接，查询每个员工的姓名，经理姓名，没有经理的King也要显示出来。
select worker.ename,boss.ename
from emp worker 
left join emp boss
     on worker.mgr = boss.empno

6.使用右连接，查询每个员工的姓名，经理姓名，没有经理的King也要显示出来。
select worker.ename,boss.ename
from emp boss 
right join emp worker
     on worker.mgr = boss.empno

--------------------课后作业
1.显示员工SMITH的姓名，部门名称，直接上级名称
select worker.ename,d.dname,boss.ename
from emp worker,dept d,emp boss
where worker.deptno = d.deptno
and worker.mgr = boss.empno
and worker.ename = 'SMITH'
---------sql标准写法
select worker.ename,d.dname,boss.ename
from emp worker 
natural join dept d
join emp boss
     on worker.mgr = boss.empno
where worker.ename = 'SMITH'

2.显示员工姓名，部门名称，工资，工资级别，要求工资级别大于4级。
select e.ename,d.dname,e.sal,s.grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal
and s.grade>4
---------sql标准写法
select e.ename,d.dname,e.sal,s.grade
from emp e
natural join dept d
join salgrade s
     on e.sal between s.losal and s.hisal
where s.grade>4

3.显示员工KING和FORD管理的员工姓名及其经理姓名
select worker.ename,boss.ename
from emp worker,emp boss
where worker.mgr = boss.empno(+)
and (boss.ename in ('KING','FORD')
or worker.ename in ('KING','FORD'))
---------sql标准写法
select worker.ename,boss.ename
from emp worker 
left join emp boss
     on worker.mgr = boss.empno
where boss.ename in ('KING','FORD')
or worker.ename in ('KING','FORD')

4.显示员工姓名，参加工作时间，经理名，参加工作时间，要求参加时间比经理早。
select worker.ename,worker.hiredate,boss.ename,boss.hiredate
from emp worker,emp boss
where worker.mgr = boss.empno
and worker.hiredate < boss.hiredate
---------sql标准写法
select worker.ename,worker.hiredate,boss.ename,boss.hiredate
from emp worker
join emp boss
     on worker.mgr = boss.empno
where worker.hiredate < boss.hiredate




     
