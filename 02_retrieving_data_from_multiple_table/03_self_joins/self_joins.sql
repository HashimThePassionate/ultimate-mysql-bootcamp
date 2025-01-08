USE sql_hr;
SELECT 
    e.employee_id,
    e.first_name AS Employee_Name,
    m.first_name AS Manager_Name
FROM employees m
JOIN employees e
ON e.reports_to = m.employee_id;
