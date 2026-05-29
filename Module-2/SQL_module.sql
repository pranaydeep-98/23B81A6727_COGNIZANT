CREATE DATABASE Cognizant_Database;

use Cognizant_Database;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming','completed','cancelled'),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

CREATE TABLE Sessions(
    session_id Int PRIMARY KEY AUTO_INCREMENT,
    event_id Int,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Registrations(
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
CREATE TABLE Resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    resource_type ENUM('pdf','image','link'),
    resource_url VARCHAR(255) NOT NULL,
    uploaded_at DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

SHOW TABLES;

INSERT INTO Users (full_name, email, city, registration_date)
VALUES
('Alice Johnson', 'alice@example.com', 'New York', '2024-12-01'),
('Bob Smith', 'bob@example.com', 'Los Angeles', '2024-12-05'),
('Charlie Lee', 'charlie@example.com', 'Chicago', '2024-12-10'),
('Diana King', 'diana@example.com', 'New York', '2025-01-15'),
('Ethan Hunt', 'ethan@example.com', 'Los Angeles', '2025-02-01');

INSERT INTO Events (title, description, city, start_date, end_date, status, organizer_id)
VALUES
('Tech Innovators Meetup',
'A meetup for tech enthusiasts.',
'New York',
'2025-06-10 10:00:00',
'2025-06-10 16:00:00',
'upcoming',
1),

('AI & ML Conference',
'Conference on AI and ML advancements.',
'Chicago',
'2025-05-15 09:00:00',
'2025-05-15 17:00:00',
'completed',
3),

('Frontend Development Bootcamp',
'Hands-on training on frontend tech.',
'Los Angeles',
'2025-07-01 10:00:00',
'2025-07-03 16:00:00',
'upcoming',
2);

INSERT INTO Sessions
(event_id, title, speaker_name, start_time, end_time)
VALUES
(1, 'Opening Keynote', 'Dr. Tech',
'2025-06-10 10:00:00',
'2025-06-10 11:00:00'),

(1, 'Future of Web Dev', 'Alice Johnson',
'2025-06-10 11:15:00',
'2025-06-10 12:30:00'),

(2, 'AI in Healthcare', 'Charlie Lee',
'2025-05-15 09:30:00',
'2025-05-15 11:00:00'),

(3, 'Intro to HTML5', 'Bob Smith',
'2025-07-01 10:00:00',
'2025-07-01 12:00:00');

INSERT INTO Registrations
(user_id, event_id, registration_date)
VALUES
(1, 1, '2025-05-01'),
(2, 1, '2025-05-02'),
(3, 2, '2025-04-30'),
(4, 2, '2025-04-28'),
(5, 3, '2025-06-15');

INSERT INTO Feedback
(user_id, event_id, rating, comments, feedback_date)
VALUES
(3, 2, 4, 'Great insights!', '2025-05-16'),
(4, 2, 5, 'Very informative.', '2025-05-16'),
(2, 1, 3, 'Could be better.', '2025-06-11');

INSERT INTO Resources
(event_id, resource_type, resource_url, uploaded_at)
VALUES
(1, 'pdf',
'https://portal.com/resources/tech_meetup_agenda.pdf',
'2025-05-01 10:00:00'),

(2, 'image',
'https://portal.com/resources/ai_poster.jpg',
'2025-04-20 09:00:00'),

(3, 'link',
'https://portal.com/resources/html5_docs',
'2025-06-25 15:00:00');


/* 
Output:
mysql> SOURCE C:/Users/kakke/OneDrive/Desktop/23B81A6727_COGNIZANT/Module-2/SQL_Module.sql;
Query OK, 1 row affected (0.01 sec)

Database changed
Query OK, 0 rows affected (0.04 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

+------------------------------+
| Tables_in_cognizant_database |
+------------------------------+
| events                       |
| feedback                     |
| registrations                |
| resources                    |
| sessions                     |
| users                        |
+------------------------------+
6 rows in set (0.00 sec)

Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0
*/

