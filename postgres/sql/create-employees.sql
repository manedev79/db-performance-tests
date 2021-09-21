DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id NUMERIC NOT NULL,
    first_name VARCHAR(1000),
    last_name VARCHAR(1000),
    date_of_birth DATE,
    phone_number VARCHAR(1000),
    PRIMARY KEY (employee_id)
);

INSERT INTO employees VALUES
(1, 'Matthew', 'Matthewson', '2000-01-01', '123-111'),
(2, 'Mark', 'Markson', '2000-02-02', '123-222'),
(3, 'Gabi', 'Gabidotir', '2000-03-03', '123-333'),
(4, 'Evelyn', 'Evelyndotir', '2000-04-04', '123-444'),
(5, 'Hans', 'Hansson', '2000-05-05', '123-555'),
(6, 'Siggi', 'Siggison', '2000-06-06', '123-666'),
(7, 'Berta', 'Bertadotir', '2000-07-07', '123-777'),
(8, 'Brat', 'Bratson', '2000-08-08', '123-888');