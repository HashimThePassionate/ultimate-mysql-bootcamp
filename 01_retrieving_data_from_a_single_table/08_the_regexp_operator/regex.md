# 🔍 **Using REGEX in MySQL to Search Different Records**
In MySQL, you can use **REGEXP** (Regular Expression) to search for patterns in your database. Based on your **`customers`** table structure, here are some useful **SQL queries** to filter data using regex:

---

### 📌 **1. Find Customers with First Name Starting with 'A'**
```sql
SELECT * FROM customers WHERE first_name REGEXP '^A';
```
🔹 **Explanation:** `^A` means the name **must start** with 'A'.

---

### 📌 **2. Find Customers with Last Name Ending in 'son'**
```sql
SELECT * FROM customers WHERE last_name REGEXP 'son$';
```
🔹 **Explanation:** `son$` means the last name **must end** with 'son' (e.g., "Anderson", "Johnson").

---

### 📌 **3. Find Customers Born in the 1990s (Between 1990-1999)**
```sql
SELECT * FROM customers WHERE birth_date REGEXP '^199[0-9]-';
```
🔹 **Explanation:**  
- `^199[0-9]-` matches dates **starting with 1990-1999**.

---

### 📌 **4. Find Customers with a Phone Number Containing '123'**
```sql
SELECT * FROM customers WHERE phone REGEXP '123';
```
🔹 **Explanation:** This query finds **any phone number** that **contains '123'** anywhere.

---

### 📌 **5. Find Customers in Specific Cities (e.g., 'New York' or 'Los Angeles')**
```sql
SELECT * FROM customers WHERE city REGEXP 'New York|Los Angeles';
```
🔹 **Explanation:**  
- The `|` symbol acts like **OR**, matching **either 'New York' or 'Los Angeles'**.

---

### 📌 **6. Find Customers Whose State Code is Exactly Two Letters**
```sql
SELECT * FROM customers WHERE state REGEXP '^[A-Z]{2}$';
```
🔹 **Explanation:**  
- `^[A-Z]{2}$` ensures **only two uppercase letters** are matched.

---

### 📌 **7. Find Customers Who Have Not Provided a Phone Number**
```sql
SELECT * FROM customers WHERE phone REGEXP '^$' OR phone IS NULL;
```
🔹 **Explanation:**  
- `^$` matches **empty strings**.
- `IS NULL` ensures even `NULL` values are checked.

---

### 📌 **8. Find Customers With Numeric Characters in Their Address**
```sql
SELECT * FROM customers WHERE address REGEXP '[0-9]';
```
🔹 **Explanation:** This query finds addresses **containing at least one digit** (useful for addresses like "12 Main St").

---

### 📌 **9. Find Customers Whose Points Are Exactly 100, 200, or 500**
```sql
SELECT * FROM customers WHERE points REGEXP '^100$|^200$|^500$';
```
🔹 **Explanation:**  
- The `^100$|^200$|^500$` pattern ensures an **exact match** to 100, 200, or 500.

---

### 📌 **10. Find Customers With Email Addresses Ending in '.com'**
```sql
SELECT * FROM customers WHERE email REGEXP '\\.com$';
```
🔹 **Explanation:**  
- The `\\.com$` ensures emails **end with '.com'**.


