

-- Authors table

CREATE TABLE authors
(
   AuthorID NUMBER PRIMARY KEY(10),
   firstName varchar(15),
   lastName varchar(20),
   nationality ENUM('South Africa', 'HongKong')
);



-- Books table

CREATE TABLE books
(
   BookID NUMBER(10) PRIMARY KEY,
   title varchar(80),
   description TEXT,
   AuthorID INT,
   FOREIGN KEY (AuthorID) REFERENCES authors(AuthorID)
);

-- INSER DATA INTO AUTHORS TABLE

INSERT INTO authors(firstName, lastName, nationality) VALUES
('Nkateko', 'Mathebula', 'South African'),
('Sipho', 'Ngobeni', 'South African'),
('Granny', 'Mathonsi', 'HongKong'),
('Respect', 'Ngobeni', 'South African'),
('Cecil', 'Sithole', 'HongKong');

-- INSER DATA INTO BOOKS TABLE

INSERT INTO books (title, description, AuthorsID) VALUES
('Nothing but the truth', 'A childhood experience', '1'),
('A road less travelled', 'Making my own decisions', '2'),
('An angry bird', 'A drink to remember', '3'),
('PowerBook 2', 'Money and drugs', '4'),
('C++ Programming', 'Understanding classes', '5'),
('JavaScript programming', 'Perfecting the front-end', '3'),
('Python', 'Code with the best', '3'),
('The Luncheon', 'Dinner with a stranger', '2'),
('The deceiver', 'Only lies will set you free', '1'),
('Tell the truth', 'Love and honesty', '3');


--QUERIES

Select COUNT(*) AS SumOfBooks
From books;

Select a.firstName, a.lastName, COUNT(b.BookID) AS authorBookCount
From authors a;
Left Join books b ON a.AuthorID = b.AuthorID
Group By a.AuthorID
Order By authorBookCount DESC
LIMIT 1;



Select a.nationality, COUNT(b.BookID) AS TheNumberOfBooks
From authors a
Join books b ON a.AuthorID = b.AuthorID
Group By a.nationality;


























