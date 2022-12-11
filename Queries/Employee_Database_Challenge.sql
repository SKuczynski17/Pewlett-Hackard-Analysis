SELECT  e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
ti.titles,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.titles
INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT COUNT(ut.titles), ut.titles
INTO Retiring_Titles
FROM unique_titles as ut
GROUP BY ut.titles
ORDER BY COUNT DESC;