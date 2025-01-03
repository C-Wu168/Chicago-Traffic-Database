
# Project Title: Chicago Traffic Citations Database

## Overview
This project demonstrates the process of transforming raw CSV data into an organized MySQL database, enabling efficient data querying and analysis. The dataset consists of Chicago traffic citations, providing insights into violations, payments, and locations.

The project involves:
- Designing a relational database schema.
- Normalizing data into the third normal form (3NF).
- Implementing views for advanced queries.
- Visualizing the database structure using an ERD.

## Tools and Technologies
- **MySQL Workbench**: For designing the ERD and managing the database.
- **MySQL**: For database creation and query execution.
- **Python/Excel**: For initial data cleaning and preparation.
- **SQL**: For creating tables, views, and performing data queries.

## Features
1. **Normalized Database Structure**:
   - Data is divided into seven relational tables: Tickets, Locations, Payments, Violations, Officers, Hearings, and Vehicles.
   - Primary and foreign keys ensure data integrity and relationships.

2. **ERD Visualization**:
   - The Entity-Relationship Diagram (ERD) illustrates table relationships and normalization.

3. **Advanced Queries**:
   - **High Payment Due Tickets**: Identifies tickets with payments exceeding the average.
   - **Average Payment Per Violation**: Calculates average fines per violation type.
   - **Violations by Vehicle Type**: Summarizes violations per vehicle category.
   - **Filtered Zip Codes by Violations**: Highlights areas with frequent violations.
   - **Ticket Violations and Locations**: Combines ticket details with violation locations.
   - **Liable Ticket Violation Hearings**: Lists violations where drivers were held liable.

## File Structure
- **`chicago-traffic-database-creation.sql`**: Script for creating the database schema and tables.
- **`chicago-traffic-view-queries.sql`**: Contains SQL queries for creating views.
- **`chicago-traffic-database-ERD.mwb`**: MySQL Workbench file of the ERD.
- **`README.md`**: This document.
- **Documentation**: Contains the detailed project report and png of the ERD.

## Usage
1. Import the database schema using the `chicago-traffic-database-creation.sql` file.
2. Use MySQL Workbench to open the ERD (`chicago-traffic-database-ERD.mwb`) for visualizing the database design.
3. Query the database using SQL to explore insights and trends.

## Challenges and Solutions
- **Normalization Issues**: Initially, primary keys were mismatched. Adding surrogate IDs resolved this.
- **Query Optimization**: Indexing critical columns improved query performance.

## Key Takeaways
- Planning and designing databases ensures scalability and usability.
- Creating views simplifies complex queries and enhances data accessibility.
- Understanding ethical considerations is vital when handling sensitive data.

## Potential Applications
- Analyzing traffic violations for policy improvements.
- Identifying heavily policed areas for urban planning.
- Correlating economic and geographic data with traffic violations.

## Contact
For questions or further details, please reach out at chenhaowu2004@gmail.com.

---

**Note:** This project is intended for demonstration purposes only. Unauthorized use, modification, or distribution is not permitted.
