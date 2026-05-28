-- Project Name: Movie Theater Booking System
-- Subject: Database Management System (Semester-Project)
-- Name: Muhammad Taqui
-- Due Date: January 8th, 2023 @ 12:30 AM


-- Create Admin table
CREATE TABLE Admin (
  Admin_id INT PRIMARY KEY,
  Password VARCHAR(255) NOT NULL
);

-- Create Seat table
CREATE TABLE Seat (
  Seat_id INT PRIMARY KEY,
  Seat_type VARCHAR(255) NOT NULL,
  Total_seats INT NOT NULL
);

-- Create Theatre table
CREATE TABLE Theatre (
  Theatre_id INT PRIMARY KEY,
  Theatre_name VARCHAR(255) NOT NULL,
  Location VARCHAR(255) NOT NULL,
  Seat_id INT,
  Admin_id INT,
  FOREIGN KEY (Seat_id) REFERENCES Seat(Seat_id),
  FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id)
);

-- Create Show table
CREATE TABLE Show (
  Show_id INT PRIMARY KEY,
  Start_hours DATE NOT NULL,
  End_hours DATE NOT NULL,
  Show_date DATE NOT NULL
);

-- Create Ticket table
CREATE TABLE Ticket (
  Ticket_id INT PRIMARY KEY,
  Show_date DATE NOT NULL,
  Ticket_price INT NOT NULL,
  Seat_id INT,
  Show_id INT,
  Customer_id INT,
  Admin_id INT
);

-- Create Movie table
CREATE TABLE Movie (
  Movie_id INT PRIMARY KEY,
  Movie_name VARCHAR(255) NOT NULL,
  Release_date DATE NOT NULL,
  Min_age INT NOT NULL,
  Directors VARCHAR(255) NOT NULL,
  Actors VARCHAR(255) NOT NULL,
  Show_id INT
);

-- Create Discount table
CREATE TABLE Discount (
  Discount_id INT PRIMARY KEY,
  Movie_name VARCHAR(255) NOT NULL,
  Ticket_price INT NOT NULL,
  Ticket_id INT
);

-- Create Customer table
CREATE TABLE Customer (
  Customer_id INT PRIMARY KEY,
  First_Name VARCHAR(255) NOT NULL,
  Middle_name VARCHAR(255) NOT NULL,
  Last_name VARCHAR(255) NOT NULL,
  Contact INT NOT NULL,
  Age INT NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Date_of_birth DATE NOT NULL,
  Gender CHAR(1) NOT NULL,
  Booking_Date DATE NOT NULL
);

-- Alter Show table to add Ticket_id and foreign key
ALTER TABLE Show ADD Ticket_id INT;
ALTER TABLE Show ADD FOREIGN KEY (Ticket_id) REFERENCES Ticket(Ticket_id);

-- Insert data into Seat table
INSERT INTO Seat (Seat_id, Seat_type, Total_seats) VALUES 
(1, 'Standard', 20),
(2, 'Standard', 20),
(3, 'Comfort', 15),
(4, 'Comfort', 15),
(5, 'Standard', 20),
(6, 'Premium', 5),
(7, 'Premium', 5);

-- Insert data into Theatre table
INSERT INTO Theatre (Theatre_id, Theatre_name, Location, Seat_id, Admin_id) VALUES
(1, 'Theatre 1', 'New York', 1, 1),
(2, 'Theatre 2', 'Texas', 2, 2),
(3, 'Theatre 3', 'Newyork', 3, 3),
(4, 'Theatre 1', 'Washington DC', 4, 4),
(5, 'Theatre 1', 'Texas', 5, 5),
(6, 'Theatre 3', 'Washington Dc', 6, 7),
(7, 'Theatre 3', 'Chicago', 7, 6);

-- Insert data into Show table
INSERT INTO Show (Show_id, Start_hours, End_hours, Show_date) VALUES
(1, TO_DATE('01-JAN-2022','DD-MON-YYYY'), TO_DATE('01-JAN-2022','DD-MON-YYYY'), TO_DATE('01-JAN-2022','DD-MON-YYYY')),
(2, TO_DATE('02-JAN-2022','DD-MON-YYYY'), TO_DATE('02-JAN-2022','DD-MON-YYYY'), TO_DATE('02-JAN-2022','DD-MON-YYYY')),
(3, TO_DATE('01-JAN-2022','DD-MON-YYYY'), TO_DATE('01-JAN-2022','DD-MON-YYYY'), TO_DATE('01-JAN-2022','DD-MON-YYYY')),
(4, TO_DATE('11-DEC-2000','DD-MON-YYYY'), TO_DATE('11-DEC-2000','DD-MON-YYYY'), TO_DATE('11-DEC-2000','DD-MON-YYYY')),
(5, TO_DATE('1-JUL-2111','DD-MON-YYYY'), TO_DATE('1-JUL-2111','DD-MON-YYYY'), TO_DATE('1-JUL-2111','DD-MON-YYYY')),
(6, TO_DATE('2-AUG-2005','DD-MON-YYYY'), TO_DATE('2-AUG-2005','DD-MON-YYYY'), TO_DATE('2-AUG-2','DD-MON-YYYY')),
(7, TO_DATE('1-JAN-2000','DD-MON-YYYY'), TO_DATE('1-JAN-2000','DD-MON-YYYY'), TO_DATE('1-JAN-2000','DD-MON-YYYY'));

-- Insert data into Ticket table
INSERT INTO Ticket (Ticket_id, Show_date, Ticket_price, Seat_id) VALUES
(1, TO_DATE('01-DEC-2022','DD-MON-YYYY'), 50, 1),
(2, TO_DATE('01-JAN-2023','DD-MON-YYYY'), 20, 3),
(3, TO_DATE('01-JAN-2023','DD-MON-YYYY'), 50, 2),
(4, TO_DATE('10-JAN-2023','DD-MON-YYYY'), 50, 6),
(5, TO_DATE('5-JAN-2023','DD-MON-YYYY'), 50, 7),
(6, TO_DATE('2-JAN-2023','DD-MON-YYYY'), 50, 4),
(7, TO_DATE('09-JAN-2023','DD-MON-YYYY'), 50, 5);

-- Insert data into Movie table
INSERT INTO Movie (Movie_id, Movie_name, Release_date, Min_age, Directors, Actors) VALUES
(1, 'The Shawshank Redemption', TO_DATE('1994-10-14','YYYY-MM-DD'), 18, 'Frank Darabont', 'Tim Robbins, Morgan Freeman'),
(2, 'The Godfather', TO_DATE('1972-03-14','YYYY-MM-DD'), 18, 'Francis Ford Coppola', 'Marlon Brando, Al Pacino'),
(3, 'The Godfather: Part II', TO_DATE('1974-12-20','YYYY-MM-DD'), 18, 'Francis Ford Coppola', 'Al Pacino, Robert De Niro'),
(4, 'Interstellar', TO_DATE('2022-01-01','YYYY-MM-DD'), 12, 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway'),
(5, 'The Dark Knight', TO_DATE('2008-07-18','YYYY-MM-DD'), 14, 'Christopher Nolan', 'Christian Bale, Heath Ledger'),
(6, 'Inception', TO_DATE('2010-07-16','YYYY-MM-DD'), 16, 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt'),
(7, 'The Matrix', TO_DATE('1999-03-31','YYYY-MM-DD'), 13, 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne');

-- Create VIEW CUSTOMER_DETAILS
CREATE VIEW CUSTOMER_DETAILS AS
SELECT * FROM CUSTOMER WHERE Age = 28;

-- Create VIEW MOVIE_DETAILS
CREATE VIEW MOVIE_DETAILS AS
SELECT * FROM MOVIE WHERE Movie_id = 1;

-- Create VIEW SHOW_DETAILS
CREATE VIEW SHOW_DETAILS AS
SELECT * FROM SHOW WHERE Start_hours = TO_DATE('14:30', 'HH24:MI');

-- Create VIEW THEATRE_DETAILS
CREATE VIEW THEATRE_DETAILS AS
SELECT * FROM THEATRE WHERE Seat_id = 7 AND Admin_id = 6;

-- Create VIEW SEAT_DETAILS
CREATE VIEW SEAT_DETAILS AS
SELECT * FROM SEAT WHERE Seat_type = 'Premium';

-- Create VIEW ADMIN_DETAILS
CREATE VIEW ADMIN_DETAILS AS
SELECT * FROM Admin WHERE Admin_id > 3 AND Admin_id < 5;

-- Create VIEW DISCOUNT_DETAILS
CREATE VIEW DISCOUNT_DETAILS AS
SELECT * FROM DISCOUNT WHERE Movie_name = 'Inception';

-- Create VIEW TICKET_DETAILS
CREATE VIEW TICKET_DETAILS AS
SELECT * FROM TICKET WHERE Seat_id > 2 AND Seat_id < 7;

-- Create VIEW CUSTOMER_DETAILS_2
CREATE VIEW CUSTOMER_DETAILS_2 AS
SELECT * FROM CUSTOMER WHERE Age > 30;

-- Create VIEW MOVIE_DETAILS_2
CREATE VIEW MOVIE_DETAILS_2 AS
SELECT * FROM MOVIE WHERE Min_age <= 14;

-- Create VIEW SHOW_DETAILS_2
CREATE VIEW SHOW_DETAILS_2 AS
SELECT * FROM SHOW WHERE TO_CHAR(Start_hours, 'HH24:MI') = '14:30';

-- Create VIEW THEATRE_DETAILS_2
CREATE VIEW THEATRE_DETAILS_2 AS
SELECT * FROM THEATRE WHERE Location LIKE 'New%';

-- Create VIEW SEAT_DETAILS_2
CREATE VIEW SEAT_DETAILS_2 AS
SELECT * FROM SEAT WHERE Total_seats >= 20;

-- Create VIEW ADMIN_DETAILS_2
CREATE VIEW ADMIN_DETAILS_2 AS
SELECT * FROM Admin WHERE Password IS NOT NULL;

-- Create VIEW DISCOUNT_DETAILS_2
CREATE VIEW DISCOUNT_DETAILS_2 AS
SELECT * FROM DISCOUNT WHERE Ticket_price < 50;

-- Create VIEW TICKET_DETAILS_2
CREATE VIEW TICKET_DETAILS_2 AS
SELECT * FROM TICKET WHERE Ticket_price > 30;

-- Create VIEW MOVIE_ACTORS_DIRECTOR
CREATE VIEW MOVIE_ACTORS_DIRECTOR AS
SELECT Movie_name, Actors, Director FROM Movie;

-- Create VIEW MOVIE_DETAILS_EXTEND
CREATE VIEW MOVIE_DETAILS_EXTEND AS
SELECT Movie_id, Movie_name, Release_date, Min_age, Directors, Actors, Show_id FROM Movie;

-- Create VIEW CUSTOMER_DETAILS_EXTEND
CREATE VIEW CUSTOMER_DETAILS_EXTEND AS
SELECT Customer_id, First_Name, Middle_name, Last_name, Contact, Age, Email, Password, Date_of_birth, Gender, Booking_Date FROM Customer;

-- Create VIEW TICKET_DETAILS_EXTEND
CREATE VIEW TICKET_DETAILS_EXTEND AS
SELECT Ticket_id, Show_date, Ticket_price, Seat_id, Show_id, Customer_id, Admin_id FROM Ticket;

-- Create VIEW THEATRE_DETAILS_EXTEND
CREATE VIEW THEATRE_DETAILS_EXTEND AS
SELECT Theatre_id, Theatre_name, Location, Seat_id, Admin_id FROM Theatre;

-- Create VIEW ADMIN_DETAILS_EXTEND
CREATE VIEW ADMIN_DETAILS_EXTEND AS
SELECT Admin_id, Password FROM Admin;

-- Create VIEW DISCOUNT_DETAILS_EXTEND
CREATE VIEW DISCOUNT_DETAILS_EXTEND AS
SELECT Discount_id, Movie_name, Ticket_price, Ticket_id FROM Discount;

-- Create VIEW SHOW_DETAILS_EXTEND
CREATE VIEW SHOW_DETAILS_EXTEND AS
SELECT Show_id, Start_hours, End_hours, Show_date, Ticket_id FROM Show;