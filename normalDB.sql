

----�������� ����� ������� ������ � ������������ �� ����������� ��
--create Table GrantsStudents(
--ID_Student int not null unique , --foreign key references Students(ID),
--Grants money not null
--foreign key (ID_Student) references Students(id)
--)


--�������� ���� �������
--update Students
--set Grants=Null
--where id between 1 and 100

--���������� ������� ��������� �� ���������� �� ������� ��������
 --insert into [dbo].[GrantsStudents]
 --select [id],[Grants]
 --from [dbo].[Students]
 --where Grants is not null

 ----������� ������� ������
 --ALTER TABLE [dbo].[Students] DROP COLUMN [Grants]
 --SELECT * FROM Students 
 
 --SELECT *--LEFT join ���������� �������� ��������� ����� (������ � ������ ������)
 --FROM Students AS s LEFT JOIN [dbo].[GrantsStudents] AS g ON s.id=g.[ID_Student]



 -- SELECT s.* ,g.[Grants]     --LEFT join ���������� �������� (������ � ������ ������)
 --FROM Students AS s  left join [dbo].[GrantsStudents] AS g
 --on s.id=g.[ID_Student]
 ----where s.id=g.[ID_Student]

 --���������� ������ �������� � ������� �������� � ������
 --���������� ������ �������� � ������� ��������
 --insert into Students([LastName],[FirstName],[BirthDate],[Email])
 --values (N'�����������',N'����������',N'1998-04-09', N'new_student@gmail.com')

 --������ �� ����� ������
 --select id from Students where LastName=N'�����������'

 --��������� �������� ���������
 --insert into [dbo].[GrantsStudents]([ID_Student],Grants)
 --values (17,5000)
--��� ���
--insert into [dbo].[GrantsStudents]([ID_Student],Grants)
--values ((select top 1 id from Students where LastName=N'�����������'),5000)

----����� �������� �� ���������� 5000 
--select s.* ,g.Grants
--from Students s left join [dbo].[GrantsStudents] g
--on s.id=g.ID_Student
--where s.id=17







