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

	   --SELECT s.id AS ��_�������� ,s.LastName AS '�������',DATEDIFF(YEAR,s.BirthDate,GETDATE()) AS �������,YEAR(s.BirthDate) AS [Year]--YEAR(s.BirthDate) ����������� ������� ���� (��� ������) ,AS [Year] � ���������� ������� ������ ��� ������������ ��������� ����� ( ��������)
	   --FROM Students AS s								  --DATEDIFF(YEAR,s.BirthDate,GETDATE()) --������������ �������� ���
	   --WHERE S.Grants<=50 AND Year(s.BirthDate)>10;

	   --SELECT LastName + ' ' + FirstName + ' '+ --������������ �����
	   --CAST(BirthDate AS nvarchar) AS ��� --, ��������������� ���� ���� � ���
	   --FROM Students


	   --SELECT LastName + ' ' + FirstName + ' '+ --������������ �����
	   --CONVERT (nvarchar(30),BirthDate)  AS ��� --, ��������������� ���� ���� , ����� ������� ������ ������������ null �������� 
	   --FROM Students

	   --SELECT LastName + ' ' + FirstName + ' '+ --������������ �����
	   ----FORMAT(BirthDate,'dd.MM.yyyy') AS ��� --, ���������� ���� � ��������� �������
	   --FORMAT(BirthDate, 'd','ru-ru') AS ���--���������� ���� � ��������� �������
	   --FROM Students

	   --SELECT FORMAT (+78005553535,'+#-###-###-##-##')--�������������� �������� � ��������� ������� . ����� ��������� ��� � ���� �� �������� !!!

	   --Select ISNULL(CAST([Grants] AS nvarchar(20)), '-�� �����������-') as ���������  -- ������� ������� �������� , �����
	   --FROM Students


	   --����� ������ 3� ��������� � ���������� ����������
	   --SELECT TOP 3 LastName + ' ' + FirstName FROM Students --����� ������ 3� ��������� � ���������� ����������
	   --SELECT TOP 50 PERCENT LastName + ' ' + FirstName FROM Students--����� ������ 50��������� ��������� � ���������� ����������
	   --ORDER BY Grants DESC --���������� �� �������� � ��������

	   --SELECT DISTINCT LastName + ' ' + FirstName FROM Students --����� ���������� �������� 

	   --SELECT * FROM Students
	   --WHERE (Grants =10 OR Grants=100) OR LastName =N'������' -- >=,>,<,!>, AND ,OR 


	   ----������� ������������ ���������� �������� � ������
	   -- SELECT * FROM Students
	   -- WHERE LEN (LastName) <= 5 -- >=,>,<,!>, AND ,OR 

	   --SELECT * FROM Students
	   --WHERE MONTH(BirthDate)=5 -- �����  �� ����  ����� ����� 5

	   --SELECT * FROM Students
	   --WHERE Grants IS NULL --����� ������ ������ 

	   --SELECT * FROM Students
	   --WHERE NOT FirstName=N'����'--������� ��������� � ������ ����������

	   --������� ��������� � ������� ���� ��������� 
	   --SELECT * FROM Students
	   --WHERE Grants IS NOT NULL 

	   --������� ��������� �� ������� ������ � ��������� [1,3,4]
	   --SELECT * FROM Students
	   --WHERE ID IN (1,3,4)

	  --������� ��������� �� ������� ��������� ����� 3-6
	   --SELECT * FROM Students
	   --WHERE id BETWEEN 3 AND 6 --��� NOT BETWEEN


	   ----������� ��������� ������� ������� ���������� � ���������� ����� � � �
	   --SELECT * FROM Students
	   --WHERE LastName NOT BETWEEN '�' AND '�'--NOT ��� ����� ��� ���� ����� � � � 

	   --������� �������� � ������� ���� � ������� ���� �� 
	   --SELECT UPPER(FirstName + ' ' + LastName) FROM Students --UPPER ����� �������� � ������� ���������
	   ----WHERE FirstName LIKE '%��%' --% ����� ��� �� ����� ���� ����������� ������ ����� ����� ���� ������������������ � ��� ����� �������% , 
	   --WHERE LOWER(FirstName + ' ' + LastName) LIKE '�% �%'--LOWER �������� ���� �������� � ������� ������� --������� �%��� �%�����


	   --������� ��������� ������� ������� ���������� ���� �� "�" ���� �� "�"
	 --  INSERT INTO Polyclinic_HAZ.dbo.Students(LastName,FirstName,BirthDate,Grants,Email)
		--VALUES (N'������',N'�������','02-02-2020',1000,N'PUPS@mail.ru')
	 --  SELECT * FROM Students
	 --  WHERE LastName LIKE'[��]%' --� ���������� ������� ������ �������� . ���������� ��� � ��� � ��� ������


	   ----������� ��������� ������� ������� �� ���������� �� "�" ���� �� "�"
	   --SELECT * FROM Students
	   --WHERE LastName  LIKE'[^��]%'-- ^��� ���� ��������� 
	   
	   ----������� ��������� � ������� ������ ������ � ����� ��� ����� "�"
	   --SELECT * FROM Students
	   ----WHERE FirstName  LIKE '_�%'
	   --WHERE TRIM(FirstName)  LIKE '_�%'-- TRIM ������� ������� � � ����� �������

	   --LIKE '�[��]����%' --����� ������ � ������

	   --������� �������� �������� � ������� ����
	   --LIKE '[�-�0-9]' //����� ������� �� �������� �������� � ����
	   
	   --�������� ������� � ������� �������
	    CREATE TABLE StudentsCopy(
	    id int primary key IDENTITY(1,1),
		LastName nvarchar(30) NOT NULL Default '�����',
		FirstName nvarchar(30) NOT NULL Default '�����',
		BirthDate date NOT NULL,
	    Grants money NULL,
		--unique ������� �� ������������
	    Email nvarchar(100) NOT NULL unique)

		--check()������� �������