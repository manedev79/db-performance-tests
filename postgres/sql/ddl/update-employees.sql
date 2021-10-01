-- add subsidiary_id and update existing records
ALTER TABLE employees ADD subsidiary_id NUMERIC;
UPDATE      employees SET subsidiary_id = 30;
ALTER TABLE employees ALTER COLUMN subsidiary_id SET NOT NULL;

-- change the PK
ALTER TABLE employees DROP CONSTRAINT employees_pk;
ALTER TABLE employees ADD CONSTRAINT employees_pk
      PRIMARY KEY (subsidiary_id, employee_id);

-- generate more records (Very Big Company)
INSERT INTO employees (employee_id,  first_name,
                       last_name,    date_of_birth, 
                       phone_number, subsidiary_id, junk)
SELECT GENERATE_SERIES
     , initcap(lower(random_string(2, 8)))
     , initcap(lower(random_string(2, 8)))
     , CURRENT_DATE - CAST(floor(random() * 365 * 10 + 40 * 365) AS NUMERIC) * INTERVAL '1 DAY'
     , CAST(floor(random() * 9000 + 1000) AS NUMERIC)
     , CAST(floor(random() * least((generate_series % 2)+0.2,1) * (generate_series-1000)/9000*29) AS NUMERIC)
     , 'junk'
  FROM GENERATE_SERIES(1, 9000);

VACUUM ANALYZE employees;