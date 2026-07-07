import numpy as np 
import pandas as pd

employees=pd.read_excel("Enterprise_HR_Analytics_Dataset (1).xlsx", sheet_name="Employees")
departments=pd.read_excel("Enterprise_HR_Analytics_Dataset (1).xlsx", sheet_name="Departments") 
payroll=pd.read_excel("Enterprise_HR_Analytics_Dataset (1).xlsx", sheet_name="Payroll") 
performance=pd.read_excel("Enterprise_HR_Analytics_Dataset (1).xlsx", sheet_name="Performance") 
attandance=pd.read_excel("Enterprise_HR_Analytics_Dataset (1).xlsx", sheet_name="Attendance")   

#Employee Data
print(employees.head())
print(employees.info())
print(employees.describe())
print(employees.isnull().sum())

#Department Data
print(departments.head())
print(departments.info())
print(departments.describe())
print(departments.isnull().sum())

#Payroll Data
print(payroll.head())
print(payroll.info())
print(payroll.describe())
print(payroll.isnull().sum())

#Performance Data
print(performance.head())
print(performance.info())
print(performance.describe())
print(performance.isnull().sum())

#Attendance Data
print(attandance.head())
print(attandance.info())
print(attandance.describe())
print(attandance.isnull().sum())

 
#Remove duplicates
print(employees.drop_duplicates(inplace=True))
print(departments.drop_duplicates(inplace=True))
print(payroll.drop_duplicates(inplace=True))
print(performance.drop_duplicates(inplace=True))
print(attandance.drop_duplicates(inplace=True))

#Convert date columns to datetime format
employees["HireDate"] = pd.to_datetime(employees["HireDate"])

#Feature Engineering
#Experience
employees["Experience"] = (pd.Timestamp.today().year - employees["HireDate"].dt.year)

#Age Group

employees['AgeGroup']=pd.cut(employees["Age"], bins=[20,30,40,50,60], labels=["21-30","31-40","41-50","51-60"])

#Salary Band

emp=employees.merge(payroll,on="EmployeeID")

emp["SalaryBand"]=pd.cut(emp["Salary"],bins=[0,40000,70000,100000,200000],labels=["Low","Medium","High","Very High"])

#Save the cleaned csv file
employees.to_csv("employees_cleaned.csv",index=False)
departments.to_csv("Departments_CLeaned.csv",index=False)
payroll.to_csv("Payroll_Cleaned.csv",index=False)
performance.to_csv("Performance_CLeaned.csv",index=False)
attandance.to_csv("Attandance_Cleaned.csv",index=False)

