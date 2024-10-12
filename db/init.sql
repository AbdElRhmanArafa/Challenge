CREATE DATABASE IF NOT EXISTS bookapi;
CREATE USER 'app'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON bookapi.* TO 'app'@'%';
FLUSH PRIVILEGES;

USE bookapi;
CREATE TABLE IF NOT EXISTS books (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    published_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO books (title, author, description, published_date) VALUES
('The Great Gatsby', 'Abdelrhman Arafa', 'A classic novel set in the Jazz Age.', '1925-04-10'),
('To Kill a Mockingbird', 'Harper Lee', 'A novel about racial injustice in the Deep South.', '1960-07-11'),
('1984', 'George Orwell', 'A dystopian novel about totalitarianism.', '1949-06-08'),
('Pride and Prejudice', 'Jane Austen', 'A romantic novel about manners and courtship.', '1813-01-28'),
('The Catcher in the Rye', 'J.D. Salinger', 'A novel about teenage alienation.', '1951-07-16');