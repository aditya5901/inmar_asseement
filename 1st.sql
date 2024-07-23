SELECT department, COUNT(*) AS employee_count FROM Employee
GROUP BY department HAVING SUM(salary) > 15000
ORDER BY employee_count DESC;