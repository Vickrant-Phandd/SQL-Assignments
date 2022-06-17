 USE Assignment_SQL_Queries;

CREATE DATABASE Assignment_SQL_Queries;

CREATE TABLE programmer(
	pname  varchar(20) PRIMARY KEY,
	dob  date,
	doj  date,
	gender varchar(1),
	prof1 varchar(20),
	prof2 varchar(20),
	salary  int
	);

SELECT * FROM programmer;

CREATE TABLE software(
	pname  varchar(20),
	title varchar(20),
	developin varchar(20),
	scost int,
	dcost int,
	sold int,
    FOREIGN KEY(pname) REFERENCES programmer(pname) ON DELETE CASCADE,
	);

SELECT * FROM software;


CREATE TABLE studies(
	pname  varchar(20),
	institute varchar(20),
	course varchar(20),
	coursefee int ,
	PRIMARY KEY(pname),
    FOREIGN KEY(pname) REFERENCES programmer(pname) ON DELETE CASCADE,
	);

SELECT * FROM studies;

insert into programmer values('anand', '1966-04-12','1992-04-21','m','pascal','basic',3200);
insert into programmer values('altaf', '1964-07-02','1990-11-13','m','clipper','cobol',2800);
insert into programmer values('juliana','1960-01-31','1990-04-21','f','cobol','dbase',3000);
insert into programmer values('kamala', '1968-10-30','1992-01-02','f','c','dbase',2900);
insert into programmer values('mary', '1970-06-24','1991-02-01','f','cpp','oracle', 4500);
insert into programmer values('nelson', '1985-09-11','1989-10-11','m','cobol','dbase',2500);
insert into programmer values('pattrick','1965-11-10','1990-04-21','m','pascal','clipper',2800);
insert into programmer values('qadir', '1965-08-31','1991-04-21','m','assembly', 'c',3000);
insert into programmer values('ramesh', '1967-05-03','1991-02-28','m','pascal','dbase',3200);
insert into programmer values('rebecca', '1967-01-01','1990-01-01','f','basic','cobol',2500);
insert into programmer values('remitha ', '1970-04-19','1993-04-20','f','c','assembly',3600);
insert into programmer values('revathi','1969-12-02','1992-01-02','f', 'pascal','basic',3700);
insert into programmer values('vijaya','1965-12-14','1992-05-02','f','foxpro','c',3500);


insert into software values('mary','readme','cpp',300,1200,84);
insert into software values('anand', 'parachutes','basic', 399.95,6000, 43);
insert into software values('anand', 'videotitling','pascal', 7500, 16000, 9);
insert into software values('juliana', 'inventory','cobol', 3000, 3500, 0);
insert into software values('kamala', 'payrollpkg','dbase', 9000, 20000, 7);
insert into software values('mary', 'financialacct','oracle', 18000, 85000, 4);	
insert into software values('mary', 'codegenerator','c', 4500, 20000, 23);
insert into software values('pattrick', 'readme','cpp', 300, 1200, 84);	
insert into software values('qadir', 'bombsaway','assembly', 750, 3000, 11);	
insert into software values('qadir', 'vaccines','c', 1900, 3100, 21);
insert into software values('ramesh', 'hotelmgmt','dbase', 13000, 35000, 4);	
insert into software values('ramesh', 'deadlee','pascal', 599.95, 4500, 73);	
insert into software values('remitha', 'pcutilities','c', 725, 5000, 51);
insert into software values('remitha', 'tsrhelppkg','assembly', 2500, 6000, 7);
insert into software values('revathi', 'hotelmgmt','pascal', 1100, 75000, 2);
insert into software values('vijaya', 'tsreditor','c', 900, 700, 6);

insert into studies values('anand', 'sabhari', 'pgdca', 4500);
insert into studies values('altaf', 'coit', 'dca', 7200);
insert into studies values('juliana', 'bdps', 'mca', 22000);
insert into studies values('kamala', 'pragathi', 'dca', 5000);
insert into studies values('mary', 'sabhari', 'pgdca', 4500);
insert into studies values('nelson', 'pragathi', 'dap', 4500);
insert into studies values('pattrick', 'pragathi', 'dcap', 6200);
insert into studies values('qadir', 'apple', 'hdca', 14000);
insert into studies values('ramesh', 'sabhari', 'pgdca', 4500);
insert into studies values('rebecca', 'brilliant', 'dcap', 11000);
insert into studies values('remitha ', 'bdps', 'dcs', 6000);
insert into studies values('revathi', 'sabhari', 'dap', 5000);
insert into studies values('vijaya', 'bdps', 'dca', 48000);
--

--1 find out the selling cost AVG for packages developed in Pascal 
SELECT AVG(SCOST)FROM SOFTWARE
WHERE Developin like 'pascal';

--2. Display Names, Ages of all Programmers. 
SELECT pname, dob, 
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end As age
from programmer;

select getdate() as today, pname, dob, datediff(YEAR, dob, getdate()) As 'age' from programmer;

--3. Display the Names of those who have done the DAP Course. 
SELECT pname, course
from studies where course like 'dap';

--4. Display the Names and Date of Births of all Programmers Born in January.
SELECT DOB,pname
FROM PROGRAMMER
WHERE dob like '_____01___';

--5. What is the Highest Number of copies sold by a Package? 
SELECT MAX(SOLD) FROM SOFTWARE;

--6. Display lowest course Fee. 
SELECT * FROM studies;
SELECT MIN(coursefee) FROM studies;
SELECT Max(coursefee) FROM studies;

--7. How many programmers done the PGDCA Course? 
SELECT COUNT(pname)
FROM STUDIES
WHERE COURSE LIKE 'PGDCA';


--8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SOLD*SCOST)
FROM SOFTWARE
WHERE DEVELOPIN like 'c';

--9. Display the Details of the Software Developed by Ramesh. 
SELECT *FROM SOFTWARE
WHERE pname ='ramesh';

--10. How many Programmers Studied at Sabhari? 

SELECT * FROM studies where institute = 'sabhari';
SELECT count(pname) FROM studies where institute = 'sabhari';

--11. Display details of Packages whose sales crossed the 2000 Mark. 
SELECT *FROM SOFTWARE WHERE (SOLD*SCOST)>20000;

--12. Display the Details of Packages for which Development Cost have been recovered.
select * from software where scost*sold >= dcost;

--13. What is the cost of the costliest software development in Basic? 
select max(dcost) from software;

--14. How many Packages Developed in DBASE? 
SELECT * FROM software where developin = 'dbase';
SELECT count(title) FROM software where developin = 'dbase';

--15. How many programmers studied in Pragathi? 
SELECT count(pname) FROM studies where institute = 'sabhari';

--16. How many Programmers Paid 5000 to 10000 for their course? 
select count(pname) from studies where coursefee between 5000 and 10000;

--17. What is AVG Course Fee 
select AVG(coursefee) from studies;

--18. Display the details of the Programmers Knowing C.
SELECT * FROM software where developin = 'c';

--19. How many Programmers know either COBOL or PASCAL. 
SELECT * FROM PROGRAMMER WHERE PROF1='COBOL' OR PROF1='PASCAL' OR PROF2='COBOL' OR PROF2='PASCAL';

--20. How many Programmers Don’t know PASCAL and C 
SELECT * FROM PROGRAMMER WHERE PROF1!='C' OR PROF1!='PASCAL' OR PROF2!='C' OR PROF2!='PASCAL';

--21. How old is the Oldest Male Programmer. 
SELECT max(
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end) As age
from programmer;

--22. What is the AVG age of Female Programmers? 
SELECT AVG(
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end) As age
from programmer where gender like 'f';

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
SELECT pname, doj, 
case
when dateadd(year, datediff(YEAR, doj, getdate()), doj)>getdate()
then datediff(YEAR, doj, getdate()) - 1
else
datediff(YEAR, doj, getdate()) end As experience
from programmer order by pname desc;


--24. Who are the Programmers who celebrate their Birthday’s During the CurrentMonth? 
SELECT pname, dob, 
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end As age
from programmer
where MONTH(dob)= 12;

--25. How many Female Programmers are there? 
select count(gender) from programmer where gender like 'f';

--26. What are the Languages studied by Male Programmers. 
select prof1,prof2 from programmer where gender='m';

--27. What is the AVG Salary? 
select avg(salary) from programmer;

--28. How many people draw salary 2000 to 4000? 
select count(*) from programmer where salary between 4000 and 40000;

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 
select * from programmer where prof1<>'clipper' and prof1<>'cobol' and prof1<>'pascal' and prof2<>'clipper' and prof2<>'cobol' and prof2<>'pascal' ;

--30. Display the Cost of Package Developed By each Programmer. 
select pname,sum(scost) as cost_of_package from software group by pname;

--31. Display the sales values of the Packages Developed by the each Programmer. 
select pname,sum(scost*sold) as salesvalues_of_package from software group by pname;

--32. Display the Number of Packages sold by Each Programmer. 
select pname,sum(sold) as number_of_package from software group by pname;

--33. Display the sales cost of the packages Developed by each Programmer Language wise.
select developin as language_wise ,sum(scost*sold) as sales_cost_of_package from software group by developin;

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 
SELECT developin AS LANGUAGE,AVG(DCOST) AS AVGDEVCOST,AVG(SCOST) AS AVGSELLCOST,AVG(SCOST) AS PRICEPERCPY
FROM SOFTWARE GROUP BY developin;

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
SELECT pname As PRNAME,MIN(DCOST) As CHEAPEST,MAX(DCOST) AS COSTLIEST
FROM SOFTWARE GROUP BY pname;

--36. Display each institute name with number of Courses, Average Cost per Course. 
SELECT institute ,count(course) As number_of_courses, AVG(coursefee) AS AVG_cost_per_course
FROM studies GROUP BY institute;


--37. Display each institute Name with Number of Students. 
SELECT institute ,count(pname) As number_of_students
FROM studies GROUP BY institute;

--38. Display Names of Male and Female Programmers. Gender also. 
select pname, gender from programmer;

--39. Display the Name of Programmers and Their Packages. 
select pname, salary from programmer;

--40. Display the Number of Packages in Each Language Except C and C++. 
select developin As language, count(title) As number_of_packages 
from software group by developin having developin<>'c' and developin!='c++';

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select developin As language, count(title) As number_of_packages 
from software where dcost<1000 group by developin;

--42. Display AVG Difference between SCOST, DCOST for Each Package. 
select title As each_package, Avg(scost-dcost) As Avg_difference
from software group by title; 


--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. 
SELECT SUM(SCOST), SUM(DCOST), SUM(DCOST-(SOLD*SCOST)) FROM SOFTWARE GROUP BY pname HAVING SUM(DCOST)>SUM(SOLD*SCOST);

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 
SELECT MAX(SALARY), MIN(SALARY), AVG(SALARY)FROM PROGRAMMER WHERE SALARY > 2000;

--45. Who is the Highest Paid C Programmers? 
SELECT * FROM PROGRAMMER WHERE SALARY =(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C');

--46. Who is the Highest Paid Female COBOL Programmer? 
SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND gender LIKE 'F';

--47. Display the names of the highest paid programmers for each Language. 
WITH CTC AS (
  SELECT PNAME, SALARY, PROF1 AS PROF FROM programmer
  UNION 
  SELECT PNAME, SALARY, PROF2 FROM programmer
)
SELECT p1.PNAME, p1.PROF, p1.SALARY
FROM CTC as p1
LEFT JOIN CTC as 
p2
  ON p1.PROF = p2.PROF AND p1.SALARY < p2.SALARY
WHERE p2.PNAME IS NULL;

--48. Who is the least experienced Programmer. 
SELECT min(
case
when dateadd(year, datediff(YEAR, doj, getdate()), doj)>getdate()
then datediff(YEAR, doj, getdate()) - 1
else
datediff(YEAR, doj, getdate()) end) As experience
from programmer;

--49. Who is the most experienced male programmer knowing PASCAL. 
SELECT max(
case
when dateadd(year, datediff(YEAR, doj, getdate()), doj)>getdate()
then datediff(YEAR, doj, getdate()) - 1
else
datediff(YEAR, doj, getdate()) end) As experience
from programmer
where prof1='pascal' or prof2='pascal';

--50. Which Language is known by only one Programmer? 
SELECT PROF1 FROM PROGRAMMER
GROUP BY PROF1
HAVING PROF1 NOT IN
(SELECT PROF2 FROM PROGRAMMER)
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM PROGRAMMER
GROUP BY PROF2
HAVING PROF2 NOT IN
(SELECT PROF1 FROM PROGRAMMER)
AND COUNT(PROF2)=1;

---51. Who is the Above Programmer Referred in 50? 
CREATE TABLE PSLang(PROF VARCHAR(20))

Select * from pslang

INSERT INTO PSLang 
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM programmer 
INNER JOIN PSLang ON
PROF=PROF1 OR PROF=PROF2

--52. Who is the Youngest Programmer knowing DBASE? 
SELECT pname, prof1, prof2, 
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end As Age
from programmer where dob = (SELECT max(dob) from programmer where prof1='dbase' or prof2='dbase');


--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
SELECT * FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY >3000 AND 
prof1<>'c' and prof1<>'c++' and prof1<>'oracle'and prof1<>'dbase' and prof2<>'c' and prof2<>'c++' and prof2<>'oracle' and prof2<>'dbase' ;

---54. Which Institute has most number of Students? 
CREATE TABLE InstStudNo (InstituteName VARCHAR(20), StdNo INT)

INSERT INTO InstStudNo
SELECT INSTITUTE,COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT InstituteName,StdNo AS COUNT_OF_STUDENTS FROM InstStudNo
WHERE StdNo = (SELECT MAX(StdNo) FROM InstStudNo)

select * from InstStudNo

--55. What is the Costliest course? 
SELECT COURSE
FROM STUDIES
WHERE coursefee = (SELECT MAX(coursefee) FROM STUDIES);

--56. Which course has been done by the most of the Students? 
CREATE TABLE CourStudNo (CourNam VARCHAR(20), StdNo INT)

INSERT INTO CourStudNo
SELECT COURSE,COUNT(PNAME) FROM studies GROUP BY COURSE

select * from CourStudNo

SELECT CourNam,StdNo AS COUNT_OF_STUDENTS FROM CourStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM CourStudNo)


--57. Which Institute conducts costliest course. 
SELECT institute, COURSE FROM STUDIES WHERE coursefee = (SELECT MAX(coursefee) FROM STUDIES);

--58. Display the name of the Institute and Course, which has below AVG course fee.
select institute, course from studies where coursefee  < (SELECT AVG(coursefee) FROM STUDIES);

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
SELECT COURSE FROM STUDIES WHERE coursefee < (SELECT AVG(coursefee)+1000 FROM STUDIES) AND coursefee > (SELECT AVG(coursefee)-1000 FROM STUDIES);

--60. Which package has the Highest Development cost? 
SELECT TITLE,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

--61. Which course has below AVG number of Students? 
CREATE TABLE AVGCNT (CRS VARCHAR(20), CNT INT)

INSERT INTO AVGCNT
SELECT COURSE, COUNT(PNAME) FROM studies GROUP BY COURSE
SELECT CRS,CNT FROM AVGCNT WHERE CNT <=(SELECT AVG(CNT) FROM AVGCNT)

--62. Which Package has the lowest selling cost? 
SELECT TITLE,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);

--63. Who Developed the Package that has sold the least number of copies? 
SELECT PNAME,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE);

--64. Which language has used to develop the package, which has the highest sales amount? 
SELECT DEVELOPIN,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE);

--65. How many copies of package that has the least difference between development and selling cost where sold. 
SELECT SOLD,TITLE FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE));

--66. Which is the costliest package developed in PASCAL. 
SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST)FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL');

--67. Which language was used to develop the most number of Packages. 
SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN  HAVING DEVELOPIN = (SELECT MAX(DEVELOPIN) FROM SOFTWARE);

--68. Which programmer has developed the highest number of Packages
SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING PNAME = (SELECT MAX(PNAME) FROM SOFTWARE);

--69. Who is the Author of the Costliest Package? 
 SELECT PNAME, DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

--70. Display the names of the packages, which have sold less than the AVG number of copies. 
SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 
SELECT  distinct PNAME FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST;

--72. Display the programmer Name and the cheapest packages developed by them in each language. 
SELECT PNAME,TITLE FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN);

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME);

--74. Who is the youngest male Programmer born in 1965? 
SELECT pname, 
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end As Age
from programmer where dob = (SELECT max(dob) from programmer where YEAR(dob)='1965' and GENDER='M');


--75. Who is the oldest Female Programmer who joined in 1992?
SELECT pname, 
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end As Age
from programmer where dob = (SELECT min(dob) from programmer where YEAR(doj)='1992' and GENDER='F');

--76. In which year was the most number of Programmers born. 
CREATE TABLE TEMP (YOB INT, CNT INT)

INSERT INTO TEMP
SELECT YEAR(DOB) AS YEAR ,COUNT(pname) FROM programmer GROUP BY YEAR(DOB)

SELECT * FROM TEMP

SELECT YOB, CNT FROM TEMP WHERE CNT= (SELECT MAX(CNT) FROM TEMP)

--77. In which month did most number of programmers join? 
CREATE TABLE MOJ (MOJ INT, CNT INT)

INSERT INTO MOJ
SELECT MONTH(DOJ),COUNT(pname) FROM programmer GROUP BY MONTH(DOJ)

SELECT MOJ, CNT FROM MOJ WHERE CNT= (SELECT MAX(CNT) FROM MOJ)


--78. In which language are most of the programmer’s proficient. 
CREATE TABLE PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO PCNT
SELECT PROF1, COUNT(pname) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(pname) FROM programmer GROUP BY PROF2

select * from PCNT

INSERT INTO PsCNT
SELECT PR, SUM(CNT) FROM PCNT GROUP BY PR

select * from PsCNT

SELECT PRs, sCNT FROM PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM PsCNT)

--79. Who are the male programmers earning below the AVG salary of Female Programmers? 
SELECT PNAME FROM PROGRAMMER WHERE GENDER LIKE 'M'
AND SALARY < (SELECT(AVG(SALARY)) FROM PROGRAMMER WHERE GENDER LIKE 'F');

--80. Who are the Female Programmers earning more than the Highest Paid? 
SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER WHERE GENDER = 'M');

--81. Which language has been stated as the proficiency by most of the Programmers? 
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER)
union
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 = (SELECT MAX(PROF2) FROM PROGRAMMER);


--82. Display the details of those who are drawing the same salary. 
Select * From PROGRAMMER Where Salary in
(Select Salary From PROGRAMMER Group by Salary Having Count(Salary ) > 1);

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
select * from programmer p,software s
where p.pname=s.pname and salary>3000 and gender='m';

--84. Display the details of the packages developed in Pascal by the Female Programmers. 
select s.* from programmer p,software s
where p.pname=s.pname and gender='f' and DEVELOPIN ='pascal';

--85. Display the details of the Programmers who joined before 1990. 
select * from programmer where year(doj)< 1990;

--86. Display the details of the Software Developed in C By female programmers of Pragathi. 
select s.* from software s,studies st,programmer p where s.pname=st.pname and p.pname=s.pname and gender='f' and institute='pragathi';

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
Select studies.institute, count(software.developin) AS developin, count(software.sold) As Sold, sum(software.sold*software.scost) AS sales from software,studies
where software.pname =studies.pname group by studies.institute;

--88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
CREATE TABLE INST (INS VARCHAR(20), CNT INT)

INSERT INTO INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT distinct SW.* FROM software AS SW, programmer AS PG, studies AS ST, INST
WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM INST)


--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. 
SELECT S.*, YEAR(DOB),GENDER FROM Programmer p,Software s 
WHERE s.PNAME=p.PNAME AND 
((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975))


--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers. 
select s.* from programmer p,software s
where s.pname=p.pname and (developin <> prof1 and developin <> prof2);

--91. Display the details of the software developed by the male students of Sabhari. 
select s.* from software s,studies st,programmer p where s.pname=st.pname and p.pname=s.pname and gender='m' and institute='Sabhari';

--92. Display the names of the programmers who have not developed any packages. 
select pname from programmer
where pname not in(select pname from software);

--93. What is the total cost of the Software developed by the programmers of Apple? 
select sum(scost) from software s,studies st
where s.pname=st.pname and institute='apple';

--94. Who are the programmers who joined on the same day? 
select a.pname,a.doj from programmer a,programmer b
where a.doj=b.doj and a.pname <> b.pname;

--95. Who are the programmers who have the same Prof2? 
select distinct(a.pname),a.prof2 from programmer a,programmer b
where a.prof2=b.prof2 and a.pname <> b.pname;

--96. Display the total sales value of the software, institute wise. 
select studies.institute,sum(software.sold*software.scost) from software,studies
where studies.pname=software.pname group by studies.institute;

--97. In which institute does the person who developed the costliest package studied.
select institute from software st,studies s
where s.pname=st.pname group by institute,dcost having dcost=(select max(dcost) from software);

--98. Which language listed in prof1, prof2 has not been used to develop any package. 
select prof1 from programmer where prof1 not in(select developin from software) 
union
select prof2 from programmer where prof2 not in(select developin from software);

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 
select p1.salary,s2.course from programmer p1,software s1,studies s2
where p1.pname=s1.pname and s1.pname=s2.pname and scost=(select max(scost) from software);

--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
select avg(salary) from programmer p,software s
where p .pname=s.pname and sold*scost>50000;

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 
select s.pname, count(title) As packages from software s,studies st
where s.pname=st.pname group by s.pname,coursefee having min(coursefee)=(select min(coursefee) from studies);

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 
select count(developin) from programmer p,software s
where s .pname=p.pname group by developin having min(dcost)=(select min(dcost) from software);

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
select count(developin) from programmer p,software s
where s.pname=p.pname and gender='f' and salary>(select max(salary) from programmer p,software s
where s.pname=p.pname and gender='m');

--104. How many packages are developed by the most experienced programmer form BDPS. 
select count(*) from software s,programmer p
where p.pname=s.pname group by doj having min(doj)=(select min(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));

--105. List the programmers (form the software table) and the institutes they studied, including those WHO DIDN'T develop any package.
select pname,institute from studies
where pname not in(select pname from software);

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
select count(*),sum(scost*sold-dcost) "PROFIT" from software
where developin in (select prof1 from programmer) group by developin;

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
select s.pname,count(developin) from programmer p1,software s
where p1.pname=s.pname group by s.pname;




