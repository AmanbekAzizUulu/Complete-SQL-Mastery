### SQL Query with Detailed Comments

```sql
-- Select all columns from the 'clients' table
SELECT 
    * 
FROM 
    clients 
WHERE 
    -- Filter the clients based on a subquery
    client_id IN 
        (
            -- Subquery: Select 'client_id' from the 'invoices' table
            SELECT 
                client_id 
            FROM 
                invoices AS inv 
            -- Group the results by 'client_id'
            GROUP BY 
                client_id 
            -- Only include groups having 2 or more invoices
            HAVING 
                COUNT(*) >= 2 
        );
```

### Detailed Explanation

1. **`SELECT * FROM clients`**:
   - This line selects all columns (`*`) from the `clients` table.

2. **`WHERE client_id IN`**:
   - This line filters the results from the `clients` table based on the condition that follows.
   - The `IN` operator is used to check if the `client_id` in the `clients` table is within the list of `client_id`s returned by the subquery.

3. **Subquery**:
   - The subquery is used to identify `client_id`s that meet specific criteria within the `invoices` table.

   ```sql
   SELECT client_id 
   FROM invoices AS inv 
   GROUP BY client_id 
   HAVING COUNT(*) >= 2 
   ```

   - **`SELECT client_id`**:
     - This line selects the `client_id` from the `invoices` table.

   - **`FROM invoices AS inv`**:
     - This specifies the `invoices` table as the source of the data, with an alias `inv` for the table. The alias can make the query easier to read and write, especially in more complex queries.
   
   - **`GROUP BY client_id`**:
     - This line groups the results by `client_id`. Grouping is necessary to use aggregate functions like `COUNT()`.

   - **`HAVING COUNT(*) >= 2`**:
     - The `HAVING` clause is used to filter groups based on the result of the aggregate function.
     - `COUNT(*)` counts the number of rows in each group (i.e., the number of invoices for each `client_id`).
     - The condition `COUNT(*) >= 2` ensures that only `client_id`s with 2 or more invoices are included in the result of the subquery.

### Overall Purpose

This query is used to select all clients from the `clients` table who have at least 2 invoices in the `invoices` table. The subquery identifies `client_id`s with 2 or more invoices, and the outer query retrieves all details for these clients from the `clients` table.