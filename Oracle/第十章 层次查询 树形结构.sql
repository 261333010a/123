-------------------------------------��ʮ��
-----------�κ���ҵ
1.����һ��������ʾ BLAKE�������¼�������ֱ�Ӻͼ���¼�����Ա�����֡�нˮ�Ͳ��źš�
select lpad(ename,length(ename)+(level*2)-2,'*') ����,sal,deptno
from emp
start with ename = 'BLAKE'-----------------�����￪ʼ
connect by prior  empno = mgr --------------�����϶��»������¶���

2.����һ��������ʾ���ڹ�Ա SMITH ����Ĳ�Σ����������������������ʾ����ֱ�Ӿ���
select empno,lpad(ename,length(ename)+(level*2)-2,'*') ����,mgr
from emp
start with ename = (select ename from emp where empno = (select mgr from emp where ename= 'SMITH'))
connect by prior mgr = empno

3.����һ������������ʾ�����Σ�������Ϊ KING�Ĺ�Ա��ʼ����ʾ��Ա�����֡�����ID�Ͳ���ID��
select lpad(ename,length(ename)+(level*2)-2,'*') ����,mgr,deptno
from emp
start with ename = 'KING'
connect by prior empno = mgr

4.����һ����˾��֯ͼ����ʾ�����Ρ���������˿�ʼ��----�ϰ�king
�ų�����jobΪCLERK���ˣ���Ҫ�ų�FORD����Щ��FORD����Ĺ�Ա��---ford ��������
select lpad(ename,length(ename)+(level*2)-2,'*') ����,mgr,deptno
from emp
where job <> 'CLERK' 
start with ename = (select ename from emp where mgr is null)
connect by prior empno = mgr
and ename <> 'FORD'

















