-------------------------------------第十章
-----------课后作业
1.产生一个报告显示 BLAKE的所有下级（包括直接和间接下级）雇员的名字、薪水和部门号。
select lpad(ename,length(ename)+(level*2)-2,'*') 经理,sal,deptno
from emp
start with ename = 'BLAKE'-----------------从哪里开始
connect by prior  empno = mgr --------------是自上而下还是自下而上

2.创建一个报告显示对于雇员 SMITH 经理的层次，包括级别和姓名，首先显示他的直接经理。
select empno,lpad(ename,length(ename)+(level*2)-2,'*') 经理,mgr
from emp
start with ename = (select ename from emp where empno = (select mgr from emp where ename= 'SMITH'))
connect by prior mgr = empno

3.创建一个缩进报告显示经理层次，从名字为 KING的雇员开始，显示雇员的名字、经理ID和部门ID。
select lpad(ename,length(ename)+(level*2)-2,'*') 经理,mgr,deptno
from emp
start with ename = 'KING'
connect by prior empno = mgr

4.产生一个公司组织图表显示经理层次。从最顶级的人开始，----老板king
排除所有job为CLERK的人，还要排除FORD和那些对FORD报告的雇员。---ford 及他下属
select lpad(ename,length(ename)+(level*2)-2,'*') 姓名,mgr,deptno
from emp
where job <> 'CLERK' 
start with ename = (select ename from emp where mgr is null)
connect by prior empno = mgr
and ename <> 'FORD'

















