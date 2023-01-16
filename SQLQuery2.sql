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

	   --SELECT s.id AS ИД_СТУДЕНТА ,s.LastName AS 'Фамилия',DATEDIFF(YEAR,s.BirthDate,GETDATE()) AS Разница,YEAR(s.BirthDate) AS [Year]--YEAR(s.BirthDate) отображение тоолько года (или месяца) ,AS [Year] в квадратных скобках потому что используются системные слова ( ключевые)
	   --FROM Students AS s								  --DATEDIFF(YEAR,s.BirthDate,GETDATE()) --высчитывание разаницы дат
	   --WHERE S.Grants<=50 AND Year(s.BirthDate)>10;

	   --SELECT LastName + ' ' + FirstName + ' '+ --КОНКАТЕНАЦИЯ СТРОК
	   --CAST(BirthDate AS nvarchar) AS ФИО --, ПЕРЕОПРЕДЕЛЕНИЕ ТИПА ДАТЫ В ЧАР
	   --FROM Students


	   --SELECT LastName + ' ' + FirstName + ' '+ --КОНКАТЕНАЦИЯ СТРОК
	   --CONVERT (nvarchar(30),BirthDate)  AS ФИО --, КОНВЕРТИРОВАНИЕ ТИПА ДАТЫ , ЧЕРЕЗ КОНВЕРТ НЕЛЬЗЯ ОБРАБАТЫВАТЬ null ЗНАЧЕНИЕ 
	   --FROM Students

	   --SELECT LastName + ' ' + FirstName + ' '+ --КОНКАТЕНАЦИЯ СТРОК
	   ----FORMAT(BirthDate,'dd.MM.yyyy') AS ФИО --, приведение даты к заданному формату
	   --FORMAT(BirthDate, 'd','ru-ru') AS ФИО--приведение даты к заданному формату
	   --FROM Students

	   --SELECT FORMAT (+78005553535,'+#-###-###-##-##')--форматирование телефона к заданному формату . лучше позвонить чем у кого то занимать !!!

	   --Select ISNULL(CAST([Grants] AS nvarchar(20)), '-Не определдено-') as стипендия  -- заместо пустого значение , текст
	   --FROM Students


	   --ВЫВОД ПЕРВЫХ 3Х СТУДЕНТОВ С НАИБОЛЬШЕЙ СТИПЕНДИЕЙ
	   --SELECT TOP 3 LastName + ' ' + FirstName FROM Students --ВЫВОД ПЕРВЫХ 3Х СТУДЕНТОВ С НАИБОЛЬШЕЙ СТИПЕНДИЕЙ
	   --SELECT TOP 50 PERCENT LastName + ' ' + FirstName FROM Students--ВЫВОД ПЕРВЫХ 50ПРОЦЕНТОВ СТУДЕНТОВ С НАИБОЛЬШЕЙ СТИПЕНДИЕЙ
	   --ORDER BY Grants DESC --СОРТИРОВКА ОТ БОЛЬШЕГО К МЕНЬШЕМУ

	   --SELECT DISTINCT LastName + ' ' + FirstName FROM Students --ВЫВОД УНИКАЛЬНЫХ ЗНАЧЕНИЙ 

	   --SELECT * FROM Students
	   --WHERE (Grants =10 OR Grants=100) OR LastName =N'Фиксик' -- >=,>,<,!>, AND ,OR 


	   ----функция возвращающая количество символов в строке
	   -- SELECT * FROM Students
	   -- WHERE LEN (LastName) <= 5 -- >=,>,<,!>, AND ,OR 

	   --SELECT * FROM Students
	   --WHERE MONTH(BirthDate)=5 -- ВЫВОД  ПО ДАТЕ  МЕСЯЦ РАВЕН 5

	   --SELECT * FROM Students
	   --WHERE Grants IS NULL --ВЫВОД ПУСТОЙ ЗАПИСИ 

	   --SELECT * FROM Students
	   --WHERE NOT FirstName=N'ИВАН'--УСЛОВИЕ ОТРИЦАНИЯ С ОБЩИМИ ЗНАЧЕНИЯМИ

	   --вЫВЕСТИ СТУДЕНТОВ У КОТОРЫХ ЕТСЬ СТИПЕНДИЯ 
	   --SELECT * FROM Students
	   --WHERE Grants IS NOT NULL 

	   --ВЫВЕСТИ СТУДЕНТОВ ИД КОТОРЫХ ВХОДИТ В МНОЖЕСТВО [1,3,4]
	   --SELECT * FROM Students
	   --WHERE ID IN (1,3,4)

	  --ВЫВЕСТИ СТУДЕНТОВ ИД КОТОРЫХ НАХОДИТСЯ МЕЖДУ 3-6
	   --SELECT * FROM Students
	   --WHERE id BETWEEN 3 AND 6 --ИЛИ NOT BETWEEN


	   ----ВЫВЕСТИ СТУДЕНТОВ ФАМИЛИИ КОТОРЫХ НАЧИНАЮТСЯ В ПРОМЕЖУТКЕ МЕЖДУ Г И О
	   --SELECT * FROM Students
	   --WHERE LastName NOT BETWEEN 'Г' AND 'О'--NOT ВСЕ КРОМЕ ЧТО ЕСТЬ МЕЖДУ Г И О 

	   --ВЫВЕСТИ СУДЕНТОВ У КОТОРЫХ ЕСТЬ В ФАМИЛИИ СЛОГ ВА 
	   --SELECT UPPER(FirstName + ' ' + LastName) FROM Students --UPPER ВЫВОД СИМВОЛОВ В ВЕРХНИЙ РЕГГГИСТР
	   ----WHERE FirstName LIKE '%ВА%' --% ПОСЛЕ ИЛИ ДО КАКОЙ ЛИБО КОНСТРУКЦИИ СТРОКИ БУДЕТ КАКАЯ ЛИБО ПОСЛЕДОВАТЕЛЬНОСТЬ В ТОМ ЧИСЛЕ ПУСТОТА% , 
	   --WHERE LOWER(FirstName + ' ' + LastName) LIKE 'П% П%'--LOWER ПРОВЕРКА ВСЕХ СИМВОЛОВ В НИЗЖНИЙ РЕГИСТР --ВЫВЕДЕТ П%ЕТР П%ЕТРОВ


	   --ВЫВЕСТИ СТУДЕНТОВ ФАМИЛИИ КОТОРЫХ НАЧИНАЮТСЯ ЛИБО НА "А" ЛИБО НА "П"
	 --  INSERT INTO Polyclinic_HAZ.dbo.Students(LastName,FirstName,BirthDate,Grants,Email)
		--VALUES (N'аКИМОВ',N'ВАЛЕРИЙ','02-02-2020',1000,N'PUPS@mail.ru')
	 --  SELECT * FROM Students
	 --  WHERE LastName LIKE'[АП]%' --В КВАДРАТНЫХ СКОБКАХ ГРУППА СИМВОЛОВ . НАЧИНАЕТСЯ ИЛИ А ИЛИ П ГДЕ УГОДНО


	   ----ВЫВЕСТИ СТУДЕНТОВ ФАМИЛИИ КОТОРЫХ НЕ НАЧИНАЮТСЯ НА "А" ЛИБО НА "П"
	   --SELECT * FROM Students
	   --WHERE LastName  LIKE'[^АП]%'-- ^ЭТО ЗНАК ОТРИЦАНИЯ 
	   
	   ----ВЫВЕСТИ СТУДЕНТОВ У КОТОРЫХ ВТОРОЙ СИМВОЛ В ИМЕНИ ЭТО БУКВА "А"
	   --SELECT * FROM Students
	   ----WHERE FirstName  LIKE '_а%'
	   --WHERE TRIM(FirstName)  LIKE '_а%'-- TRIM УБИРАЕТ СНАЧАЛА И С КОНЦА ПРОБЕЛЫ

	   --LIKE 'М[АО]ЛИНА%' --ПОИСК МАЛИНА И МОЛИНА

	   --УКАЗАТЬ ДИАПАЗОН СИМВОЛОВ С ПОМОЩЬЮ ТИРЕ
	   --LIKE '[А-Я0-9]' //ВЫБОР СИМВОЛА ИЗ РУССКОГО АЛФАВИТА И ЦИФР
	   
	   --СОЗДАНИЕ ТАБЛИЦЫ С ПОМОЩЬЮ ЗАПРОСА
	    CREATE TABLE StudentsCopy(
	    id int primary key IDENTITY(1,1),
		LastName nvarchar(30) NOT NULL Default 'пусто',
		FirstName nvarchar(30) NOT NULL Default 'пусто',
		BirthDate date NOT NULL,
	    Grants money NULL,
		--unique пометка на уникальность
	    Email nvarchar(100) NOT NULL unique)

		--check()функция прверки