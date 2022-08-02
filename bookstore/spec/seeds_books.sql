TRUNCATE TABLE books RESTART IDENTITY;

INSERT INTO books (title, author_name) VALUES ('book1', 'i wrote book1');
INSERT INTO books (title, author_name) VALUES ('book2', 'i wrote book2');