ALTER TABLE EMPLOYEE
ADD COLUMN birth_date_dt DATE,
ADD COLUMN hire_date_dt DATE;

SET datestyle = MDY;
--Write Common Table Expression to append 0 to months and dates having single digit
-- eg: 7/25/2010 cannot to converted to date datatype, so we are doing string manipulation to convert it into : 07/25/2010 
;WITH Subqry AS (
	SELECT emp_no, 
		CASE 
			WHEN length(split_part(birth_date, '/', 1)) = 1 
			THEN ('0' || split_part(birth_date, '/', 1))
			ELSE split_part(birth_date, '/', 1)
			END 
		|| '/' || 
		CASE 
			WHEN length(split_part(birth_date, '/', 2)) = 1 
			THEN ('0' || split_part(birth_date, '/', 2))
			ELSE split_part(birth_date, '/', 2)
		END 
		|| '/' || 
		split_part(birth_date, '/', 3) 
	AS DOB1, 
				 
		CASE 
			WHEN length(split_part(hire_date, '/', 1)) = 1 
			THEN ('0' || split_part(hire_date, '/', 1))
			ELSE split_part(hire_date, '/', 1)
		END 
		|| '/' || 
		CASE 
			WHEN length(split_part(hire_date, '/', 2)) = 1 
			THEN ('0' || split_part(hire_date, '/', 2))
			ELSE split_part(hire_date, '/', 2)
		END 
		|| '/' || 
		split_part(hire_date, '/', 3) 
	AS DOH
				 
	FROM Employee
	);

UPDATE Employee  
SET birth_date_dt = CAST(Subqry.DOB1 AS DATE),
	hire_date_dt = CAST(Subqry.DOH AS DATE)
FROM Subqry
WHERE Employee.emp_no = Subqry.emp_no;  


ALTER TABLE EMPLOYEE
DROP COLUMN birth_date,
DROP COLUMN hire_date;

ALTER TABLE EMPLOYEE
RENAME birth_date_dt to birth_date;

ALTER TABLE EMPLOYEE
RENAME hire_date_dt to hire_date;
