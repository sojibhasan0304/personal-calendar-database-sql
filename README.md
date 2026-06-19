# Personal Calendar Database Design

A Microsoft SQL Server database project for a personal calendar and event reminder system. The project demonstrates relational database design, table creation, data insertion, SQL queries, views, triggers, stored procedures, and user-defined functions using T-SQL.

## Project Overview

This database is designed for a simple event management or personal calendar application. It stores user information, event categories, event details, and reminder records. The system can be used to track upcoming events, classify events by category, and manage reminder approval status for users.

## Main Features

- User information management
- Event category management
- Event scheduling with date, time, and location
- Reminder tracking for users and events
- Primary key and foreign key relationships
- Basic SQL query examples using `WHERE`, `AND`, `OR`, `ORDER BY`, `GROUP BY`, and `BETWEEN`
- View for user event summary
- Trigger to update the event modification date
- Stored procedure to get monthly events for a user
- Function to calculate event duration

## Database Tables

### `users`
Stores user details such as user ID, email, name, age, password, occupation, address, and country.

### `categories_of_event`
Stores event category information, including event name, terms and conditions, and event type.

### `event`
Stores event information such as event name, ID, place, start time, end time, date, category ID, and last modified date.

### `reminder`
Stores reminder details for users and events, including reminder description, status, user ID, and event ID.

## Technologies Used

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio

## How to Run the SQL Project

1. Open Microsoft SQL Server Management Studio.
2. Create a new database, for example:

```sql
CREATE DATABASE PersonalCalendarDB;
USE PersonalCalendarDB;
```

3. Open the SQL script from:

```text
sql/personal_calendar_database.sql
```

4. Execute the script step by step or run the full script.
5. Check the inserted data and output queries using `SELECT` statements.

