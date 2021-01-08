--------------------------------第六章
-----------------练习一
1.查询部门20的员工，每个月的工资总和及平均工资。
-----方法一
select deptno,sum(sal) 总工资,avg(sal) 平均工资
from emp
where deptno = 20
group by deptno
-----方法二
select deptno,sum(sal) 总工资,avg(sal) 平均工资
from emp
group by deptno
having deptno = 20

2.查询工作在CHICAGO的员工人数，最高工资及最低工资。
------方法一
select d.loc,count(1),max(sal),min(sal)
from emp e , dept d
where e.deptno = d.deptno
group by d.loc
having d.loc = 'CHICAGO'
------方法二
select d.loc,count(1),max(sal),min(sal)
from emp e
join dept d
     on e.deptno = d.deptno
where d.loc = 'CHICAGO'
group by d.loc
3.查询员工表中一共有几种岗位类型。
select count(distinct job)
from emp

----------------练习二
1.查询每个部门的部门编号，部门名称，部门人数，最高工资，最低工资，工资总和，平均工资。
select e.*,d.dname 部门名称
from
(select deptno,count(deptno) 部门人数,max(sal) 最高工资,min(sal) 最低工资,
sum(sal) 工资总和,avg(sal) 平均工资
from emp 
group by deptno) e,dept d
where e.deptno = d.deptno

2.查询每个部门，每个岗位的部门编号，部门名称，
岗位名称，部门人数，最高工资，最低工资，工资总和，平均工资。
select e.*,d.dname 部门名称
from
(select deptno,job 岗位名称,count(1) 部门人数,max(sal) 最高工资,min(sal) 最低工资,
       sum(sal) 工资总和,avg(sal) 平均工资
from emp
group by deptno,job) e,dept d
where e.deptno = d.deptno

3.查询每个经理所管理的人数，经理编号，经理姓名，要求包括没有经理的人员信息。
select count(w.mgr) 管理的人数,w.mgr 经理编号,b.ename 经理姓名
from emp w,emp b
where w.mgr = b.empno(+)
group by w.mgr,b.ename

--------------------练习三
1.查询部门人数大于2的部门编号，部门名称，部门人数。
select e.deptno 部门编号,d.dname 部门名称,count(e.deptno) 部门人数
from emp e,dept d
where e.deptno = d.deptno
group by e.deptno,d.dname
having count(e.deptno) > 2

2.查询部门平均工资大于2000，且人数大于2的部门编号，部门名称，部门人数，部门平均工资，
并按照部门人数升序排序。
select e.deptno 部门编号,d.dname 部门名称,count(e.deptno) 部门人数,avg(sal) 平均工资
from emp e,dept d
where e.deptno = d.deptno
group by e.deptno,d.dname
having avg(sal) > 2000 and count(e.deptno) > 2
order by count(e.deptno)

----------------课后作业
1.查询部门平均工资在2500元以上的部门名称及平均工资
select d.dname,avg(sal)
from emp e,dept d
where e.deptno = d.deptno
group by d.dname,d.deptno
having avg(sal) > 2500

2.查询员工岗位中不是以“SA”开头并且平均工资在2500元以上的岗位及平均工资，
并按平均工资降序排序。
select job,avg(sal)
from emp
where job not like 'SA%'
group by job
having avg(sal) > 2500

3.查询部门人数在2人以上的部门名称、最低工资、最高工资,
并对求得的工资进行四舍五入到整数位。
select d.dname,round(min(sal),0),round(max(sal),0)
from emp e,dept d
where e.deptno = d.deptno
group by d.dname,d.deptno
having count(d.deptno) > 2

4.查询岗位不为SALESMAN，工资和大于等于2500的岗位及每种岗位的工资和。 
select job,sum(sal)
from emp
where job <> 'SALESMAN'
group by job 
having sum(sal) >= 2500

5.显示经理号码和经理姓名，这个经理所管理员工的最低工资，没有经理的KING也要显示，
不包括最低工资小于3000的，按最低工资由高到低排序。
select b.mgr,b.ename,min(w.sal)
from emp w,emp b
where w.mgr = b.empno(+)
group by b.mgr,b.ename
having  min(w.sal) >=3000
order by min(w.sal) desc

6.写一个查询，显示每个部门最高工资和最低工资的差额
select deptno,max(sal) - min(sal) 差额
from emp
group by deptno



