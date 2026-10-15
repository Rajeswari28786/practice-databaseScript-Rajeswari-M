CREATE SCHEMA product_details;

USE product_details;

START TRANSACTION;

DROP TABLE IF EXISTS posts, users;

CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NULL DEFAULT 'N/A',
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
     id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     user_id INT NOT NULL,
     title VARCHAR(100) NOT NULL,
     content TEXT NOT NULL,
     created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE products (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email, password) VALUES
    ('alice', 'alice@test.com', 'password123'),
    ('bob', 'bob@test.com', 'password456'),
    ('charlie', 'charlie@test.com', 'password789');

INSERT INTO posts (user_id, title, content) VALUES
     (1, 'First Post', 'This is the content of the first post'),
    (2, 'Second Post', 'This is the content of the second post'),
    (3, 'Third Post', 'This is the content of the third post'),
    (1, 'Fourth Post', 'This is the content of the fourth post'),
    (2, 'Fifth Post', 'This is the content of the fifth post');

    INSERT INTO products
    (product_name, description, price, quantity) VALUES
    ('Laptop', 'Laptop for everyday use', 799.99, 10),
    ('Smartphone', 'Smartphone with advanced features', 599.99, 15),
    ('Headphones', 'Wireless headphones', 49.99, 25),
    ('Keyboard', 'USB computer keyboard', 29.99, 20),
    ('Mouse', 'Wireless computer mouse', 19.99, 30);

COMMIT;
