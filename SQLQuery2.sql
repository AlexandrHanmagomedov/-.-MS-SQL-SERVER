--use Polyclinic_HAZ;+
--�������� �������
--Select id,LastName
--FROM Polyclinic_HAZ.dbo.Students+

--�������� � ������� ������
--INSERT INTO Polyclinic_HAZ.dbo.Students(LastName,FirstName,BirthDate,Grants,Email)
--VALUES (N'�����',N'������','05-01-2010',null,N'leonid@mail.ru')
	   

	   --distinct -�������� ����� ������������ �������� , ������� ���������� ������
	   --SELECT Email,LastName,BirthDate
	   --FROM Polyclinic_HAZ.dbo.Students

	   --�������� ������
	   --DELETE FROM  Polyclinic_HAZ.dbo.Students �������� ���� �������
	   --DELETE FROM Polyclinic_HAZ.dbo.Students
	   --WHERE Email=N'leonid@mail.ru'--�������� ������������ ������,��� �� ������� N �����������,where ��������� ���

	   --select *--����� �������� �������
	   --from Students
	   --WHERE LastName=N'������'or LastName=N'������';--������� ������������ ������ ����� ��� ��� � ��� ��� �� ������

	   --SELECT s.id,s.LastName AS '�������' --����� ��������� ��� ����� ���������
	   --FROM Students AS s --����������� ��� 

	   --����������
	  
	  -- SELECT s.id AS ��_�������� ,s.LastName AS '�������'
	  -- FROM Students AS s 
	  ---- ORDER BY ��_�������� Desc --Desc ������� ���������� �� �������� � ��������
	  -- ORDER BY ������� ASC --ASC ������� ���������� �� �������� � ��������

	   --SELECT s.id AS ��_�������� ,s.LastName AS '�������'
	   --FROM Students AS s 
	   --WHERE s.Grants >50--����� �� ���������� ������ 50

	   SELECT s.id AS ��_�������� ,s.LastName AS '�������',DATEDIFF(YEAR,s.BirthDate,GETDATE()) AS �������,YEAR(s.BirthDate) AS [Year]--YEAR(s.BirthDate) ����������� ������� ���� (��� ������) ,AS [Year] � ���������� ������� ������ ��� ������������ ��������� ����� ( ��������)
	   FROM Students AS s								  --DATEDIFF(YEAR,s.BirthDate,GETDATE()) --������������ �������� ���
	   WHERE S.Grants<=50 AND Year(s.BirthDate)>10;