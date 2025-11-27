# Spice Isle Tours Database Management System

## Overview
<p align="justify">This repository contains my final project for the Database Systems course at T.A. Marryshow Community College. The project implements a comprehensive MySQL database management system for Spice Isle Tours, a growing Grenadian tourism company. The system handles all aspects of tour operations including tour scheduling, guide certifications, client bookings, performance analytics, and business intelligence reporting. The database follows proper normalization principles (1NF, 2NF, 3NF) and demonstrates enterprise-level database design with complex SQL queries and management reports.</p>

## Project Objectives
- Design a fully normalized relational database schema meeting all business requirements
- Implement complex relationships between tours, guides, locations, and clients
- Develop business intelligence queries for tour performance and employee appraisals
- Create management reports for revenue tracking and operational analytics
- Ensure data integrity through proper constraints and foreign key relationships

## Database Structure
<table> <tr> <th>Table</th> <th>Description</th> </tr> <tr> <td><strong>Tour</strong></td> <td>Stores tour packages with names, durations, and fees - forms the core service catalog</td> </tr> <tr> <td><strong>Location</strong></td> <td>Contains all tourist attractions and sites with descriptions and addresses</td> </tr> <tr> <td><strong>Guide</strong></td> <td>Manages employee information including certifications and hire dates</td> </tr> <tr> <td><strong>TourItinerary</strong></td> <td>Defines tour routes with specific location visit order and sequencing</td> </tr> <tr> <td><strong>Certification</strong></td> <td>Tracks guide qualifications for specific locations with certification dates</td> </tr> <tr> <td><strong>Outing</strong></td> <td>Schedules actual tour instances with assigned guides and dates</td> </tr> <tr> <td><strong>Client</strong></td> <td>Stores tourist information and contact details for booking management</td> </tr> <tr> <td><strong>Booking</strong></td> <td>Handles client reservations with ratings and reviews for service quality</td> </tr> </table>

## Key Features
- **Tour Performance Analytics:** Revenue tracking, booking trends, and customer satisfaction metrics
- **Employee Appraisal System:** Guide performance evaluation with certification management
- **Quality Assurance:** Automated guide qualification verification for tour assignments
- **Business Intelligence:** Comprehensive reporting for management decision-making
- **Scalable Architecture:** Foundation for future payroll and payment system integration

## Technical Implementation
- **Database:** MySQL with full normalization (1NF, 2NF, 3NF compliance)
- **Interface:** phpMyAdmin for database management and query execution
- **Relationships:** Complex many-to-many relationships with junction tables
- **Constraints:** Foreign key constraints, primary keys, and data integrity rules
- **Queries:** Advanced SQL with JOIN operations, aggregation, and filtering

## License
<p align="justify">This project is for <b>academic and educational purposes only</b>. Developed as the final project for Database Systems CIT247 at T.A. Marryshow Community College. All database design and SQL implementations are original work created for educational demonstration.</p>

<br>

<footer>
  <p align="justify"><strong>© 2024 Ahndre Walters</strong> · Spice Isle Tours Database Management System · TAMCC Database Systems Course · College Course Final Project</p>
</footer>
