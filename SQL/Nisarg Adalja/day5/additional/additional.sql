
CREATE TABLE customer
(
    cust_id int,
    first_name varchar(255),
    last_name varchar(255),
    age varchar(255),
    customer_email varchar(255)
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
    age integer,
    country character varying(255),
    city character varying(255),
    state character varying(255),
    postal_code bigint,
    region character varying(255)
);

CREATE TABLE public.sales (
    order_line integer NOT NULL,
    order_id character varying(255),
    order_date date,
    ship_date date,
    ship_mode character varying(255),
    customer_id character varying(255),
    product_id character varying(255),
    sales double precision,
    quantity integer,
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

/* intersect */
SELECT customer_id FROM customer intersect SELECT customer_id FROM sales;

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