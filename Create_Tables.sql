-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    member_status ENUM('Regular', 'Member') DEFAULT 'Regular'
);

-- 2. Staff Table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15)
);

-- 3. Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    availability BOOLEAN DEFAULT TRUE
);

-- 4. Products Table (Menu items: drinks, food, etc.)
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category ENUM('Food', 'Drink', 'Other') NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    available BOOLEAN DEFAULT TRUE
);

-- 5. Events Table
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    date DATE NOT NULL,
    time TIME NOT NULL,
    max_capacity INT
);

-- 6. Reservations Table
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    reservation_type ENUM('Book', 'Event') NOT NULL,
    reservation_date DATE NOT NULL,
    reservation_time TIME NOT NULL,
    book_id INT,
    event_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- 7. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(8,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 8. Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    item_price DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 9. Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(8,2) NOT NULL,
    payment_method ENUM('Cash', 'Card', 'Online') NOT NULL,
    payment_date DATE NOT NULL,
    reservation_id INT UNIQUE,
    order_id INT UNIQUE,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 10. Event_Staff (Join Table for Many-to-Many)
CREATE TABLE Event_Staff (
    event_staff_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT NOT NULL,
    staff_id INT NOT NULL,
    role VARCHAR(50),
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    UNIQUE (event_id, staff_id)
);
