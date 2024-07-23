SELECT d.DepartmentName, MAX(p.UnitPrice) AS MostExpensiveProductPrice
FROM Department d LEFT JOIN Product p
ON d.ID = p.DepartmentID GROUP BY d.DepartmentName
ORDER BY d.DepartmentName;