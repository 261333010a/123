---------------------------�ڶ���
��ϰһ��
1.ʹ�����ַ�ʽ��ѯ����Ա��(EMP)��Ϣ
select * from emp

select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp

2.��ѯ(EMP)Ա����š�Ա��������Ա��ְλ��Ա����н���������ű�š�
select empno,ename,job,sal,deptno
from emp

��ϰ����
1.Ա��ת������н�ϵ�20%�����ѯ������Ա��ת�������н��
select ename,sal*1.2 ת����н
from emp

2.Ա��������6���£�ת������н�ϵ�20%�����ѯ������Ա��������һ�����н����
�������ǽ��𲿷�,��н��������6���µ���н+ת����6���µ���н)
select ename,sal*6+sal*1.2 ��һ����н
from emp

��ϰ����
1.Ա��������6���£�ת������н�ϵ�20%�����ѯ������Ա��������һ�����������
���迼�ǽ��𲿷�)��Ҫ����ʾ�б���ΪԱ���������������룬�������룬�����롣
select ename Ա������,sal*6+sal*1.2*6 �������� ,nvl(comm,0) ��������,
sal*6+sal*1.2*6 + nvl(comm,0) ������
from emp

��ϰ�ģ�
1.Ա��������6���£�ת������н�ϵ�20%�����ѯ������Ա��������һ�����������
���迼�ǽ��𲿷�)��Ҫ����ʾ��ʽΪ:XXX�ĵ�һ��������ΪXXX��
select ename || '�ĵ�һ��������Ϊ' || (sal*6+sal*1.2*6 + nvl(comm,0))
from emp

2.��ѯԱ������һ�����ļ��ָ�λ���͡�
select distinct job
from emp

�κ���ҵ��
1.�ֱ�ѡ��Ա�������ű�н�ʵȼ����е��������ݡ�
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp-------Ա����
select deptno, dname, loc from dept---------���ű�
select grade, losal, hisal from salgrade-------н�ʱ�

2.�ֱ�鿴Ա�������ű�н�ʵȼ���ı�ṹ
desc emp
desc dept
desc salgrade---------��command��

---------------------------������
��ϰһ��
1.��ѯְλΪSALESMAN��Ա����š�ְλ����ְ���ڡ�
select empno,job,hiredate
from emp
where job = 'SALESMAN'

2.��ѯ1985��12��31��֮ǰ��ְ��Ա����������ְ���ڡ�
select ename,hiredate
from emp
where hiredate>to_date('1985-12-31','yyyy-mm-dd')

3.��ѯ���ű�Ų���10���ŵ�Ա�����������ű�š�
select ename,deptno
from emp
where deptno not in(10)

��ϰ����
1.��ѯ��ְ������82����85���Ա����������ְ���ڡ�
select ename,hiredate
from emp
where hiredate between to_date('1982-01-01','yyyy-mm-dd') and to_date('1985-12-31','yyyy-mm-dd')

2.��ѯ��н��3000��5000��Ա����������н��
select ename,sal
from emp
where sal between 3000 and 5000

3.��ѯ���ű��Ϊ10����20��Ա�����������ű�š�
select ename,deptno
from emp
where deptno in(10,20)

4.��ѯ������Ϊ7902, 7566, 7788��Ա�������������š�
select ename,mgr
from emp
where mgr in(7902,7566,7788)

��ϰ����
1.��ѯԱ��������W��ͷ��Ա��������
select ename
from emp
where ename like 'W%'

2.��ѯԱ������������2���ַ�ΪT��Ա��������
select ename
from emp
where ename like '%T_'

3.��ѯ����Ϊ�յ�Ա������������
select ename,comm
from emp
where comm is null

��ϵ�ģ�
1.��ѯ���ʳ���2000����ְλ��MANAGER,����ְλ��SALESMAN��Ա��������ְλ������
select ename,job,sal
from emp
where sal>2000
and job = 'MANAGER'
or job = 'SALESMAN'

2.��ѯ���ʳ���2000����ְλ�� MANAGER��SALESMAN��Ա��������ְλ�����ʡ�
select ename,job,sal
from emp
where sal > 2000
and (job = 'MANAGER'
or job = 'SALESMAN')

3.��ѯ������10����20�����ҹ�����3000��5000֮���Ա�����������š����ʡ�
select ename,deptno,sal
from emp
where deptno in (10,20)
and sal between 3000 and 5000

4.��ѯ��ְ������81�꣬����ְλ����SALES��ͷ��Ա����������ְ���ڡ�ְλ��
select ename,hiredate,job
from emp
where hiredate  between to_date('1981-01-01','yyyy-mm-dd') and to_date('1981-12-31','yyyy-mm-dd')
and job not like 'SALES%'

5.��ѯְλΪSALESMAN��MANAGER�����ű��Ϊ10����20����������A��Ա��������ְλ�����ű�š�
select ename,job,deptno
from emp
where job in('SALESMAN','MANAGER')
and deptno in (10,20)
and ename like '%A%'

��ϰ�壺
1.��ѯ������20��30��Ա�����������ű�ţ������չ�����������
select ename,deptno
from emp
where deptno in (20,30)
order by sal

2.��ѯ������2000-3000֮�䣬���Ų���10�ŵ�Ա�����������ű�ţ����ʣ������ղ������򣬹��ʽ�������
select ename,deptno,sal
from emp
where sal between 2000 and 3000
and deptno not in 10
order by sal desc 

3.��ѯ��ְ������82����83��֮�䣬ְλ��SALES����MAN��ͷ��Ա����������ְ���ڣ�ְλ����������ְ���ڽ�������
select ename,hiredate,job
from emp
where hiredate between to_date('1982-01-01','yyyy-mm-dd') and to_date('1983-12-31','yyyy-mm-dd')
and job like 'SALES%' 
or job like 'MAN%'
order by hiredate desc

�κ���ҵ��
1.��ѯ��ְʱ����1982-7-9֮�󣬲��Ҳ�����SALESMAN������Ա����������ְʱ�䡢ְλ��
select ename,hiredate,job
from emp
where hiredate>to_date('1982-7-9','YYYY-MM-DD')
and job not in 'SALESMAN'

2.��ѯԱ�������ĵ�������ĸ��a��Ա��������
select *
from emp
where ename like '__A%'

3.��ѯ����10��20�Ų��������Ա�����������ű�š�
select ename,deptno
from emp
where deptno not in(10,20)

4.��ѯ���ź�Ϊ30��Ա������Ϣ���Ȱ����ʽ��������ٰ������������� 
select *
from emp
where deptno = 30
order by sal desc,ename asc

5.��ѯû���ϼ���Ա��(�����Ϊ��)��Ա��������
select ename
from emp
where mgr is null

6.��ѯ���ʴ��ڵ���4500���Ҳ���Ϊ10����20��Ա��������\���ʡ����ű�š�
select ename,sal,deptno
from emp
where sal >= 4500
and deptno in(10,20)

-----------------------------������
��ϰһ��
1.дһ����ѯ,������ĸ��д��������ĸСд��ʾ��Ա�� ename����ʾ���ֵĳ��ȣ�����ÿ��һ���ʵ��ı�ǩ��
�������������й�Ա���ֵĿ�ʼ��ĸ��J��A �� M �Ĺ�Ա�����Բ�ѯ�������Ա��ename��������
����ʾ��ʹ��initcap��length��substr��
select initcap(ename) as ������length(ename) ����
from emp
where substr(ename,1,1) in ('J','A','M')

��ϰ����
1.��ѯԱ���������а�����д��Сд��ĸA��Ա��������
select ename
from emp
where instr(lower(ename),'a')>0

2.��ѯ���ű��Ϊ10��20����ְ������81��5��1��֮��
���������а�����д��ĸA��Ա��������Ա����������
����ʾ��Ҫ��ʹ��INSTR����������ʹ��like�����ж�)

select ename, length(ename)
from emp
where deptno in (10,20)
and hiredate > to_date('1981-05-01','YYYY-MM-DD')
and instr(ename,'A')>0

3.��ѯÿ��ְ���ı��,����������
Ҫ�󽫲�ѯ�������ݰ���һ���ĸ�ʽ�ϲ���һ���ַ���.
ǰ10λ�����,���㲿����*���,�����
�м�10λ�����������㲿����*���,�����
��10λ�����ʣ����㲿����*���,�Ҷ���
select rpad(empno,10,'*') ||rpad(ename,10,'*') || lpad(sal,10,'*')
from emp

��ϰ����
1.дһ����ѯ���ֱ����100.456 �������뵽С������2λ����1λ������λ��ֵ��
select round(100.456,2),round(100.456,1),round(100.456,0)
from dual

2.дһ����ѯ���ֱ����100.456 ��С������2λ����1λ������λ�ضϵ�ֵ��
select trunc(100.456,2),trunc(100.456,1),trunc(100.456,0)
from dual

��ϰ�ģ�
1.��ѯÿ��Ա����ֹ������һ����ְ�����죿
select ename,trunc(sysdate-hiredate,0) ��ְ����
from emp

2.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-RR')
from dual

3.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-RR')
from dual

4.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-RR')
from dual

5.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-RR')
from dual

6.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-YY,ָ������Ϊ01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-YY')
from dual

7.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-YY,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-YY')
from dual

��ϰ�壺
1.��ѯ��������ǰʱ��
select sysdate
from dual

2.��ѯ����10,20��Ա����ֹ��2000��1��1�գ������˶��ٸ��£���ְ���·ݡ�
(��ʾ��ʹ��months_between,extract)
select ename,
trunc(months_between(to_date('2000-01-01','YYYY-MM-DD'),hiredate),0) �����·�, 
extract(Month FROM hiredate) ��ְ�·�,
deptno
from emp
where deptno in (10,20)

3.���Ա��������6���£���ѯְλ����MANAGER��Ա����������ְ���ڣ�ת�����ڣ�
��ְ���ں�ĵ�һ������һ,��ְ���µ����һ�����ڡ�
����ʾ��ʹ��add_months,next_day,last_day)
select ename,hiredate,
add_months(hiredate,6),
next_day(hiredate,'����һ'),
last_day(hiredate)
from emp

��ϰ����
1.��ʾ������ϵͳ��ǰʱ�䣬��ʽΪ2007-10-12 17:11:11(��ʾ��ʹ��to_char����)
select to_char(sysdate,'YYYY-MM-DD HH24:mm:SS')
from dual

2.��ʾename��hiredate �� ��Ա��ʼ�����������ڼ����б�ǩDAY(��ʾ��ʹ��to_char����)
select ename,hiredate,to_char(hiredate,'day')
from emp

3.��ѯԱ�����������ʣ���ʽ���Ĺ��ʣ���999,999.99�� (��ʾ��ʹ��to_char����)
select ename,sal,to_char(sal,'L999,999.99')
from emp

4.���ַ���2015-3��-18 13:13:13 ת�������ڸ�ʽ���������ϵͳ��ǰʱ���������졣 
(��ʾ��ʹ��to_date����)
select to_date('2015-03-18 13:13:13','YYYY-MM-DD hh24:mi:ss'),
trunc(sysdate-to_date('2015-03-18 13:13:13','YYYY-MM-DD hh24:mi:ss'))
from dual

�κ���ҵ��
1.����2000��1��1�յ������ж����£������ܣ��������룩��
select round(months_between(sysdate,to_date('2000-01-01','yyyy-mm-dd')),0),
round((sysdate-to_date('2000-01-01','yyyy-mm-dd'))/7,0)
from dual

2.��ѯԱ��ENAME�ĵ�������ĸ��A��Ա������Ϣ(ʹ��2������)��
select *
from emp
where ename like '__A%'

select * from emp
where substr(ename,3,1) = 'A' 

3.ʹ��trim�������ַ�����hello������  Hello ������bllb������ hello    ��
�ֱ���õ������ַ���ello��Hello��ll��hello��
select trim('h' from 'hello'),
trim(' ' from '  Hello '),
trim('b' from 'bllb'),
trim(' ' from ' hello    ')
from dual

4.��Ա�����ʰ����¸�ʽ��ʾ��123,234.00 RMB ��
select ename,sal,to_char(sal,'L999,999.99')
from emp

5.��ѯԱ�����������侭���ţ�Ҫ�����û�о������ʾ��No Manager���ַ�����
select ename,nvl(to_char(mgr),'No Manager')
from emp

6.��Ա���Ĳμӹ������ڰ����¸�ʽ��ʾ���·�/��ݡ� 
select ename,to_char(hiredate,'mm/yyyy')
from emp

7.��Ա�����в�ѯ��Ա���Ĺ��ʣ�������Ӧ��˰��������С��1000,˰��Ϊ0��
������ʴ��ڵ���1000��С��2000��˰��Ϊ10����
������ʴ��ڵ���2000��С��3000��˰��Ϊ15����
������ʴ��ڵ���3000��˰��Ϊ20����
select ename,sal,
case
when sal < 1000 then 0
when sal >=1000 and sal < 2000 then sal*0.1
when sal >=2000 and sal <3000 then sal*0.15
when sal >=3000 then sal*0.2
else 0
end ˰��
from emp;

8.����һ����ѯ��ʾ���й�Ա�� ename�� sal����ʽ��salΪ 15 ���ַ����ȣ�
�� $ ����䣬�б�ǩ SALARY��
select ename,sal,lpad(sal,15,'$') as SALARY 
from emp








