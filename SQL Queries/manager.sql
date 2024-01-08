create table employees (
	employee_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	job_title VARCHAR(50),
	salary VARCHAR(50),
	reports_to VARCHAR(50),
	offic_id VARCHAR(50)
);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `job_title`, `salary`, `reports_to`, `offic_id`) 
VALUES ('33391', 'Muhammad', 'Hashim', 'CEO', '200000', NULL, '10')