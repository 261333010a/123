---------------------------第二章
练习一：
1.使用两种方式查询所有员工(EMP)信息
select * from emp

select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp

2.查询(EMP)员工编号、员工姓名、员工职位、员工月薪、工作部门编号。
select empno,ename,job,sal,deptno
from emp

练习二：
1.员工转正后，月薪上调20%，请查询出所有员工转正后的月薪。
select ename,sal*1.2 转正月薪
from emp

2.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的年薪所得
（不考虑奖金部分,年薪的试用期6个月的月薪+转正后6个月的月薪)
select ename,sal*6+sal*1.2 第一年年薪
from emp

练习三：
1.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的所有收入
（需考虑奖金部分)，要求显示列标题为员工姓名，工资收入，奖金收入，总收入。
select ename 员工姓名,sal*6+sal*1.2*6 工资收入 ,nvl(comm,0) 奖金收入,
sal*6+sal*1.2*6 + nvl(comm,0) 总收入
from emp

练习四：
1.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的所有收入
（需考虑奖金部分)，要求显示格式为:XXX的第一年总收入为XXX。
select ename || '的第一年总收入为' || (sal*6+sal*1.2*6 + nvl(comm,0))
from emp

2.查询员工表中一共有哪几种岗位类型。
select distinct job
from emp

课后作业：
1.分别选择员工表、部门表、薪资等级表中的所有数据。
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp-------员工表
select deptno, dname, loc from dept---------部门表
select grade, losal, hisal from salgrade-------薪资表

2.分别查看员工表、部门表、薪资等级表的表结构
desc emp
desc dept
desc salgrade---------在command打开

---------------------------第三章
练习一：
1.查询职位为SALESMAN的员工编号、职位、入职日期。
select empno,job,hiredate
from emp
where job = 'SALESMAN'

2.查询1985年12月31日之前入职的员工姓名及入职日期。
select ename,hiredate
from emp
where hiredate>to_date('1985-12-31','yyyy-mm-dd')

3.查询部门编号不在10部门的员工姓名、部门编号。
select ename,deptno
from emp
where deptno not in(10)

练习二：
1.查询入职日期在82年至85年的员工姓名，入职日期。
select ename,hiredate
from emp
where hiredate between to_date('1982-01-01','yyyy-mm-dd') and to_date('1985-12-31','yyyy-mm-dd')

2.查询月薪在3000到5000的员工姓名，月薪。
select ename,sal
from emp
where sal between 3000 and 5000

3.查询部门编号为10或者20的员工姓名，部门编号。
select ename,deptno
from emp
where deptno in(10,20)

4.查询经理编号为7902, 7566, 7788的员工姓名，经理编号。
select ename,mgr
from emp
where mgr in(7902,7566,7788)

练习三：
1.查询员工姓名以W开头的员工姓名。
select ename
from emp
where ename like 'W%'

2.查询员工姓名倒数第2个字符为T的员工姓名。
select ename
from emp
where ename like '%T_'

3.查询奖金为空的员工姓名，奖金。
select ename,comm
from emp
where comm is null

联系四：
1.查询工资超过2000并且职位是MANAGER,或者职位是SALESMAN的员工姓名、职位、工资
select ename,job,sal
from emp
where sal>2000
and job = 'MANAGER'
or job = 'SALESMAN'

2.查询工资超过2000并且职位是 MANAGER或SALESMAN的员工姓名、职位、工资。
select ename,job,sal
from emp
where sal > 2000
and (job = 'MANAGER'
or job = 'SALESMAN')

3.查询部门在10或者20，并且工资在3000到5000之间的员工姓名、部门、工资。
select ename,deptno,sal
from emp
where deptno in (10,20)
and sal between 3000 and 5000

4.查询入职日期在81年，并且职位不是SALES开头的员工姓名、入职日期、职位。
select ename,hiredate,job
from emp
where hiredate  between to_date('1981-01-01','yyyy-mm-dd') and to_date('1981-12-31','yyyy-mm-dd')
and job not like 'SALES%'

5.查询职位为SALESMAN或MANAGER，部门编号为10或者20，姓名包含A的员工姓名、职位、部门编号。
select ename,job,deptno
from emp
where job in('SALESMAN','MANAGER')
and deptno in (10,20)
and ename like '%A%'

练习五：
1.查询部门在20或30的员工姓名，部门编号，并按照工资升序排序。
select ename,deptno
from emp
where deptno in (20,30)
order by sal

2.查询工资在2000-3000之间，部门不在10号的员工姓名，部门编号，工资，并按照部门升序，工资降序排序。
select ename,deptno,sal
from emp
where sal between 2000 and 3000
and deptno not in 10
order by sal desc 

3.查询入职日期在82年至83年之间，职位以SALES或者MAN开头的员工姓名，入职日期，职位，并按照入职日期降序排序。
select ename,hiredate,job
from emp
where hiredate between to_date('1982-01-01','yyyy-mm-dd') and to_date('1983-12-31','yyyy-mm-dd')
and job like 'SALES%' 
or job like 'MAN%'
order by hiredate desc

课后作业：
1.查询入职时间在1982-7-9之后，并且不从事SALESMAN工作的员工姓名、入职时间、职位。
select ename,hiredate,job
from emp
where hiredate>to_date('1982-7-9','YYYY-MM-DD')
and job not in 'SALESMAN'

2.查询员工姓名的第三个字母是a的员工姓名。
select *
from emp
where ename like '__A%'

3.查询除了10、20号部门以外的员工姓名、部门编号。
select ename,deptno
from emp
where deptno not in(10,20)

4.查询部门号为30号员工的信息，先按工资降序排序，再按姓名升序排序。 
select *
from emp
where deptno = 30
order by sal desc,ename asc

5.查询没有上级的员工(经理号为空)的员工姓名。
select ename
from emp
where mgr is null

6.查询工资大于等于4500并且部门为10或者20的员工的姓名\工资、部门编号。
select ename,sal,deptno
from emp
where sal >= 4500
and deptno in(10,20)

-----------------------------第四章
练习一：
1.写一个查询,用首字母大写，其它字母小写显示雇员的 ename，显示名字的长度，并给每列一个适当的标签，
条件是满足所有雇员名字的开始字母是J、A 或 M 的雇员，并对查询结果按雇员的ename升序排序。
（提示：使用initcap、length、substr）
select initcap(ename) as 姓名，length(ename) 长度
from emp
where substr(ename,1,1) in ('J','A','M')

练习二：
1.查询员工姓名中中包含大写或小写字母A的员工姓名。
select ename
from emp
where instr(lower(ename),'a')>0

2.查询部门编号为10或20，入职日期在81年5月1日之后，
并且姓名中包含大写字母A的员工姓名，员工姓名长度
（提示，要求使用INSTR函数，不能使用like进行判断)

select ename, length(ename)
from emp
where deptno in (10,20)
and hiredate > to_date('1981-05-01','YYYY-MM-DD')
and instr(ename,'A')>0

3.查询每个职工的编号,姓名，工资
要求将查询到的数据按照一定的格式合并成一个字符串.
前10位：编号,不足部分用*填充,左对齐
中间10位：姓名，不足部分用*填充,左对齐
后10位：工资，不足部分用*填充,右对齐
select rpad(empno,10,'*') ||rpad(ename,10,'*') || lpad(sal,10,'*')
from emp

练习三：
1.写一个查询，分别计算100.456 四舍五入到小数点后第2位，第1位，整数位的值。
select round(100.456,2),round(100.456,1),round(100.456,0)
from dual

2.写一个查询，分别计算100.456 从小数点后第2位，第1位，整数位截断的值。
select trunc(100.456,2),trunc(100.456,1),trunc(100.456,0)
from dual

练习四：
1.查询每个员工截止到现在一共入职多少天？
select ename,trunc(sysdate-hiredate,0) 入职天数
from emp

2.当前日期为2015年，指定日期格式为DD-MON-RR,指定日期为01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-RR')
from dual

3.当前日期为2015年，指定日期格式为DD-MON-RR,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-RR')
from dual

4.当前日期为1998年，指定日期格式为DD-MON-RR,指定日期为01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-RR')
from dual

5.当前日期为1998年，指定日期格式为DD-MON-RR,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-RR')
from dual

6.当前日期为2015年，指定日期格式为DD-MON-YY,指定日期为01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-YY')
from dual

7.当前日期为1998年，指定日期格式为DD-MON-YY,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-YY')
from dual

练习五：
1.查询服务器当前时间
select sysdate
from dual

2.查询部门10,20的员工截止到2000年1月1日，工作了多少个月，入职的月份。
(提示：使用months_between,extract)
select ename,
trunc(months_between(to_date('2000-01-01','YYYY-MM-DD'),hiredate),0) 工作月份, 
extract(Month FROM hiredate) 入职月份,
deptno
from emp
where deptno in (10,20)

3.如果员工试用期6个月，查询职位不是MANAGER的员工姓名，入职日期，转正日期，
入职日期后的第一个星期一,入职当月的最后一天日期。
（提示：使用add_months,next_day,last_day)
select ename,hiredate,
add_months(hiredate,6),
next_day(hiredate,'星期一'),
last_day(hiredate)
from emp

练习六：
1.显示服务器系统当前时间，格式为2007-10-12 17:11:11(提示：使用to_char函数)
select to_char(sysdate,'YYYY-MM-DD HH24:mm:SS')
from dual

2.显示ename、hiredate 和 雇员开始工作日是星期几，列标签DAY(提示：使用to_char函数)
select ename,hiredate,to_char(hiredate,'day')
from emp

3.查询员工姓名，工资，格式化的工资（￥999,999.99） (提示：使用to_char函数)
select ename,sal,to_char(sal,'L999,999.99')
from emp

4.把字符串2015-3月-18 13:13:13 转换成日期格式，并计算和系统当前时间间隔多少天。 
(提示：使用to_date函数)
select to_date('2015-03-18 13:13:13','YYYY-MM-DD hh24:mi:ss'),
trunc(sysdate-to_date('2015-03-18 13:13:13','YYYY-MM-DD hh24:mi:ss'))
from dual

课后作业：
1.计算2000年1月1日到现在有多少月，多少周（四舍五入）。
select round(months_between(sysdate,to_date('2000-01-01','yyyy-mm-dd')),0),
round((sysdate-to_date('2000-01-01','yyyy-mm-dd'))/7,0)
from dual

2.查询员工ENAME的第三个字母是A的员工的信息(使用2个函数)。
select *
from emp
where ename like '__A%'

select * from emp
where substr(ename,3,1) = 'A' 

3.使用trim函数将字符串‘hello’、‘  Hello ’、‘bllb’、‘ hello    ’
分别处理得到下列字符串ello、Hello、ll、hello。
select trim('h' from 'hello'),
trim(' ' from '  Hello '),
trim('b' from 'bllb'),
trim(' ' from ' hello    ')
from dual

4.将员工工资按如下格式显示：123,234.00 RMB 。
select ename,sal,to_char(sal,'L999,999.99')
from emp

5.查询员工的姓名及其经理编号，要求对于没有经理的显示“No Manager”字符串。
select ename,nvl(to_char(mgr),'No Manager')
from emp

6.将员工的参加工作日期按如下格式显示：月份/年份。 
select ename,to_char(hiredate,'mm/yyyy')
from emp

7.在员工表中查询出员工的工资，并计算应交税款：如果工资小于1000,税率为0，
如果工资大于等于1000并小于2000，税率为10％，
如果工资大于等于2000并小于3000，税率为15％，
如果工资大于等于3000，税率为20％。
select ename,sal,
case
when sal < 1000 then 0
when sal >=1000 and sal < 2000 then sal*0.1
when sal >=2000 and sal <3000 then sal*0.15
when sal >=3000 then sal*0.2
else 0
end 税款
from emp;

8.创建一个查询显示所有雇员的 ename和 sal。格式化sal为 15 个字符长度，
用 $ 左填充，列标签 SALARY。
select ename,sal,lpad(sal,15,'$') as SALARY 
from emp








