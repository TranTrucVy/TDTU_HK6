-- Table for departments
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    deptname VARCHAR(255),
    loc VARCHAR(255)
);
GO

-- Table for employees
CREATE TABLE emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(255),
    hiredate DATE,
    salary DECIMAL(10, 2),
    commission DECIMAL(10, 2),
    manager_id INT,
	deptno INT,
	FOREIGN KEY (deptno) REFERENCES dept(deptno)
);
GO

-- Table for job history
CREATE TABLE jobhist (
    empno INT,
    startdate DATE,
    enddate DATE,
    jobtitle VARCHAR(255),
    deptno INT,
    salary DECIMAL(10, 2),
    chgdesc VARCHAR(255),
	FOREIGN KEY (empno) REFERENCES emp(empno),
    FOREIGN KEY (deptno) REFERENCES dept(deptno)
 )
 GO

-- Sample data for departments
INSERT INTO dept (deptno, deptname, loc) VALUES
(10, 'HR', 'New York'),
(20, 'Finance', 'Chicago'),
(30, 'Marketing', 'Los Angeles'),
(40, 'IT', 'San Francisco'),
(50, 'Operations', 'Dallas');
GO

-- Sample data for employees
INSERT INTO emp (empno, ename, hiredate, salary, commission, manager_id, deptno) VALUES
(1001, 'John Smith', '2020-01-15', 50000.00, 2000.00, NULL, 10),
(1002, 'Alice Johnson', '2019-05-20', 60000.00, 2500.00, 1001, 20),
(1003, 'Michael Brown', '2021-03-10', 55000.00, 1800.00, 1001, 10),
(1004, 'Emily Davis', '2018-12-03', 70000.00, 3000.00, 1002, 30),
(1005, 'David Wilson', '2022-02-28', 60000.00, 2200.00, 1003, 40);
GO

-- Sample data for job history
INSERT INTO jobhist (empno, startdate, enddate, jobtitle, deptno, salary, chgdesc) VALUES
(1001, '2020-01-15', NULL, 'HR Manager', 10, 50000.00, 'Initial hire'),
(1002, '2019-05-20', NULL, 'Finance Manager', 20, 60000.00, 'Initial hire'),
(1003, '2021-03-10', NULL, 'HR Assistant', 10, 55000.00, 'Initial hire'),
(1004, '2018-12-03', NULL, 'Marketing Manager', 30, 70000.00, 'Initial hire'),
(1005, '2022-02-28', NULL, 'IT Specialist', 40, 60000.00, 'Initial hire');
GO
select * from dept