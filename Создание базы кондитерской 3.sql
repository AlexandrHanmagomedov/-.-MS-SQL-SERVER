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

----������� ��������� ���� �������� ���� �������� 
--SELECT * 
--FROM Products P
--WHERE P.Price>(SELECT AVG(PRICE) --���� ������!!!!!!!!!!!!!!!!! 
--				FROM Products)

----������ ����������� ��� ������������� ��������
----������ ���������� �� ������� � ������ ��������� ��������
--SELECT * 
--FROM ORDERS O
--FULL JOIN Users U
--ON O.[User]=U.ID
--FULL JOIN Orderproduct OP
--ON O.ID=OP.[ORDER]
--FULL JOIN Products P
--ON OP.Product=P.ID
--FULL JOIN Clients C
--ON C.ID=O.Client


--��������� ������� 
--������� �������� ����� ������ �� id ������
--CREATE FUNCTION TotalOrder(@order_id int)
--returns money
--as 
--begin
--	declare @total money;--��������� ���������� ������� ����� ������� ��������� 
--		select @total=sum(OP.Quantity*p.Price) 
--		from Orderproduct OP
--		inner join Products P
--		on op.Product=p.ID
--		where op.[ORDER]=@order_id	
--	return @total
--end;--��� ��������� ������� .����������� ����� � �������

--����� ������� ����������
--select *,[dbo].[TotalOrder](ID) as [�������� �����]
--from Orders 

--��������� �������
--create function DayWeek (@day datetime)
--returns nvarchar(15)
--as
--begin
--	return case 
--	when datename (dw,@day)=N'Friday'
--		then '�������'
--	when datename (dw,@day)=N'Mondey'
--		then '�����������'
--	when datename (dw,@day)=N'Saturday'
--		then '�������'
--	else '������ ����'
--	end
--end;

--��������� �������
--alter function DayWeek(@day datetime)
--returns nvarchar(15)
--as
--begin
--return case 
--	when DatePart(dw,@day)=5
--		then '���������'
--	when DatePart(dw,@day)=1
--		then '������� ����'
--	when DatePart(dw,@day)=6
--		then '�������� ����� ��������'
--	else '������ ����'
--	end
--end;

--select [dbo].[DayWeek]('27.01.2023')

--������� ������������ ���������
--��������� ������� ReceiptOrder(@order_id int)
--create function ReceiptOrder(@order_id int)
--alter function ReceiptOrder(@order_id int)
--returns table
--as
--return 
--select P.[Name],op.Quantity,p.Price,op.Quantity*p.Price as [�����]
--	from Orderproduct OP
--	inner join Products P
--	on OP.Product=p.ID
--	where op.[ORDER]=@order_id
----union
----select '�����',null,null,dbo.TotalOrder(3)-- ��� �� ���� , ������ ��� ����������
--go-- �������� ������� ����� ���� ����������� ����� ������

----����� �� �������
--select * 
--from [dbo].[ReceiptOrder](4)

--�������� ���������
----��������� ������ �  ��������� ��� ������������
----create procedure FIO_User(@id_User int)--��� �� �� ���� � ������
----as
----begin
----declare @result nvarchar(150);
----select @result=LastName+' '+FirstName+' '+Patronomic
----from Clients
----where id=@id_user;
----print @result
----end;

--exec [dbo].[FIO_User] @id_user=5

--��������� �������� ���������
--create procedure BackupThisBase
--as
--backup Database [SweetShoP_haz]
--to disk='\\FS\Public\��������\BACKUP\HAZ.BAK'
--print N'������� ���������'
--go

--exec [dbo].[BackupThisBase]


----���������� ������� ������� �� �������� ��������(������� �� ������ ��� ��� )
--alter table Products
--add isDelete bit not null default 0

----���������� �������� ������� ������ �������� ������ ������� �� �� ��� ���� �������
--create trigger InsteadOfDeleteProduct --���������� ��������
--on Products -- �������� ��������� ��������(�������,����)
--instead of--������ ������� (instead of)| ����� (after) . ����� ���������� ����� �� �������
--delete -- �������� ������� ���������(update,insert,delete)
--as 
--begin
--	update Products 
--	set isDelete=1
--	where ID in (select ID from deleted)--deleted,(inserted,updated) ��������� ������� � ��� �������� �� ��� ���������
--	print'������ �������� �� ��������!'
--end;

--delete from Products
--where id=1

--select * from Products

--�������� ���� � ��������, ���� ��� ����� ������� ��������� �� �������� ������
--create trigger SmallPrice
--on Products
--after insert
--as 
--begin
--declare @price money;
--select @price=price
--from inserted;
 
-- if (@price <50)
-- begin
-- rollback tran;--�������� ��������� ������� � �������
-- print '������ � ����� ������ 50 �� �����������"'
-- end
--end;

--insert into Products([Name],[Price])
--values (N'������',49)	

