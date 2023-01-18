

----создание новой таблицы ГРАНТС с копированием по уникальному ИД
--create Table GrantsStudents(
--ID_Student int not null unique , --foreign key references Students(ID),
--Grants money not null
--foreign key (ID_Student) references Students(id)
--)


--затираем всем стипуху
--update Students
--set Grants=Null
--where id between 1 and 100

--добавление записей студентов со стипендией из таблицы Студентс
 --insert into [dbo].[GrantsStudents]
 --select [id],[Grants]
 --from [dbo].[Students]
 --where Grants is not null

 ----УДАЛИТЬ СТОЛБЕЦ ГРАНТС
 --ALTER TABLE [dbo].[Students] DROP COLUMN [Grants]
 --SELECT * FROM Students 
 
 --SELECT *--LEFT join ОБЕДЕНЕНИЕ МНОЖЕСТВ приделать слева (ТАБЛИЦ В ДАННОМ СЛУЧАЕ)
 --FROM Students AS s LEFT JOIN [dbo].[GrantsStudents] AS g ON s.id=g.[ID_Student]



 -- SELECT s.* ,g.[Grants]     --LEFT join ОБЕДЕНЕНИЕ МНОЖЕСТВ (ТАБЛИЦ В ДАННОМ СЛУЧАЕ)
 --FROM Students AS s  left join [dbo].[GrantsStudents] AS g
 --on s.id=g.[ID_Student]
 ----where s.id=g.[ID_Student]

 --добавление нового студента в таблицу студентс и грантс
 --добавление нового студента в таблицу студентс
 --insert into Students([LastName],[FirstName],[BirthDate],[Email])
 --values (N'НовыйФамиля',N'СтудентИМЯ',N'1998-04-09', N'new_student@gmail.com')

 --узнаем ИД новой записи
 --select id from Students where LastName=N'НовыйФамиля'

 --назначаем студенту стипендию
 --insert into [dbo].[GrantsStudents]([ID_Student],Grants)
 --values (17,5000)
--или так
--insert into [dbo].[GrantsStudents]([ID_Student],Grants)
--values ((select top 1 id from Students where LastName=N'НовыйФамиля'),5000)

----выбор студента со стипендией 5000 
--select s.* ,g.Grants
--from Students s left join [dbo].[GrantsStudents] g
--on s.id=g.ID_Student
--where s.id=17







