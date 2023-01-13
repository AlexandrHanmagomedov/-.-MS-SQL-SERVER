--use Polyclinic_HAZ;+
--просмотр записей
--Select id,LastName
--FROM Polyclinic_HAZ.dbo.Students+

--добавить в таблицу записи
--INSERT INTO Polyclinic_HAZ.dbo.Students(LastName,FirstName,BirthDate,Grants,Email)
--VALUES (N'Мишин',N'Леонид','05-01-2010',null,N'leonid@mail.ru')
	   

	   --distinct -ключевое слово уникальности значений , выводит уникальную запись
	   --SELECT Email,LastName,BirthDate
	   --FROM Polyclinic_HAZ.dbo.Students

	   --удаление записи
	   --DELETE FROM  Polyclinic_HAZ.dbo.Students удаление всех записей
	   --DELETE FROM Polyclinic_HAZ.dbo.Students
	   --WHERE Email=N'leonid@mail.ru'--удаление определенной записи,был бы русский N обязательно,where указатель где

	   --select *--опять просмотр записей
	   --from Students
	   --WHERE LastName=N'Пупкин'or LastName=N'Фиксик';--выборка определенной записи перед тем как с ней что то делать

	   --SELECT s.id,s.LastName AS 'Фамилия' --вывод ластнейма под своим названием
	   --FROM Students AS s --представить как 

	   --СОРТИРОВКА
	  
	  -- SELECT s.id AS ИД_СТУДЕНТА ,s.LastName AS 'Фамилия'
	  -- FROM Students AS s 
	  ---- ORDER BY ИД_СТУДЕНТА Desc --Desc БАЗОВАЯ СОРТИРОВКА ОТ МЕНЬШЕГО К БОЛЬШЕМУ
	  -- ORDER BY Фамилия ASC --ASC БАЗОВАЯ СОРТИРОВКА ОТ МЕНЬШЕГО К БОЛЬШЕМУ

	   --SELECT s.id AS ИД_СТУДЕНТА ,s.LastName AS 'Фамилия'
	   --FROM Students AS s 
	   --WHERE s.Grants >50--выюор со стипендией больше 50

	   SELECT s.id AS ИД_СТУДЕНТА ,s.LastName AS 'Фамилия',DATEDIFF(YEAR,s.BirthDate,GETDATE()) AS Разница,YEAR(s.BirthDate) AS [Year]--YEAR(s.BirthDate) отображение тоолько года (или месяца) ,AS [Year] в квадратных скобках потому что используются системные слова ( ключевые)
	   FROM Students AS s								  --DATEDIFF(YEAR,s.BirthDate,GETDATE()) --высчитывание разаницы дат
	   WHERE S.Grants<=50 AND Year(s.BirthDate)>10;