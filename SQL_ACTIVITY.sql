-- Creating tables

CREATE TABLE authors
(
   authorID INTEGER PRIMARY KEY AUTOINCREMENT,
   firstName varchar2(15),
   lastName varchar2(20),
   nationality TEXT
);

CREATE TABLE books
(
   bookID INTEGER PRIMARY KEY AUTOINCREMENT,
   title varchar2(80),
   description TEXT,
   Author_ID INTEGER,
   FOREIGN KEY (Author_ID) REFERENCES authors(authorID)
);

-- Inserting data 

INSERT INTO authors(firstName, lastName, nationality) VALUES
('Nkateko', 'Mathebula', 'South African'),
('Sipho', 'Ngobeni', 'South African'),
('Granny', 'Mathonsi', 'HongKong'),
('Respect', 'Ngobeni', 'South African'),
('Cecil', 'Sithole', 'HongKong');

INSERT INTO books (title, description, Author_ID) VALUES
('Nothing but the truth', 'A childhood experience', '1'),
('A road less travelled', 'Making my own decisions', '2'),
('An angry bird', 'A drink to remember', '3'),
('PowerBook 2', 'Money and drugs', '4'),
('C++ Programming', 'Understanding classes', '5'),
('JavaScript programming', 'Perfecting the front-end', '3'),
('Python', 'Code with the best', '3'),
('The Luncheon', 'Dinner with a stranger', '2'),
('The deceiver', 'Only lies will set you free', '3'),
('Tell the truth', 'Love and honesty', '3');

-- Queries

Select COUNT(*) AS SumOfBooks
From books;

Select a.firstName, a.lastName, COUNT(b.bookID) AS authorBookCount
From books b
Join authors a ON a.authorID = b.Author_ID
Group By a.authorID
Order By authorBookCount DESC
LIMIT 1;



Select a.nationality, COUNT(b.bookID) AS theNumberOfBooks
From books b
Join authors a ON b.Author_ID = a.authorID
Group By a.nationality
Order By theNumberOfBooks;


















