SELECT * FROM employees_cleaned
SELECT*FROM Attandance_Cleaned
SELECT*FROM Payroll_Cleaned
SELECT*FROM Departments_CLeaned
SELECT*FROM Performance_CLeaned

SELECT*FROM Departments_CLeaned
SELECT * FROM employees_cleaned

SELECT*FROM Departments_CLeaned
SELECT*FROM Payroll_Cleaned

 SELECT * FROM employees_cleaned
 SELECT*FROM Payroll_Cleaned

 SELECT*FROM Performance_CLeaned
 SELECT * FROM employees_cleaned

#TOTALEMPLOYEES

SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM employees_cleaned

#AVERAGE_SALARY

SELECT AVG(SALARY) AS AVG_SALARY FROM Payroll_Cleaned

#EMPLOYEES_BY_DEPARTMENTS

SELECT D.Department, COUNT(*) AS EMPLOYEES FROM employees_cleaned E JOIN Departments_CLeaned D ON E.DepartmentID= D.DEPARTMENTID GROUP BY D.DEPARTMENT;

#AVERAGE_SALARY_BY_DEPARMENT

SELECT D.DEPARTMENT , AVG(P.SALARY) AS AVGSALARY FROM employees_cleaned E JOIN Payroll_Cleaned P ON E.EmployeeID=P.EmployeeID JOIN Departments_CLeaned D ON E.DepartmentID=D.DepartmentID
GROUP BY D.Department ORDER BY AVGSALARY DESC;

#attrition_by_department
SELECT D.DEPARTMENT ,COUNT(*) AS ATTRITIONCOUNT FROM employees_cleaned E JOIN Attandance_Cleaned A ON E.EmployeeID= A.EmployeeID JOIN Departments_CLeaned D ON E.EmployeeID=D.DepartmentID WHERE A.Attrition='YES'  GROUP BY D.Department

#TOP 10 HIGHEST PAID EMPLOYEES

SELECT TOP 10 E.EMPLOYEENAME , P.SALARY FROM employees_cleaned E JOIN Payroll_Cleaned P ON E.EmployeeID=P.EmployeeID ORDER BY SALARY DESC;

#PROMOTION ANALYSIS 

SELECT PROMOTION,COUNT(*) AS EMPLOYEES FROM Performance_CLeaned GROUP BY Promotion;

#AVERAGE PERFORMANCE BY DEPARTMENT

SELECT D.DEPARTMENT, AVG(PF.PERFORMANCERATING) AS AVGPERFORMANCE FROM employees_cleaned E JOIN Performance_CLeaned PF ON E.EmployeeID=PF.EmployeeID JOIN Departments_CLeaned D ON E.DepartmentID=D.DepartmentID GROUP BY D.Department
