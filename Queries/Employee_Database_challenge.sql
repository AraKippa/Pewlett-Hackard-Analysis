-- First part deliverable one
SELECT e.emp_no,
	e.first_name,
		e.last_name,
		t.titles,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM titles as t
LEFT JOIN employees as e
ON t.emp_no = e.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- second part deliverable one
SELECT DISTINCT ON (emp_no)emp_no,
	first_name,
	last_name,
	titles 
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- Third part deliverable one
SELECT COUNT (ut.titles), titles
INTO retiring_titles
FROM unique_titles as ut
GROUP BY titles
ORDER BY count DESC;

--Deliverable two
SELECT e.emp_no,
	e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date
INTO temp_table
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no

-- Add titles data
SELECT DISTINCT ON (tt.emp_no) tt.emp_no,
		tt.first_name,
		tt.last_name,
		tt.birth_date,
		tt.from_date,
		tt.to_date,
		t.titles
INTO mentorship_eligibility
FROM temp_table as tt
LEFT JOIN titles as t
ON tt.emp_no = t.emp_no
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no;
