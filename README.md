# 🗄️ Employee Database Management using MySQL (DDL & Constraints)

A SQL project that designs and manages an **Employee Database** for a company using MySQL **DDL (Data Definition Language)** commands and **data integrity constraints**.

---

## 📌 Project Overview

As a Data Analyst, the company requires a database to store and manage information about **employees, departments, and locations**. This project covers the full lifecycle of database objects:

- Creating a database and tables
- Altering table structures
- Renaming and truncating tables
- Dropping tables and databases
- Recreating the schema with proper constraints to ensure **data integrity and consistency**

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL 8.x | Relational database management system |
| MySQL Workbench | Writing and executing SQL queries |
| SQL (DDL) | CREATE, ALTER, RENAME, TRUNCATE, DROP |

---

## 🗂️ Database Schema

**Database name:** `employee`

### Tables

**1. Departments**
| Column | Description |
|--------|-------------|
| `department_id` | Primary Key |
| `department_name` | Name of the department |

**2. Location**
| Column | Description |
|--------|-------------|
| `location_id` | Primary Key |
| `location_name` | Name of the location |

**3. Employees**
| Column | Description |
|--------|-------------|
| `employee_id` | Primary Key |
| `Employee_name` | Name of the employee |
| `Gender` | Gender of the employee |
| `Age` | Age of the employee |
| `Hire_date` | Date the employee was hired |
| `Designation` | Job title |
| `Salary` | Employee salary |
| `department_id` | Foreign Key → `Departments(department_id)` |
| `location_id` | Foreign Key → `Location(location_id)` |

### Entity Relationship

```
Departments (1) ────< Employees >──── (1) Locations
```

One department and one location can be linked to many employees.

---

## ✅ Tasks Performed

### Part 1: DDL Commands

| # | Command | Task |
|---|---------|------|
| 1 | `CREATE` | Created the `employee` database and all three tables with appropriate data types and relationships |
| 2 | `ALTER` | Added an `email` column to Employees |
| | | Widened `Designation` from `VARCHAR(100)` to `VARCHAR(200)` |
| | | Dropped the `Age` column |
| | | Renamed `Hire_date` to `date_of_joining` |
| 3 | `RENAME` | Renamed `Departments` → `Departments_Info` |
| | | Renamed `Location` → `Locations` |
| 4 | `TRUNCATE` | Removed all rows from the Employees table |
| 5 | `DROP` | Dropped the Employees table, then the `employee` database |

### Part 2: Constraints (Database Recreation)

The database was recreated with the following constraints:

**Departments**
- `department_id` → `PRIMARY KEY` (uniquely identifies each department)
- `department_name` → `NOT NULL` + `UNIQUE` (no nulls, no duplicates)

**Locations**
- `location_id` → `PRIMARY KEY` + `AUTO_INCREMENT` (auto-generated sequential IDs)
- `location_name` → `NOT NULL` + `UNIQUE` (no nulls, no duplicates)

**Employees**
- `employee_id` → `PRIMARY KEY` (distinct identifier per employee)
- `Employee_name` → `NOT NULL` (name is always required)
- `Gender` → `CHECK (gender IN ('M','F'))` (only 'M' or 'F' allowed)
- `Age` → `CHECK (age >= 18)` (employees must be 18 or older)
- `Hire_date` → `DEFAULT (CURRENT_DATE())` (auto-assigns today's date if not provided)
- `department_id` → `FOREIGN KEY` referencing `departments(department_id)`
- `location_id` → `FOREIGN KEY` referencing `Locations(location_id)`

---

## 💻 Final Schema (SQL)

```sql
create database if not exists employee;
use employee;

create table Departments(
    department_id int primary key,
    department_name varchar(100) not null unique
);

create table Locations(
    location_id int primary key auto_increment,
    location_name varchar(30) not null unique
);

create table employees(
    employee_id int primary key,
    Employee_name varchar(50) not null,
    Gender char(1) check(gender in ('M','F')),
    Age int check(age >= 18),
    Hire_date date default(current_date()),
    Designation varchar(100),
    Salary decimal(10,2),
    department_id int,
    location_id int,
    foreign key (department_id) references departments(department_id),
    foreign key (location_id) references Locations(location_id)
);
```

---

## 📁 Repository Structure

```
├── MySQL_Assignment_1.sql   # Complete SQL script (DDL + constraints)
└── README.md                # Project documentation
```

---

## ▶️ How to Run

1. Install **MySQL Server** and **MySQL Workbench**.
2. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/<your-repo-name>.git
   ```
3. Open `MySQL_Assignment_1.sql` in MySQL Workbench.
4. Execute the script (⚡ Run All) from top to bottom.

---

## 📚 Key Learnings

- Difference between `DROP`, `TRUNCATE`, and `DELETE`
- Modifying table structure safely with `ALTER TABLE`
- Using `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK`, `DEFAULT`, and `AUTO_INCREMENT` to enforce data integrity
- Designing relational tables linked through foreign keys
- Importance of the order of operations (e.g., dropping child tables before the parent database)

---

## 👤 Author

**Your Name**
Aspiring Data Analyst
🔗 [LinkedIn](https://linkedin.com/in/your-profile) | 💻 [GitHub](https://github.com/your-username)

---

⭐ If you found this project helpful, feel free to star the repository!
