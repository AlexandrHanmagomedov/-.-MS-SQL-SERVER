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

--изменение таблицы , добавление столбца 
--alter table Orders add [User] int not null foreign key references Users(ID) 

--CREATE TABLE Orderproduct(
--[ORDER] INT NOT NULL FOREIGN KEY references Orders(ID) ON DELETE cascade ON update cascade,--добавление функции каскадного удаления
--[Product] int not null FOREIGN KEY references Products(ID),
--[Quantity] int not null
--)

--добавление данных в таблицу Юзерс
--insert into Users([Name],[Login],[Password])
--values (N'Иван',N'ivan', N'1234'),
--		(N'Елена',N'Helen', N'1234'),
--		(N'Алексей',N'Lesha', N'1234'),
--		(N'Анна',N'anya9298', N'1234'),
--		(N'Михаил',N'Mishka555', N'1234')

----добавление данных в таблицу Продуктс
--insert into Products ([Name],[Price])
--values (N'Леденцы мятные 400г ', 150),
--		(N'Зефир ванильныый 250г ', 100),
--		(N'Рулетики с маком 500г', 199),
--		(N'Мармеладные мишки фруктовые 100г', 149),
--		(N'Шоколадные конфеты 100гр ', 59),
--		(N'Макаронз со вкусом мяса 1шт', 59)

----добавление записи в таблицу клиентов 
--insert into Clients([LastName],[FirstName],[Patronomic],[PhoneNumber])
--values (N'Васин',N'Константин',N'Петрович',N'88000555353'),
--		(N'Леонов',N'Сергей',N'Витальевич',N'88000505303'),
--		(N'Бурмэй',N'Ангелина',N'Вазгеновна',N'89003015456')

----добавление записей в таблицу заказов
--insert into Orders([Date],[Client],[User])
--values ('2022-29-12 11:00:00',5,13)
		

