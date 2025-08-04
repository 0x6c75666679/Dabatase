-- 1. List all Members who have made reservations
SELECT c.full_name, c.member_status, r.reservation_date, r.reservation_type
FROM Customers c
JOIN Reservations r ON c.customer_id = r.customer_id
WHERE c.member_status = 'Member';

-- 2. Get total orders and spending by each customer
SELECT c.full_name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 3. Find the most popular product based on quantity sold
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 1;

-- 4. Find events hosted by a specific staff member (e.g., "Christian Horner")
SELECT e.name, e.date, s.full_name
FROM Events e
JOIN Event_Staff es ON e.event_id = es.event_id
JOIN Staff s ON es.staff_id = s.staff_id
WHERE s.full_name = 'Christian Horner';

-- 5. List all reservations for a specific book (book_id = 1)
SELECT r.reservation_date, r.reservation_time, c.full_name
FROM Reservations r
JOIN Customers c ON r.customer_id = c.customer_id
WHERE r.book_id = 1;

-- 6. Show events that still have available capacity
SELECT e.name, e.date, e.max_capacity,
       (e.max_capacity - COUNT(r.reservation_id)) AS spots_left
FROM Events e
LEFT JOIN Reservations r ON e.event_id = r.event_id
GROUP BY e.event_id
HAVING spots_left > 0;

-- 7. Show orders that contain more than 1 product
SELECT o.order_id, c.full_name, COUNT(oi.order_item_id) AS product_count
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY o.order_id
HAVING product_count > 1;

-- 8. List all payments linked only to reservations (not orders)
SELECT p.payment_id, p.amount, p.payment_method, r.reservation_type
FROM Payments p
JOIN Reservations r ON p.reservation_id = r.reservation_id
WHERE p.order_id IS NULL;

-- 9. Show staff members who worked the most events
SELECT s.full_name, COUNT(es.event_id) AS events_handled
FROM Staff s
JOIN Event_Staff es ON s.staff_id = es.staff_id
GROUP BY s.staff_id
ORDER BY events_handled DESC;

-- 10. Calculate total revenue generated per product
SELECT p.product_name, SUM(oi.quantity * oi.item_price) AS revenue
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY revenue DESC;
