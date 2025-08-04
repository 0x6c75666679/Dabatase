-- 1. Customers
INSERT INTO Customers (full_name, email, phone_number, member_status) VALUES
('Lewis Hamilton', 'lewis.hamilton@example.com', '9810000001', 'Member'),
('Max Verstappen', 'max.verstappen@example.com', '9810000002', 'Regular'),
('Sebastian Vettel', 'sebastian.vettel@example.com', '9810000003', 'Member'),
('Charles Leclerc', 'charles.leclerc@example.com', '9810000004', 'Regular'),
('Lando Norris', 'lando.norris@example.com', '9810000005', 'Member');

-- 2. Staff
INSERT INTO Staff (full_name, role, email, phone_number) VALUES
('Toto Wolff', 'Manager', 'toto.wolff@example.com', '9810000010'),
('Christian Horner', 'Event Host', 'christian.horner@example.com', '9810000011'),
('Guenther Steiner', 'Barista', 'guenther.steiner@example.com', '9810000012'),
('Andrea Stella', 'Event Host', 'andrea.stella@example.com', '9810000013'),
('Frederic Vasseur', 'Barista', 'frederic.vasseur@example.com', '9810000014');

-- 3. Books
INSERT INTO Books (title, author, genre, availability) VALUES
('The Art of Racing in the Rain', 'Garth Stein', 'Fiction', TRUE),
('Driven', 'R.K. Lilley', 'Romance', TRUE),
('How to Build a Car', 'Adrian Newey', 'Biography', TRUE),
('Formula One: The Champions', 'Maurice Hamilton', 'Sports', FALSE),
('Winning Is Not Enough', 'Jackie Stewart', 'Biography', TRUE);

-- 4. Products
INSERT INTO Products (product_name, category, price, available) VALUES
('Cappuccino', 'Drink', 3.50, TRUE),
('Blueberry Muffin', 'Food', 2.75, TRUE),
('Iced Latte', 'Drink', 3.25, TRUE),
('Vegan Wrap', 'Food', 5.00, FALSE),
('Espresso', 'Drink', 2.50, TRUE);

-- 5. Events
INSERT INTO Events (name, description, date, time, max_capacity) VALUES
('Poetry Night', 'Local poets perform original works', '2025-08-15', '18:00:00', 30),
('Book Signing with Adrian Newey', 'Meet and greet with author Adrian Newey', '2025-08-20', '16:00:00', 20),
('F1 Trivia Night', 'Trivia competition about Formula 1 history', '2025-08-25', '19:00:00', 25);

-- 6. Reservations
INSERT INTO Reservations (customer_id, reservation_type, reservation_date, reservation_time, book_id, event_id) VALUES
(1, 'Book', '2025-08-05', '10:00:00', 1, NULL),
(2, 'Event', '2025-08-10', '15:45:00', NULL, 1),
(3, 'Book', '2025-08-06', '11:30:00', 2, NULL),
(4, 'Event', '2025-08-12', '17:30:00', NULL, 2),
(5, 'Event', '2025-08-15', '16:45:00', NULL, 3);

-- 7. Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-08-01', 9.00),
(2, '2025-08-03', 8.25),
(3, '2025-08-05', 5.00),
(4, '2025-08-06', 6.25),
(5, '2025-08-08', 6.00);

-- 8. Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, item_price) VALUES
-- Order 1: Cappuccino + 2x Blueberry Muffin
(1, 1, 1, 3.50),
(1, 2, 2, 2.75),

-- Order 2: Iced Latte + Vegan Wrap
(2, 3, 1, 3.25),
(2, 4, 1, 5.00),

-- Order 3: 2x Espresso
(3, 5, 2, 2.50),

-- Order 4: Cappuccino + Blueberry Muffin
(4, 1, 1, 3.50),
(4, 2, 1, 2.75),

-- Order 5: Iced Latte + Blueberry Muffin
(5, 3, 1, 3.25),
(5, 2, 1, 2.75);

-- 9. Payments
INSERT INTO Payments (amount, payment_method, payment_date, reservation_id, order_id) VALUES
(0.00, 'Card', '2025-08-05', 1, NULL),
(0.00, 'Online', '2025-08-10', 2, NULL),
(5.00, 'Cash', '2025-08-05', NULL, 3),
(6.25, 'Online', '2025-08-06', NULL, 4),
(6.00, 'Card', '2025-08-08', NULL, 5);

-- 10. Event_Staff
INSERT INTO Event_Staff (event_id, staff_id, role) VALUES
(1, 2, 'Host'),      -- Poetry Night with Horner
(2, 4, 'Host'),      -- Book Signing with Stella
(2, 1, 'Manager'),   -- Book Signing overseen by Toto
(3, 4, 'Host'),      -- F1 Trivia Night hosted by Stella
(3, 2, 'Support');   -- Horner as support for Trivia Night
