
CREATE TABLE customer
(
    cust_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age VARCHAR(255),
    customer_email VARCHAR(255)
)
INSERT INTO customer
	VALUES (2,'nisarg','adalja','22','nisargadalja@gmil.com');

	INSERT INTO customer
	VALUES (3,'deep','dave','23','nisargadalja@gmil.com');
	INSERT INTO customer
	VALUES (4,'dhruvil','patel','24','nisargadalja@gmil.com');

	SELECT *,
CASE WHEN age < '25' THEN 'Young'
	WHEN age > '60' THEN 'Senior Citizen'
	ELSE 'Middleaged'
END AS Age_category
FROM customer;

CREATE TABLE customer1 (
    customer_id character varying(255) NOT NULL,
    customer_name character varying(255),
    segment character varying(255),
    age INTeger,
    country character varying(255),
    city character varying(255),
    state character varying(255),
    postal_code bigINT,
    region character varying(255)
);

CREATE TABLE public.sales (
    order_line INTeger NOT NULL,
    order_id character varying(255),
    order_DATE DATE,
    ship_DATE DATE,
    ship_mode character varying(255),
    customer_id character varying(255),
    product_id character varying(255),
    sales double precision,
    quantity INTeger,
    discount double precision,
    profit double precision
);

SELECT * FROM customer


SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales AS a
INNER JOIN customer AS b
ON a.customer_id = b.customer_id
ORDER BY customer_id;


SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales AS a
LEFT JOIN customer AS b
ON a.customer_id = b.customer_id
ORDER BY customer_id;


SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales AS a
Right JOIN customer AS b
ON a.customer_id = b.customer_id
ORDER BY customer_id;

/* cross join */
SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales AS a
cross JOIN customer AS b
ORDER BY customer_id;

/* INTersect */
SELECT customer_id FROM customer INTersect SELECT customer_id FROM sales;

/* except */
SELECT customer_id
FROM sales_2015
EXCEPT
SELECT customer_id
FROM customer_20_60
ORDER BY customer_id;

/* union*/
SELECT customer_id
FROM sales_2015
UNION
SELECT customer_id
FROM customer_20_60
ORDER BY customer_id;