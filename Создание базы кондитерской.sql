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
		

