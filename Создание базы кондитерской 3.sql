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
		
--добавление записей товаров в ордер продукт( заказа)
--insert into Orderproduct
--values (3,3,2),
--		(3,5,4),
--		(3,4,1),

--	(4,6,1),
--	(4,3,1),
--	(4,2,3)


--проверка получилось или нет (выбрать товары заказов)
--select * from Orderproduct

--выбор всех товаров магазина
--select * from Products

----выбор заказов магазина
--select *from Orders O,Clients C
--where o.Client=c.ID --выбираем все записи из таблицы клиент , которые выполнили заказ

--выбрать заказы и их клиентов с помощью inner join
--select * from Orders O
--inner join Clients C --объединяем повторяющиеся записи из двух таблиц
--on o.Client=c.ID 

--select O.ID, O.Date, c.LastName
--from Orders O
--inner join Clients C
--on o.Client=c.ID

--(объединение)
--select * from Clients c
--right join Orders O
--on c.id=o.Client

--вывод клиента который ничего не покупал 
--select * 
--from Clients С
--where ID not in (select distinct Client 
--					from Orders)--выбрать уникальный список всех клиентов

----тоже самое что и выше
--select * 
--from Clients C
--where not exists (select 1 --not exists не входит
--					from Orders O
--					where c.ID=o.Client)


----найти клиентов которые покупали рулетики или мармеладные мишки
--select DISTINCT C.*
--from Clients C
--inner join Orders O 
--on c.id=o.Client 
--inner join Orderproduct OP
--on o.ID=op.[Order]
--inner join Products P
--on op.Product=p.ID
--where P.[Name] LIKE N'Рулетики%' 

--UNION-- ЮНИОН РАБОТАЕТ ТОЛЬКО ЕСЛИ ОДИНАКОВОЕ КОЛИЧЕСТВО СТОЛБЦОВ

--select DISTINCT C.*
--from Clients C
--inner join Orders O 
--on c.id=o.Client 
--inner join Orderproduct OP
--on o.ID=op.[Order]
--inner join Products P
--on op.Product=p.ID
--where P.[Name]=N'Мармеладные мишки фруктовые 100г'
----OR P.[Name]=N'Мармеладные мишки фруктовые 100г'

--SELECT * 
--FROM Orderproduct
--GROUP BY [Order],[Product],[Quantity]

----количество проданных товаров 
--select[ORDER], SUM ([Quantity]) as [Количество товаров]
--from [dbo].[Orderproduct]
--group by [ORDER] 

----количество заказов
--select COUNT(ID)
--from Orders

----максимальное количество проданных товаров по товарной позиции 
--select[ORDER], MAX ([Quantity]) as [Количество товаров]
--from [dbo].[Orderproduct]
--group by [ORDER]

----вывод что то типа чека товар умноженный на количество
--select op.[ORDER],p.[Name],p.Price * op.Quantity as [summa]
--from Orderproduct OP
--inner join Products P
--on OP.Product=p.ID

----итоговая сумма по заказу
--select op.[ORDER],sum(p.Price * op.Quantity) as [summa]
--from Orderproduct OP
--inner join Products P
--on OP.Product=p.ID
--group by op.[ORDER]

--ЕСЛИ СТОЛБЦОВ В СЕЛЕКТЕ , И АГРЕГАТНАЯ ФУНКЦИЯ ТОГДА ГРОУП БУ

----количество заказов по клиентам ГДЕ КОЛИЧЕСТВО БОЛЬШЕ ОДНОГО 
--select c.LastName,C.FirstName,COUNT(O.ID) AS [кОЛИЧЕСТВО] 
--from orders O --БЕРЕМ ОРДЕРС 
--inner join Clients c --ОБЬЕДИНЯЕМ С КЛИЕНТАМИ 
--ON O.Client=C.ID
--GROUP BY C.LastName,C.FirstName
--HAVING COUNT (O.ID)>1 --ХАВИНГ УСТАНАВЛИВАЕТ УСЛОВИЕ ДЛЯ СТОЛБЦА АГРЕГАТНОЙ ФУНКЦИИИИ


----ВЫВЕСТИ КЛИЕНТА С МАКСИМАЛЬНЫМ КОЛИЧЕСТВОМ ЗАКАЗОВ
--select TOP 1 c.LastName,C.FirstName,COUNT(O.ID) AS [КОЛИЧЕСТВО ЗАКАЗОВ] 
--from orders O --БЕРЕМ ОРДЕРС 
--inner join Clients c --ОБЬЕДИНЯЕМ С КЛИЕНТАМИ 
--ON O.Client=C.ID
--GROUP BY C.LastName,C.FirstName
--ORDER BY [КОЛИЧЕСТВО ЗАКАЗОВ] DESC--СОРТИРОВКА ПО УБЫВАНИЮ

----ВЫВЕСТИ ПРОДУКЦИЮ ЦЕНА КОТОРОГО ВЫШЕ СРЕДНЕГО 
--SELECT * 
--FROM Products P
--WHERE P.Price>(SELECT AVG(PRICE) --ЗНАК БОЛЬШЕ!!!!!!!!!!!!!!!!! 
--				FROM Products)

----ПОЛНОЕ ОБЪЕДИНЕНИЕ БЕЗ ПОВТОРЯЮЩИХСЯ ЗНАЧЕНИЙ
----ПОЛНАЯ ИНФОРМАЦИЯ ПО ЗАКАЗАМ И ДРУГИМ СВЯЗАННЫМ ТАБЛИЦАМ
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


--СКАЛЯРНАЯ ФУНКЦИЯ 
--ВЕРНУТЬ ИТОГОВУЮ СУММУ ЗАКАЗА ПО id ЗАКАЗА
--CREATE FUNCTION TotalOrder(@order_id int)
--returns money
--as 
--begin
--	declare @total money;--объявляем переменную которая будет хранить результат 
--		select @total=sum(OP.Quantity*p.Price) 
--		from Orderproduct OP
--		inner join Products P
--		on op.Product=p.ID
--		where op.[ORDER]=@order_id	
--	return @total
--end;--энд окончании функции .обязательно точка с запятой

--вызов функции тоталордер
--select *,[dbo].[TotalOrder](ID) as [Итоговая сумма]
--from Orders 

--скалярная функция
--create function DayWeek (@day datetime)
--returns nvarchar(15)
--as
--begin
--	return case 
--	when datename (dw,@day)=N'Friday'
--		then 'Пятница'
--	when datename (dw,@day)=N'Mondey'
--		then 'Понедельник'
--	when datename (dw,@day)=N'Saturday'
--		then 'Суббота'
--	else 'Другой день'
--	end
--end;

--изменение функции
--alter function DayWeek(@day datetime)
--returns nvarchar(15)
--as
--begin
--return case 
--	when DatePart(dw,@day)=5
--		then 'БУхатница'
--	when DatePart(dw,@day)=1
--		then 'Тяжелый день'
--	when DatePart(dw,@day)=6
--		then 'отсыпной после бухалова'
--	else 'Другой день'
--	end
--end;

--select [dbo].[DayWeek]('27.01.2023')

--функции возвращающие процедуры
--табличная функция ReceiptOrder(@order_id int)
--create function ReceiptOrder(@order_id int)
--alter function ReceiptOrder(@order_id int)
--returns table
--as
--return 
--select P.[Name],op.Quantity,p.Price,op.Quantity*p.Price as [Сумма]
--	from Orderproduct OP
--	inner join Products P
--	on OP.Product=p.ID
--	where op.[ORDER]=@order_id
----union
----select 'Итого',null,null,dbo.TotalOrder(3)-- так не надо , просто для информации
--go-- отделяет функцию чтобы была возможность чтото писать

----вывод по функции
--select * 
--from [dbo].[ReceiptOrder](4)

--хранимые процедуры
----процедура вывода в  сообщении ФИО пользователя
----create procedure FIO_User(@id_User int)--так то не юзер а клиент
----as
----begin
----declare @result nvarchar(150);
----select @result=LastName+' '+FirstName+' '+Patronomic
----from Clients
----where id=@id_user;
----print @result
----end;

--exec [dbo].[FIO_User] @id_user=5

--Системные хранимые процедуры
--create procedure BackupThisBase
--as
--backup Database [SweetShoP_haz]
--to disk='\\FS\Public\Студенты\BACKUP\HAZ.BAK'
--print N'успешно сохранено'
--go

--exec [dbo].[BackupThisBase]


----добавление столбца пометки на удаления продукта(удалена ли запись или нет )
--alter table Products
--add isDelete bit not null default 0

----добавление триггера таблицы вместо удаления записи пометка на то что типа удалена
--create trigger InsteadOfDeleteProduct --обьявление триггера
--on Products -- указание источника триггера(таблица,база)
--instead of--вместо события (instead of)| после (after) . когда выполненно какое то условие
--delete -- указание события источника(update,insert,delete)
--as 
--begin
--	update Products 
--	set isDelete=1
--	where ID in (select ID from deleted)--deleted,(inserted,updated) временная таблица в нее вносится то что удаляется
--	print'Данные помечены на удаление!'
--end;

--delete from Products
--where id=1

--select * from Products

--проверка цены у продукта, если она будет слишком маленькая то добавить нельзя
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
-- rollback tran;--отменить изменение записей в таблице
-- print 'Товары с ценой меньше 50 не добавляются"'
-- end
--end;

--insert into Products([Name],[Price])
--values (N'Богато',49)	

