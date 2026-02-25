-- ============================================================
--   E-COMMERCE & ONLINE SHOPPING PLATFORM
--   Comprehensive INSERT Data for All 6 Tables
--   Designed for 110-Question SQL Assignment
-- ============================================================
create database e_commerce_db
use e_commerce_db

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE,
    gender CHAR(1),
    CHECK (gender IN ('M', 'F', 'O'))
)
-- ============================================================
-- TABLE 1: customers  (30 records)
-- ============================================================

INSERT INTO customers (customer_id, full_name, email, phone, city, state, registration_date, gender) VALUES
(1,  'Aarav Sharma',      'aarav.sharma@gmail.com',     '9876543210', 'Mumbai',      'Maharashtra',  '2021-03-15', 'M'),
(2,  'Priya Mehta',       'priya.mehta@yahoo.com',      '9823456781', 'Delhi',       'Delhi',        '2021-06-20', 'F'),
(3,  'Rahul Verma',       'rahul.verma@gmail.com',      '9712345682', 'Bangalore',   'Karnataka',    '2021-09-10', 'M'),
(4,  'Sneha Patel',       'sneha.patel@gmail.com',      '9634561893', 'Ahmedabad',   'Gujarat',      '2021-12-05', 'F'),
(5,  'Vikram Singh',      'vikram.singh@outlook.com',   '9545678902', 'Chennai',     'Tamil Nadu',   '2022-01-18', 'M'),
(6,  'Ananya Iyer',       'ananya.iyer@gmail.com',      '9456789015', 'Hyderabad',   'Telangana',    '2022-03-22', 'F'),
(7,  'Karan Kapoor',      'karan.kapoor@gmail.com',     '9367890126', 'Pune',        'Maharashtra',  '2022-05-14', 'M'),
(8,  'Divya Nair',        'divya.nair@gmail.com',       '9278901237', 'Kochi',       'Kerala',       '2022-07-08', 'F'),
(9,  'Rohan Desai',       'rohan.desai@gmail.com',      '9189012348', 'Mumbai',      'Maharashtra',  '2022-09-03', 'M'),
(10, 'Meera Krishnan',    'meera.k@gmail.com',          '9090123459', 'Bangalore',   'Karnataka',    '2022-11-25', 'F'),
(11, 'Arjun Reddy',       'arjun.reddy@gmail.com',      '9901234560', 'Hyderabad',   'Telangana',    '2023-01-08', 'M'),
(12, 'Nisha Agarwal',     'nisha.agarwal@gmail.com',    '9812345671', 'Jaipur',      'Rajasthan',    '2023-02-14', 'F'),
(13, 'Siddharth Joshi',   'siddharth.j@gmail.com',      '9723456782', 'Pune',        'Maharashtra',  '2023-03-20', 'M'),
(14, 'Lakshmi Rao',       'lakshmi.rao@gmail.com',      '9634567893', 'Chennai',     'Tamil Nadu',   '2023-05-11', 'F'),
(15, 'Amit Trivedi',      'amit.trivedi@gmail.com',     '9545678904', 'Delhi',       'Delhi',        '2023-06-18', 'M'),

(16, 'Pooja Gupta',       'pooja.gupta@yahoo.com',      '9456789016', 'Lucknow',     'Uttar Pradesh','2023-07-25', 'F'),
(17, 'Manish Tiwari',     'manish.t@gmail.com',         '9367890127', 'Kolkata',     'West Bengal',  '2023-08-30', 'M'),
(18, 'Riya Malhotra',     'riya.malhotra@gmail.com',    '9278901238', 'Chandigarh',  'Punjab',       '2023-09-15', 'F'),
(19, 'Suresh Babu',       'suresh.babu@gmail.com',      '9189012349', 'Bangalore',   'Karnataka',    '2023-10-22', 'M'),
(20, 'Kavitha Menon',     'kavitha.menon@gmail.com',    '9090123460', 'Kochi',       'Kerala',       '2023-11-28', 'F'),

(21, 'Deepak Kumar',      'deepak.kumar@gmail.com',     '9901234570', 'Patna',       'Bihar',        '2023-12-10', 'M'),
(22, 'Swati Jain',        'swati.jain@yahoo.com',       '9812345681', 'Indore',      'Madhya Pradesh','2024-01-05', 'F'),
(23, 'Rajesh Pillai',     'rajesh.pillai@gmail.com',    '9723456792', 'Mumbai',      'Maharashtra',  '2024-01-18', 'M'),
(24, 'Neha Kulkarni',     'neha.kulkarni@gmail.com',    '9634567403', 'Pune',        'Maharashtra',  '2024-02-08', 'F'),
(25, 'Aditya Saxena',     'aditya.saxena@outlook.com',  '9545678914', 'Delhi',       'Delhi',        '2024-02-22', 'M'),
(26, 'Shruti Yadav',      'shruti.yadav@gmail.com',     '9456789025', 'Noida',       'Uttar Pradesh','2024-03-10', 'F'),
(27, 'Varun Malhotra',    'varun.malhotra@gmail.com',   '9367890136', 'Gurgaon',     'Haryana',      '2024-03-20', 'M'),
(28, 'Anjali Chopra',     'anjali.chopra@yahoo.com',    '9278901247', 'Ludhiana',    'Punjab',       '2024-04-05', 'F'),
(29, 'NoOrderCustomer',   'noorder@gmail.com',          '9189012358', 'Surat',       'Gujarat',      '2019-05-10', 'M'),
(30, 'InactiveCustomer',  'inactive@gmail.com',         '9090123469', 'Vadodara',    'Gujarat',      '2019-08-15', 'F');

-- ============================================================
-- TABLE 2: categories  (15 records — with sub-categories)
-- ============================================================
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    parent_category_id INT NULL,
    description TEXT NULL,
    
    CONSTRAINT FK_categories_parent
    FOREIGN KEY (parent_category_id)
    REFERENCES categories(category_id)
)


INSERT INTO categories (category_id, category_name, parent_category_id, description) VALUES
(1,  'Electronics',         NULL, 'Electronic gadgets and devices'),
(2,  'Fashion',             NULL, 'Clothing and accessories'),
(3,  'Home & Kitchen',      NULL, 'Home appliances and kitchen tools'),
(4,  'Books',               NULL, 'Educational and recreational books'),
(5,  'Sports & Fitness',    NULL, 'Sports equipment and fitness gear'),
(6,  'Mobile Phones',       1,    'Smartphones and accessories'),
(7,  'Laptops',             1,    'Laptops and computers'),
(8,  'Cameras',             1,    'Digital cameras and photography'),
(9,  'Men Clothing',        2,    'Shirts, trousers, and menswear'),
(10, 'Women Clothing',      2,    'Kurtas, sarees, and womenswear'),
(11, 'Footwear',            2,    'Shoes and sandals'),
(12, 'Kitchen Appliances',  3,    'Mixers, cookers, and appliances'),
(13, 'Furniture',           3,    'Tables, chairs, sofas'),
(14, 'Fiction Books',       4,    'Novels and story books'),
(15, 'Gym Equipment',       5,    'Dumbbells, treadmills, yoga mats');


-- ============================================================
-- TABLE 3: products  (40 records)
-- ============================================================

CREATE TABLE products (
    product_id INT  PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category_id INT,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock_quantity INT NOT NULL DEFAULT 0,
    brand VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0.0 AND 5.0),

    CONSTRAINT FK_products_category
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
)

--ALTER TABLE products
--ADD CONSTRAINT FK_products_category
--FOREIGN KEY (category_id)
--REFERENCES categories(category_id)

INSERT INTO products (product_id, product_name, category_id, price, stock_quantity, brand, rating) VALUES
(1,  'Samsung Galaxy S23',           6,  74999.00,  50, 'Samsung',     4.5),
(2,  'Apple iPhone 15',              6, 109999.00,  30, 'Apple',       4.8),
(3,  'OnePlus 12R',                  6,  39999.00,  80, 'OnePlus',     4.3),
(4,  'Redmi Note 13 Pro',            6,  24999.00, 120, 'Xiaomi',      4.2),
(5,  'Dell Inspiron 15',             7,  65000.00,  25, 'Dell',        4.2),
(6,  'HP Pavilion x360',             7,  72000.00,  20, 'HP',          4.1),
(7,  'Lenovo IdeaPad Slim 5',        7,  58000.00,  35, 'Lenovo',      4.4),
(8,  'Canon EOS 1500D',              8,  45000.00,  15, 'Canon',       4.6),
(9,  'Nikon D3500',                  8,  42000.00,  12, 'Nikon',       4.5),
(10, 'Raymond Formal Shirt',         9,   1499.00, 200, 'Raymond',     4.0),
(11, 'Levis 511 Slim Jeans',         9,   2999.00, 150, 'Levis',     4.3),
(12, 'Fabindia Cotton Kurta',       10,   1299.00, 180, 'Fabindia',    4.2),
(13, 'W Women Anarkali Kurta',      10,   1799.00, 120, 'W',           4.1),
(14, 'Nike Running Shoes',          11,   5999.00,  90, 'Nike',        4.7),
(15, 'Adidas Ultraboost',           11,   8999.00,  60, 'Adidas',      4.6),
(16, 'Prestige Mixer Grinder',      12,   4500.00,  60, 'Prestige',    4.3),
(17, 'Instant Pot Duo 7-in-1',      12,   9999.00,  40, 'Instant Pot', 4.6),
(18, 'Study Table Wooden',          13,   8500.00,  30, 'DuPure',      4.0),
(19, 'Office Chair Ergonomic',      13,  12000.00,  25, 'Featherlite', 4.4),
(20, 'Physics NCERT Class 12',      14,    350.00, 500, 'NCERT',       4.7),
(21, 'Data Structures by Cormen',   14,    799.00, 300, 'MIT Press',   4.8),
(22, 'Harry Potter Collection',     14,   2499.00, 150, 'Bloomsbury',  4.9),
(23, 'Dumbbell Set 20kg',           15,   3500.00,  75, 'Kore',        4.2),
(24, 'Yoga Mat Anti-Slip',          15,    899.00, 200, 'Boldfit',     4.4),
(25, 'Treadmill Motorized',         15,  45000.00,  10, 'Powermax',    4.5),
(26, 'Boat Airdopes 141',            6,   1499.00, 300, 'Boat',        4.1),
(27, 'JBL Bluetooth Speaker',        1,   5999.00,  85, 'JBL',         4.6),
(28, 'Sony Headphones WH-1000XM5',   1,  29999.00,  40, 'Sony',        4.8),
(29, 'Puma Sports T-Shirt',          9,    999.00, 250, 'Puma',        4.0),
(30, 'Reebok Track Pants',           9,   1499.00, 180, 'Reebok',      4.1),
(31, 'Fastrack Analog Watch',        2,   1999.00, 100, 'Fastrack',    4.2),
(32, 'Titan Smart Watch',            2,  12999.00,  50, 'Titan',       4.5),
(33, 'Philips Air Fryer',           12,   8999.00,  45, 'Philips',     4.7),
(34, 'LG Microwave Oven',           12,  11000.00,  30, 'LG',          4.4),
(35, 'Sofa Set 3 Seater',           13,  35000.00,  15, 'Urban Ladder',4.3),
(36, 'Dining Table 6 Seater',       13,  28000.00,  20, 'Pepperfry',   4.2),
(37, 'The Alchemist Novel',         14,    399.00, 400, 'HarperCollins',4.8),
(38, 'Rich Dad Poor Dad',           14,    499.00, 350, 'Penguin',     4.7),
(39, 'Resistance Bands Set',        15,    799.00, 150, 'Amazon Basics',4.3),
(40, 'OutOfStock Product',           5,   1999.00,   0, 'Unavailable', 0.0);


-- ============================================================
-- TABLE 4: orders  (35 records)
-- ============================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    delivery_date DATE NULL,
    order_status VARCHAR(20),
    shipping_address VARCHAR(255) NOT NULL,

    CONSTRAINT FK_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    CONSTRAINT CHK_order_status
    CHECK (order_status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
)
drop table orders

INSERT INTO orders (order_id, customer_id, order_date, delivery_date, order_status, shipping_address) VALUES
(1,  1,  '2024-01-05 10:30:00', '2024-01-08', 'Delivered',  'Flat 201, Andheri West, Mumbai - 400053'),
(2,  2,  '2024-01-10 14:15:00', '2024-01-13', 'Delivered',  'A-12, Karol Bagh, Delhi - 110005'),
(3,  3,  '2024-01-15 09:00:00', '2024-01-18', 'Delivered',  '45, Koramangala, Bangalore - 560034'),
(4,  4,  '2024-01-20 16:45:00', '2024-01-24', 'Delivered',  'B-7, Navrangpura, Ahmedabad - 380009'),
(5,  5,  '2024-02-01 11:00:00', '2024-02-04', 'Delivered',  '32, T Nagar, Chennai - 600017'),
(6,  6,  '2024-02-05 13:30:00', '2024-02-09', 'Shipped',    '10, Banjara Hills, Hyderabad - 500034'),
(7,  7,  '2024-02-10 08:45:00', '2024-02-14', 'Delivered',  '22, Kothrud, Pune - 411038'),
(8,  8,  '2024-02-15 17:00:00', NULL,          'Cancelled',  '5, MG Road, Kochi - 682016'),
(9,  9,  '2024-02-18 10:15:00', '2024-02-22', 'Delivered',  'Flat 8, Dadar, Mumbai - 400014'),
(10, 10, '2024-02-22 12:30:00', '2024-02-26', 'Delivered',  '88, Indiranagar, Bangalore - 560038'),
(11, 1,  '2024-03-01 09:30:00', '2024-03-05', 'Delivered',  'Flat 201, Andheri West, Mumbai - 400053'),
(12, 2,  '2024-03-05 15:00:00', NULL,          'Pending',    'A-12, Karol Bagh, Delhi - 110005'),
(13, 11, '2024-03-08 11:00:00', '2024-03-12', 'Delivered',  '14, Jubilee Hills, Hyderabad - 500033'),
(14, 12, '2024-03-10 14:45:00', '2024-03-14', 'Delivered',  'C-9, Vaishali Nagar, Jaipur - 302021'),
(15, 3,  '2024-03-12 10:00:00', NULL,          'Shipped',    '45, Koramangala, Bangalore - 560034'),
(16, 13, '2024-03-15 16:30:00', '2024-03-19', 'Delivered',  '18, Shivajinagar, Pune - 411005'),
(17, 5,  '2024-03-18 09:00:00', NULL,          'Pending',    '32, T Nagar, Chennai - 600017'),
(18, 14, '2024-03-20 13:00:00', '2024-03-24', 'Delivered',  '7, Anna Nagar, Chennai - 600040'),
(19, 15, '2024-03-22 10:30:00', NULL,          'Cancelled',  'D-5, Lajpat Nagar, Delhi - 110024'),
(20, 19, '2024-03-25 14:00:00', '2024-03-29', 'Delivered',  '33, Whitefield, Bangalore - 560066'),
(21, 1,  '2024-04-01 11:00:00', '2024-04-05', 'Delivered',  'Flat 201, Andheri West, Mumbai - 400053'),
(22, 16, '2024-04-03 10:00:00', '2024-04-07', 'Delivered',  '45, Gomti Nagar, Lucknow - 226010'),
(23, 17, '2024-04-05 14:30:00', '2024-04-09', 'Delivered',  '12, Salt Lake, Kolkata - 700091'),
(24, 18, '2024-04-08 09:30:00', NULL,          'Shipped',    '8, Sector 17, Chandigarh - 160017'),
(25, 20, '2024-04-10 16:00:00', '2024-04-14', 'Delivered',  '22, Marine Drive, Kochi - 682031'),
(26, 4,  '2024-04-12 11:30:00', '2024-04-16', 'Delivered',  'B-7, Navrangpura, Ahmedabad - 380009'),
(27, 21, '2024-04-15 10:00:00', '2024-04-19', 'Delivered',  '5, Gandhi Maidan, Patna - 800001'),
(28, 22, '2024-04-18 13:00:00', NULL,          'Pending',    '18, Vijay Nagar, Indore - 452010'),
(29, 23, '2024-04-20 15:30:00', '2024-04-24', 'Delivered',  '88, Bandra West, Mumbai - 400050'),
(30, 24, '2024-04-22 09:00:00', '2024-04-26', 'Delivered',  '10, Pimpri, Pune - 411018'),
(31, 6,  '2024-04-25 12:00:00', '2024-04-29', 'Delivered',  '10, Banjara Hills, Hyderabad - 500034'),
(32, 25, '2023-05-10 10:00:00', '2023-05-14', 'Cancelled',  'G-12, Connaught Place, Delhi - 110001'),
(33, 11, '2024-04-28 14:00:00', NULL,          'Shipped',    '14, Jubilee Hills, Hyderabad - 500033'),
(34, 26, '2024-05-01 11:00:00', '2024-05-05', 'Delivered',  '22, Sector 62, Noida - 201301'),
(35, 27, '2024-05-03 10:30:00', NULL,          'Pending',    '15, DLF Phase 2, Gurgaon - 122002');
-- Note: customer_id 29 and 30 have no orders


-- ============================================================
-- TABLE 5: order_items  (70 records)
-- ============================================================
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(4,2) DEFAULT 0.00,

    CONSTRAINT FK_order_items_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    CONSTRAINT FK_order_items_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
)


INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price, discount) VALUES
(1,  1,  2,  1, 109999.00, 5.00),
(2,  1,  26, 2,   1499.00, 0.00),
(3,  1,  14, 1,   5999.00, 0.00),
(4,  2,  10, 3,   1499.00, 10.00),
(5,  2,  11, 2,   2999.00, 5.00),
(6,  3,  5,  1,  65000.00, 8.00),
(7,  3,  21, 2,    799.00, 0.00),
(8,  4,  12, 3,   1299.00, 5.00),
(9,  4,  13, 2,   1799.00, 0.00),
(10, 5,  1,  1,  74999.00, 3.00),
(11, 5,  24, 1,    899.00, 0.00),
(12, 6,  17, 1,   9999.00, 10.00),
(13, 6,  16, 1,   4500.00, 5.00),
(14, 7,  20, 5,    350.00, 0.00),
(15, 7,  37, 3,    399.00, 0.00),
(16, 8,  3,  1,  39999.00, 0.00),
(17, 9,  7,  1,  58000.00, 7.00),
(18, 9,  23, 1,   3500.00, 0.00),
(19, 10, 6,  1,  72000.00, 5.00),
(20, 11, 14, 2,   5999.00, 0.00),
(21, 11, 24, 1,    899.00, 10.00),
(22, 12, 2,  1, 109999.00, 5.00),
(23, 13, 1,  1,  74999.00, 0.00),
(24, 13, 26, 1,   1499.00, 5.00),
(25, 14, 10, 4,   1499.00, 10.00),
(26, 15, 5,  1,  65000.00, 0.00),
(27, 16, 21, 2,    799.00, 0.00),
(28, 16, 38, 1,    499.00, 0.00),
(29, 17, 16, 1,   4500.00, 5.00),
(30, 18, 12, 2,   1299.00, 0.00),
(31, 20, 7,  1,  58000.00, 8.00),
(32, 21, 28, 1,  29999.00, 5.00),
(33, 21, 27, 1,   5999.00, 0.00),
(34, 22, 4,  2,  24999.00, 10.00),
(35, 22, 30, 1,   1499.00, 0.00),
(36, 23, 8,  1,  45000.00, 5.00),
(37, 23, 9,  1,  42000.00, 5.00),
(38, 24, 15, 1,   8999.00, 0.00),
(39, 25, 33, 1,   8999.00, 10.00),
(40, 26, 3,  1,  39999.00, 5.00),
(41, 27, 22, 1,   2499.00, 0.00),
(42, 28, 31, 2,   1999.00, 0.00),
(43, 29, 32, 1,  12999.00, 8.00),
(44, 30, 19, 1,  12000.00, 5.00),
(45, 31, 34, 1,  11000.00, 0.00),
(46, 33, 25, 1,  45000.00, 10.00),
(47, 34, 35, 1,  35000.00, 5.00),
(48, 35, 36, 1,  28000.00, 0.00),
(49, 1,  29, 2,    999.00, 0.00),
(50, 3,  10, 1,   1499.00, 0.00),
(51, 5,  11, 1,   2999.00, 5.00),
(52, 9,  15, 1,   8999.00, 10.00),
(53, 10, 27, 1,   5999.00, 0.00),
(54, 13, 14, 1,   5999.00, 0.00),
(55, 16, 39, 2,    799.00, 0.00),
(56, 18, 24, 2,    899.00, 0.00),
(57, 20, 23, 1,   3500.00, 0.00),
(58, 21, 26, 3,   1499.00, 10.00),
(59, 22, 29, 3,    999.00, 0.00),
(60, 23, 20, 10,   350.00, 0.00),
(61, 25, 16, 1,   4500.00, 5.00),
(62, 26, 13, 1,   1799.00, 0.00),
(63, 27, 37, 2,    399.00, 0.00),
(64, 29, 6,  1,  72000.00, 12.00),
(65, 30, 18, 1,   8500.00, 0.00),
(66, 31, 17, 1,   9999.00, 8.00),
(67, 34, 19, 1,  12000.00, 10.00),
(68, 11, 15, 1,   8999.00, 5.00),
(69, 13, 23, 1,   3500.00, 0.00),
(70, 20, 33, 1,   8999.00, 5.00);
-- Note: Some products have never been ordered (useful for LEFT JOIN)


-- ============================================================
-- TABLE 6: payments  (30 records — orders 8, 19, 32 cancelled)
-- ============================================================

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    payment_date DATETIME NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),

    CONSTRAINT FK_payments_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    CONSTRAINT CHK_payment_method
    CHECK (payment_method IN ('UPI', 'Card', 'NetBanking', 'COD', 'Wallet')),

    CONSTRAINT CHK_payment_status
    CHECK (payment_status IN ('Success', 'Failed', 'Refunded', 'Pending'))
)

INSERT INTO payments (payment_id, order_id, payment_date, amount, payment_method, payment_status) VALUES
(1,  1,  '2024-01-05 10:35:00', 120495.10, 'Card',       'Success'),
(2,  2,  '2024-01-10 14:18:00',   9343.65, 'UPI',        'Success'),
(3,  3,  '2024-01-15 09:05:00',  62268.00, 'NetBanking', 'Success'),
(4,  4,  '2024-01-20 16:50:00',   7295.05, 'UPI',        'Success'),
(5,  5,  '2024-02-01 11:05:00',  78646.03, 'Card',       'Success'),
(6,  6,  '2024-02-05 13:35:00',  13724.50, 'Wallet',     'Success'),
(7,  7,  '2024-02-10 08:50:00',   2947.00, 'COD',        'Success'),
(8,  9,  '2024-02-18 10:20:00',  64809.00, 'Card',       'Success'),
(9,  10, '2024-02-22 12:35:00',  74399.00, 'UPI',        'Success'),
(10, 11, '2024-03-01 09:35:00',  20546.10, 'UPI',        'Success'),
(11, 12, '2024-03-05 15:05:00', 104499.05, 'Card',       'Pending'),
(12, 13, '2024-03-08 11:05:00',  80497.05, 'UPI',        'Success'),
(13, 14, '2024-03-10 14:50:00',   5396.40, 'COD',        'Success'),
(14, 15, '2024-03-12 10:05:00',  65000.00, 'NetBanking', 'Success'),
(15, 16, '2024-03-15 16:35:00',   2097.00, 'UPI',        'Success'),
(16, 17, '2024-03-18 09:05:00',   4275.00, 'Wallet',     'Pending'),
(17, 18, '2024-03-20 13:05:00',   4396.00, 'UPI',        'Success'),
(18, 20, '2024-03-25 14:05:00',  66384.00, 'Card',       'Success'),
(19, 21, '2024-04-01 11:05:00',  37557.30, 'Card',       'Success'),
(20, 22, '2024-04-03 10:05:00',  48496.10, 'UPI',        'Success'),
(21, 23, '2024-04-05 14:35:00',  86150.00, 'Card',       'Success'),
(22, 24, '2024-04-08 09:35:00',   8999.00, 'Wallet',     'Pending'),
(23, 25, '2024-04-10 16:05:00',  12374.05, 'UPI',        'Success'),
(24, 26, '2024-04-12 11:35:00',  39798.05, 'Card',       'Success'),
(25, 27, '2024-04-15 10:05:00',   2499.00, 'COD',        'Success'),
(26, 28, '2024-04-18 13:05:00',   3998.00, 'UPI',        'Pending'),
(27, 29, '2024-04-20 15:35:00',  75351.08, 'Card',       'Success'),
(28, 30, '2024-04-22 09:05:00',  19900.00, 'NetBanking', 'Success'),
(29, 31, '2024-04-25 12:05:00',  10119.08, 'UPI',        'Success'),
(30, 33, '2024-04-28 14:05:00',  40500.00, 'Card',       'Pending');
-- Note: Orders 8, 19, 32, 34, 35 have no payment records


-- ============================================================
-- END OF INSERT STATEMENTS
-- Total Records Inserted:
--   customers    : 30 rows (2 with no orders)
--   categories   : 15 rows (includes sub-categories)
--   products     : 40 rows (1 out of stock, some never ordered)
--   orders       : 35 rows (Delivered, Shipped, Pending, Cancelled)
--   order_items  : 70 rows
--   payments     : 30 rows (Success, Pending, Failed)
--
-- Data Designed for:
--   - JOINS: Complete relationships with some unmatched records
--   - GROUP BY: Multiple orders per customer, products per category
--   - AGGREGATION: Revenue calculations, averages, counts
--   - SUBQUERIES: Price comparisons, nested filters
--   - LEFT JOIN: Customers with no orders, products never ordered
-- ============================================================


--Q1. Insert 3 customers into the customers table with realistic data for all columns.
INSERT INTO customers (customer_id, full_name, email, phone, city, state, registration_date, gender) VALUES
(31,  'Neha Sharma',      'neha.sharma@gmail.com',     '98764546266', 'Mumbai',      'Maharashtra',  '2021-02-15', 'F'),
(32,  'Anjali Mehta',      'anjali.mehta@yahoo.com',      '9823418888', 'Delhi',       'Delhi',        '2021-08-10', 'F'),
(33,  'Sodhi Verma',       'sodhi.verma@gmail.com',      '9712348989', 'Bangalore',   'Karnataka',    '2021-10-10', 'M')

--Q2. Insert 2 categories: 'Electronics' and 'Fashion' with NULL parent_category_id.
    INSERT INTO categories (category_id, category_name, parent_category_id, description) VALUES
    (1,  'Electronics',         NULL, 'Electronic gadgets and devices'),
    (2,  'Fashion',             NULL, 'Clothing and accessories')

--Q3. Insert 5 products with different categories, brands, prices, and stock quantities.
    INSERT INTO products (product_id, product_name, category_id, price, stock_quantity, brand, rating) VALUES
    (41,  'Samsung Galaxy S23',           10,  74999.00,  50, 'Samsung',     4.5),
    (42,  'Apple iPhone 15',              4, 109999.00,  30, 'Apple',       4.8),
    (43,  'OnePlus 12R',                  9,  39999.00,  80, 'OnePlus',     4.3),
    (44,  'Redmi Note 13 Pro',            5,  24999.00, 120, 'Xiaomi',      4.2),
    (45,  'Dell Inspiron 15',             10,  65000.00,  25, 'Dell',        4.2)

--Q4. Insert 3 orders for different customers with order_status as 'Pending', 'Shipped', and 'Delivered'.
    INSERT INTO orders (order_id, customer_id, order_date, delivery_date, order_status, shipping_address) VALUES
    (36,  1,  '2024-01-05 10:30:00', '2024-01-08', 'Delivered',  'Flat 201, Andheri West, Mumbai - 400053'),
    (37,  2,  '2024-01-10 14:15:00', '2024-01-13', 'Pending',  'A-12, Karol Bagh, Delhi - 110005'),
    (38,  3,  '2024-01-15 09:00:00', '2024-01-18', 'Shipped',  '45, Koramangala, Bangalore - 560034')


--Q5. Insert 4 order_items records for order_id = 1 with different products and quantities.

--Q6. Insert 2 payment records with payment_status 'Success' and payment_method 'UPI' and 'Card'.

--Q7. Update the price of all products in category_id = 2 by increasing it by 15%.

--Q8. Update the order_status to 'Delivered' for all orders where order_status is 'Shipped' and order_date is before '2024-01-01'.
--Q9. Update the stock_quantity of product_id = 5 by reducing it by 10 units.
--Q10. Update the email of customer_id = 3 to 'newemail@example.com'.
--Q11. Delete all orders where order_status = 'Cancelled' and order_date is before '2023-06-01'.
--Q12. Delete all order_items where quantity is less than 1.
--Q13. Delete all products where stock_quantity is 0 and category_id = 5.
--Q14. Delete all payments where payment_status = 'Failed'.
--Q15. Delete all customers who registered before '2020-01-01' and have made no orders.

--PART B: TCL (Transaction Control Language) — 5 Questions

--Q16. Write a transaction that inserts a new order and commits it only if the customer_id exists in the customers table.

--Q17. Start a transaction, update the stock_quantity of product_id = 10 to 50, then rollback the transaction.
--Q18. Create a savepoint named 'before_delete', delete all orders with order_status = 'Cancelled', then rollback to the savepoint.
--Q19. Write a transaction that transfers 500 coins from one customer to another (simulate wallet transfer). Use COMMIT if successful.
--Q20. Demonstrate the use of BEGIN, COMMIT, and ROLLBACK in a single transaction involving INSERT and UPDATE operations.


--PART C: Operators (Arithmetic, Comparison, Logical, Special) — 10 Questions

--Q21. Find all products where price is greater than 1000 and less than or equal to 5000.
Select * from products where price > 1000 AND price <= 5000

--Q22. Retrieve all orders where order_status is NOT 'Cancelled'.
select * from orders where order_status <> 'Cancelled'

--Q23. List all customers whose city is either 'Mumbai' OR 'Delhi'.
select * from customers where city = 'Mumbai' OR city = 'Delhi'

--Q24. Find all products where stock_quantity is between 10 and 100 (inclusive).
select * from products where stock_quantity between 10 AND 100 

--Q25. Display all customers whose email ends with '@gmail.com'.
select * from customers where email LIKE '%@gmail.com'

--Q26. Retrieve all products where brand starts with 'Sam'.
select * 
from products 
where brand Like 'Sam%'

--Q27. Find all orders where delivery_date IS NULL.
Select * 
from orders 
where delivery_date IS NULL

--Q28. List all payments where payment_method is IN ('UPI', 'Card', 'Wallet').
Select * 
from payments 
where payment_method IN ('UPI', 'Card', 'Wallet')

--Q29. Display all products where rating IS NOT NULL and rating >= 4.0.
select * 
from products 
where rating IS NOT NULL And rating >=4.0

--Q30. Find all customers where full_name contains the word 'Kumar' anywhere in the name.
select * 
from customers
where full_name LIKE '%Kumar%'


--PART D: WHERE Clause — 10 Questions

--Q31. Retrieve all customers from the state 'Maharashtra'.
select * 
from customers
where state = 'Maharashtra'


--Q32. Find all products with a price greater than 2000.
select * 
from products
where price > 2000

--Q33. List all orders placed on '2024-03-15'.
select *
from orders
WHERE CAST(order_date AS DATE) = '2024-03-15'

--Q34. Display all order_items where discount is greater than 5.0.
select * 
from order_items
where discount > 5.0

--Q35. Find all payments where amount is less than or equal to 500.
Select * 
from payments 
where amount <= 500

--Q36. Retrieve all products where category_id = 3 and stock_quantity > 20.
select * 
from products 
where category_id = 3 and stock_quantity > 20

--Q37. List all customers who registered after '2023-01-01'.
select *
from customers
WHERE CAST(registration_date AS DATE) > '2023-01-01'

--Q38. Find all orders where order_status = 'Delivered' and delivery_date is before '2024-02-01'.
select * 
From orders
where order_status = 'Delivered' and delivery_date < '2024-02-01'
--Q39. Display all products where brand = 'Apple' and rating >= 4.5.
select * 
from products
where brand = 'Apple' and rating >=4.5
--Q40. Retrieve all payments where payment_status = 'Success' and payment_method = 'UPI'.
select * 
from payments
where payment_status = 'Success' and payment_method = 'UPI'


--PART E: ORDER BY — 5 Questions

--Q41. List all products ordered by price in descending order.
select *
from products
order by price DESC

--Q42. Display all customers ordered by registration_date in ascending order.
select * 
from customers 
order by registration_date ASC


--Q43. Retrieve all orders ordered by order_date in descending order (most recent first).
select * 
from orders
order by order_date DESC

--Q44. List all products ordered by rating in descending order, then by price in ascending order.
select * 
from products


--Q45. Display the top 10 most expensive products. Use ORDER BY with LIMIT.

--PART F: Aggregation Functions (COUNT, SUM, AVG, MAX, MIN) — 10 Questions

--Q46. Find the total number of customers registered on the platform.
--Q47. Calculate the total revenue generated from all payments with payment_status = 'Success'.
--Q48. Find the average price of all products.
--Q49. Display the highest and lowest product prices.
--Q50. Count the total number of orders with order_status = 'Delivered'.
--Q51. Calculate the total quantity of all products in stock (sum of stock_quantity).
--Q52. Find the average discount applied across all order_items.
--Q53. Display the total amount paid through 'UPI' payment method.
--Q54. Count the number of distinct cities from the customers table.
--Q55. Find the maximum quantity ordered in a single order_item.

--PART G: GROUP BY — 10 Questions

--Q56. Count the total number of customers per city. Display city and customer_count.
--Q57. Find the total number of orders placed by each customer. Display customer_id and order_count.
--Q58. Calculate the total revenue per payment_method. Display payment_method and total_revenue.
--Q59. Count the number of products in each category. Display category_id and product_count.
--Q60. Find the total quantity sold per product. Display product_id and total_quantity_sold.
--Q61. Calculate the average price of products per brand. Display brand and avg_price.
--Q62. Count the number of orders per order_status. Display order_status and order_count.
--Q63. Find the total amount paid per customer. Display customer_id and total_paid. Join orders and payments.
--Q64. Display the number of order_items per order. Display order_id and item_count.
--Q65. Calculate the average rating per category. Display category_id and avg_rating. Join products and categories.

--PART H: HAVING Clause — 5 Questions

--Q66. Find all customers who have placed more than 3 orders. Display customer_id and order_count.
--Q67. List all products that have been ordered more than 10 times. Display product_id and order_count.
--Q68. Find all categories with more than 5 products. Display category_id and product_count.
--Q69. Display all brands where the average product price is greater than 5000. Display brand and avg_price.
--Q70. Find all cities with more than 2 customers. Display city and customer_count.

--PART I: JOINS (INNER, LEFT, RIGHT, SELF, FULL, CROSS) — 25 Questions

--Q71. List all orders with customer full_name. Display order_id, full_name, order_date, and order_status.
--Q72. Display all order_items with product_name and brand. Show item_id, product_name, brand, quantity, and unit_price.
--Q73. List all products with their category_name. Display product_name, category_name, price, and stock_quantity.
--Q74. Show all payments with customer full_name and order_date. Join payments, orders, and customers.
--Q75. Display all orders along with the total amount paid. Join orders and payments. Show order_id, customer_id, order_status, and amount.
--Q76. List all products that have been ordered at least once. Display product_name, brand, and total quantity ordered.
--Q77. Find all customers who have placed orders. Display full_name, email, and count of orders.
--Q78. Show complete order details: customer full_name, product_name, quantity, unit_price, and order_status. Join all relevant tables.
--Q79. Display all categories along with the count of products in each category. Include categories with zero products.
--Q80. Find all customers who have NEVER placed any order. Use LEFT JOIN.
--Q81. List all products that have NEVER been ordered. Use LEFT JOIN between products and order_items.
--Q82. Display all orders along with payment_status. Include orders that have no payment record (show NULL for payment_status).
--Q83. Find all categories with their parent category name (for sub-categories). Use SELF JOIN on categories table.
--Q84. List all pairs of customers from the same city. Use SELF JOIN on customers. Display both customer names and city.
--Q85. Find all pairs of products with the same brand. Use SELF JOIN on products. Display both product names and brand.
--Q86. Display all customers along with their total spending. Join customers, orders, and payments. Show full_name and total_spent.
--Q87. List all products ordered in 'Mumbai'. Join products, order_items, orders, and customers. Filter by city = 'Mumbai'.
--Q88. Show the top 5 best-selling products by total quantity sold. Join products and order_items.
--Q89. Find the most expensive order (by total amount). Join orders, order_items, and products. Calculate total as sum(quantity * unit_price).
--Q90. Display all orders where payment_method is 'UPI'. Join orders and payments.
--Q91. List all categories along with the total revenue generated from products in that category. Join categories, products, order_items.
--Q92. Find all customers who ordered products from the 'Electronics' category. Join customers, orders, order_items, products, categories.
--Q93. Display the average order value per customer. Join customers, orders, order_items. Calculate avg(quantity * unit_price).
--Q94. Perform a CROSS JOIN between categories and payment_methods (use a derived table with UPI, Card, NetBanking, COD, Wallet).
--Q95. Write a FULL OUTER JOIN between customers and orders to show all customers (with or without orders) and all orders.

--PART J: Subqueries — 5 Questions

--Q96. Find all products whose price is greater than the average price of all products. Use a subquery.
--Q97. List all customers who have placed more orders than the average number of orders per customer. Use a subquery.

--Q98. Display all orders where the total order value (sum of quantity * unit_price) is greater than 10000. Use a subquery in WHERE clause.
--Q99. Find the product with the highest price in each category. Use a correlated subquery.
--Q100. List all customers who have made at least one payment with amount greater than 5000. Use EXISTS with a subquery.

--PART K: Index — 5 Questions

--Q101. Create an index named 'idx_email' on the email column of the customers table.
--Q102. Create a composite index named 'idx_order_customer' on order_id and customer_id columns of the orders table.
--Q103. Create an index named 'idx_product_name' on the product_name column of the products table.
--Q104. Drop the index named 'idx_email' from the customers table.
--Q105. Show all indexes on the products table. Use SHOW INDEX command.

--PART L: Views — 5 Questions

--Q106. Create a view named 'customer_orders_view' that shows customer_id, full_name, order_id, order_date, and order_status.
--Q107. Create a view named 'product_sales_view' that displays product_id, product_name, category_name, and total_quantity_sold.
--Q108. Create a view named 'revenue_by_category' that shows category_name and total revenue generated from each category.
--Q109. Query the 'customer_orders_view' to find all orders placed by customers from 'Delhi'.
--Q110. Drop the view named 'product_sales_view'.

