SELECT
    * 											-- Select all columns from the employees table
FROM
    employees AS empls_outer 					-- Alias for the outer query table
WHERE
    salary < 									-- Filter to include only those rows where the salary is below the average salary
    (
        SELECT									-- Subquery to calculate the average salary for each office
            AVG(salary) 						-- Calculate the average salary
        FROM
            employees AS empls_inner 			-- Alias for the inner query table
        WHERE
            office_id = empls_outer.office_id 	-- Ensure the average salary is calculated for the same office as the outer query
    );

-- Explanation:
-- 1. The `USE sql_hr;` statement selects the 'sql_hr' database to run the query against.
-- 2. The `SELECT * FROM employees AS empls_outer` part retrieves all columns from the 'employees' table.
-- 3. The `WHERE` clause filters the results based on the condition that the employee's salary must be less than the average salary of their respective office.
-- 4. The subquery `(SELECT AVG(salary) FROM employees AS empls_inner WHERE office_id = empls_outer.office_id)` calculates the average salary for employees in the same office as the outer query.
-- 5. The comparison `salary < (subquery)` ensures that only those employees whose salary is below the calculated average salary for their office are returned.

-- Execution order of the query:
-- 1. First, the subquery is executed: `SELECT AVG(salary) FROM employees AS empls_inner WHERE office_id = empls_outer.office_id`.
--    In this subquery, the average salary of employees is calculated for each office.
-- 2. The subquery is executed for each row of the outer query, where `empls_outer.office_id` is replaced with the office ID from the current row of the outer query.
-- 3. After calculating the average salary for each office, the main query selects all rows from the 'employees' table where the salary is less than the average salary of the corresponding office.
-- 4. The result of the query is employees whose salary is below the average salary in their office.

---

В данном фрагменте запроса происходит следующее:

```sql
WHERE office_id = empls_outer.office_id
```

### Пояснение

- **`WHERE office_id = empls_outer.office_id`**: Этот фрагмент кода является условием фильтрации в подзапросе. Он сопоставляет идентификатор офиса (`office_id`) сотрудников, для которых вычисляется средняя зарплата, с идентификатором офиса текущего сотрудника в основном запросе.

### Порядок выполнения

1. **Внешний запрос**: Для каждой строки в основном запросе (внешнем запросе), `empls_outer` представляет текущего сотрудника, чью зарплату мы хотим сравнить.

2. **Подзапрос**: Подзапрос выполняется для каждой строки внешнего запроса. В подзапросе:
   - **`empls_inner`** представляет сотрудников в том же офисе, что и текущий сотрудник из внешнего запроса.
   - **`office_id = empls_outer.office_id`**: Это условие фильтрует строки в подзапросе так, чтобы средняя зарплата вычислялась только для сотрудников, которые работают в том же офисе, что и текущий сотрудник из внешнего запроса.

### Итог

Таким образом, условие **`WHERE office_id = empls_outer.office_id`** обеспечивает, что средняя зарплата в подзапросе рассчитывается исключительно для сотрудников из того же офиса, что и рассматриваемый сотрудник в основном запросе. Это позволяет основному запросу правильно сравнивать зарплату каждого сотрудника с средней зарплатой их офиса.

---

Here�s a clearer breakdown of what�s happening with the condition `WHERE office_id = empls_outer.office_id`:

1. **For Each Employee**: The condition checks the `office_id` of the current employee in the outer query (let's call this employee `employee_X`).

2. **Subquery Calculation**: For each `employee_X`, the subquery:
   - Finds all employees who work in the same office as `employee_X` (i.e., those with `office_id = employee_X.office_id`).
   - Calculates the average salary of these employees.

### Example Breakdown

Suppose we have employees as follows:

- **Employee 1**: Office 1
- **Employee 2**: Office 1
- **Employee 3**: Office 1
- **Employee 4**: Office 2

**Processing Employee 1:**
- **Subquery** calculates the average salary for Office 1 (includes Employee 1, Employee 2, and Employee 3).
- For Employee 1, it will compare their salary to the average salary of Office 1.

**Processing Employee 2:**
- **Subquery** recalculates the average salary for Office 1 (same as above).
- For Employee 2, it will compare their salary to the average salary of Office 1.

**Processing Employee 3:**
- **Subquery** recalculates the average salary for Office 1.
- For Employee 3, it will compare their salary to the average salary of Office 1.

**Processing Employee 4:**
- **Subquery** calculates the average salary for Office 2 (includes only Employee 4).
- For Employee 4, it will compare their salary to the average salary of Office 2.

### General Pattern

- For **Employee 1**, the subquery will evaluate salaries of employees with `office_id = 1`.
- For **Employee 2**, it will also evaluate salaries of employees with `office_id = 1`.
- For **Employee 3**, it will again evaluate salaries of employees with `office_id = 1`.
- For **Employee 4**, it will evaluate salaries of employees with `office_id = 2`.

Each employee�s salary is compared against the average salary of their own office, ensuring the comparison is always relevant to the office they belong to.


---

SELECT											-- Select all columns from the 'invoices' table where the invoice total is greater than the average invoice total for the same client
    * 											-- Select all columns from the 'invoices' table
FROM
    invoices AS inv_outer 						-- Alias for the outer query table (represents the current row in the main query)
WHERE
    invoice_total > 							-- Condition to filter invoices where the total amount is greater than the average total for the same client
    (
        SELECT									-- Subquery to calculate the average invoice total for each client		
            AVG(invoice_total) 					-- Calculate the average total invoice amount
        FROM
            invoices AS inv_inner 				-- Alias for the inner query table (used in the subquery)
        WHERE
            client_id = inv_outer.client_id 	-- Ensure the average is calculated for invoices from the same client as the current row in the outer query
    );

-- Explanation:
-- 1. The `USE sql_invoicing;` statement sets the database context to 'sql_invoicing'.
-- 2. The `SELECT * FROM invoices AS inv_outer` part retrieves all columns from the 'invoices' table, where `inv_outer` is the alias for the table used in the outer query.
-- 3. The `WHERE` clause filters results to include only those invoices where `invoice_total` is greater than the average invoice total calculated for the same client.
-- 4. The subquery `(SELECT AVG(invoice_total) FROM invoices AS inv_inner WHERE client_id = inv_outer.client_id)` calculates the average invoice total for invoices with the same `client_id` as the current invoice row being evaluated in the outer query.
-- 5. The comparison `invoice_total > (subquery)` ensures that only those invoices whose total amount exceeds the average total invoice amount for their client are returned.

Iteration Process
Outer Query Execution:

For each row in the invoices table (aliased as inv_outer), the main query evaluates whether the invoice_total for that row is greater than the average invoice total for invoices from the same client.
Subquery Execution:

For the current row in the outer query, the subquery calculates the average invoice_total for all invoices that have the same client_id as the current inv_outer.client_id.
Comparison:

The result of the subquery (average invoice total for the client) is compared with invoice_total of the current row.
If invoice_total is greater than the average calculated by the subquery, the row is included in the result set of the outer query.
Example
If you have:

Invoice 1: client_id = 101, invoice_total = 150
Invoice 2: client_id = 101, invoice_total = 200
Invoice 3: client_id = 101, invoice_total = 250
Invoice 4: client_id = 102, invoice_total = 300
For Invoice 1 (client_id = 101):

Subquery calculates average for client_id 101: (150 + 200 + 250) / 3 = 200.
Invoice 1 is included if 150 > 200 (which is false).
For Invoice 2 (client_id = 101):

Subquery calculates average for client_id 101: (150 + 200 + 250) / 3 = 200.
Invoice 2 is included if 200 > 200 (which is false).
For Invoice 3 (client_id = 101):

Subquery calculates average for client_id 101: (150 + 200 + 250) / 3 = 200.
Invoice 3 is included if 250 > 200 (which is true).
For Invoice 4 (client_id = 102):

Since there are no other invoices with client_id 102 in the example, the subquery returns the invoice total of 300.
Invoice 4 is not included since 300 is not greater than 300.
In summary, only invoices with totals exceeding the average total of invoices for their respective clients are selected.