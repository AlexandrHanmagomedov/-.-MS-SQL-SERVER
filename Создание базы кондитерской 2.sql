--create table Users(
--ID int primary key identity(1,1),
--[Name] nvarchar(30) not null,
--[Login] nvarchar(30) unique not null,
--[Password] nvarchar(20) not null check (LEN([Password])>3)
--)

--CREATE TABLE Products(
--ID int primary key identity(1,1),
--[Name] nvarchar(100) not null,
--[Price] money not null,
--)

--CREATE TABLE Clients(
--ID int primary key identity(1,1),
--LastName nvarchar(50) not null,
--FirstName nvarchar(30) not null,
--Patronomic nvarchar(30) not null,
--PhoneNumber char(11),
--)

--CREATE TABLE Orders(
--ID int primary key identity(1,1),
--[Date] DATETIME not null,
--[Client] int not null foreign key references Clients(ID),
--)

--��������� ������� , ���������� ������� 
--alter table Orders add [User] int not null foreign key references Users(ID) 

--CREATE TABLE Orderproduct(
--[ORDER] INT NOT NULL FOREIGN KEY references Orders(ID) ON DELETE cascade ON update cascade,--���������� ������� ���������� ��������
--[Product] int not null FOREIGN KEY references Products(ID),
--[Quantity] int not null
--)

--���������� ������ � ������� �����
--insert into Users([Name],[Login],[Password])
--values (N'����',N'ivan', N'1234'),
--		(N'�����',N'Helen', N'1234'),
--		(N'�������',N'Lesha', N'1234'),
--		(N'����',N'anya9298', N'1234'),
--		(N'������',N'Mishka555', N'1234')

----���������� ������ � ������� ��������
--insert into Products ([Name],[Price])
--values (N'������� ������ 400� ', 150),
--		(N'����� ���������� 250� ', 100),
--		(N'�������� � ����� 500�', 199),
--		(N'����������� ����� ��������� 100�', 149),
--		(N'���������� ������� 100�� ', 59),
--		(N'�������� �� ������ ���� 1��', 59)

----���������� ������ � ������� �������� 
--insert into Clients([LastName],[FirstName],[Patronomic],[PhoneNumber])
--values (N'�����',N'����������',N'��������',N'88000555353'),
--		(N'������',N'������',N'����������',N'88000505303'),
--		(N'������',N'��������',N'����������',N'89003015456')

----���������� ������� � ������� �������
--insert into Orders([Date],[Client],[User])
--values ('2022-29-12 11:00:00',5,13)
		
--���������� ������� ������� � ����� �������( ������)
--insert into Orderproduct
--values (3,3,2),
--		(3,5,4),
--		(3,4,1),

--	(4,6,1),
--	(4,3,1),
--	(4,2,3)


--�������� ���������� ��� ��� (������� ������ �������)
--select * from Orderproduct

--����� ���� ������� ��������
--select * from Products

----����� ������� ��������
--select *from Orders O,Clients C
--where o.Client=c.ID --�������� ��� ������ �� ������� ������ , ������� ��������� �����

--������� ������ � �� �������� � ������� inner join
--select * from Orders O
--inner join Clients C --���������� ������������� ������ �� ���� ������
--on o.Client=c.ID 

--select O.ID, O.Date, c.LastName
--from Orders O
--inner join Clients C
--on o.Client=c.ID

--(�����������)
--select * from Clients c
--right join Orders O
--on c.id=o.Client

--����� ������� ������� ������ �� ������� 
--select * 
--from Clients �
--where ID not in (select distinct Client 
--					from Orders)--������� ���������� ������ ���� ��������

----���� ����� ��� � ����
--select * 
--from Clients C
--where not exists (select 1 --not exists �� ������
--					from Orders O
--					where c.ID=o.Client)


----����� �������� ������� �������� �������� ��� ����������� �����
--select DISTINCT C.*
--from Clients C
--inner join Orders O 
--on c.id=o.Client 
--inner join Orderproduct OP
--on o.ID=op.[Order]
--inner join Products P
--on op.Product=p.ID
--where P.[Name] LIKE N'��������%' 

--UNION-- ����� �������� ������ ���� ���������� ���������� ��������

--select DISTINCT C.*
--from Clients C
--inner join Orders O 
--on c.id=o.Client 
--inner join Orderproduct OP
--on o.ID=op.[Order]
--inner join Products P
--on op.Product=p.ID
--where P.[Name]=N'����������� ����� ��������� 100�'
----OR P.[Name]=N'����������� ����� ��������� 100�'

--SELECT * 
--FROM Orderproduct
--GROUP BY [Order],[Product],[Quantity]

----���������� ��������� ������� 
--select[ORDER], SUM ([Quantity]) as [���������� �������]
--from [dbo].[Orderproduct]
--group by [ORDER] 

----���������� �������
--select COUNT(ID)
--from Orders

----������������ ���������� ��������� ������� �� �������� ������� 
--select[ORDER], MAX ([Quantity]) as [���������� �������]
--from [dbo].[Orderproduct]
--group by [ORDER]

----����� ��� �� ���� ���� ����� ���������� �� ����������
--select op.[ORDER],p.[Name],p.Price * op.Quantity as [summa]
--from Orderproduct OP
--inner join Products P
--on OP.Product=p.ID

----�������� ����� �� ������
--select op.[ORDER],sum(p.Price * op.Quantity) as [summa]
--from Orderproduct OP
--inner join Products P
--on OP.Product=p.ID
--group by op.[ORDER]

--���� �������� � ������� , � ���������� ������� ����� ����� ��

----���������� ������� �� �������� ��� ���������� ������ ������ 
--select c.LastName,C.FirstName,COUNT(O.ID) AS [����������] 
--from orders O --����� ������ 
--inner join Clients c --���������� � ��������� 
--ON O.Client=C.ID
--GROUP BY C.LastName,C.FirstName
--HAVING COUNT (O.ID)>1 --������ ������������� ������� ��� ������� ���������� ���������


----������� ������� � ������������ ����������� �������
--select TOP 1 c.LastName,C.FirstName,COUNT(O.ID) AS [���������� �������] 
--from orders O --����� ������ 
--inner join Clients c --���������� � ��������� 
--ON O.Client=C.ID
--GROUP BY C.LastName,C.FirstName
--ORDER BY [���������� �������] DESC--���������� �� ��������

--������� ��������� ���� �������� ���� �������� 
SELECT * 
FROM Products P
WHERE P.Price>(SELECT AVG(PRICE) --���� ������!!!!!!!!!!!!!!!!! 
				FROM Products)
