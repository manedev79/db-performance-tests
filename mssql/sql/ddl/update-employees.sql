ALTER TABLE employees ADD subsidiary_id NUMERIC;
GO
UPDATE      employees SET subsidiary_id = 30;
GO
ALTER TABLE employees ALTER COLUMN subsidiary_id 
                                   NUMERIC NOT NULL;
GO

ALTER TABLE employees DROP CONSTRAINT employees_pk;
GO
ALTER TABLE employees ADD  CONSTRAINT employees_pk 
      PRIMARY KEY NONCLUSTERED (subsidiary_id, employee_id);
GO


WITH generator (n) as
( select 1
union all
select n + 1 from generator
where N < 9000
)
INSERT INTO employees (employee_id
                     , first_name, last_name
                     , date_of_birth, phone_number
                     , junk, subsidiary_id)
SELECT n employee_id
     , [dbo].random_string(11) first_name
     , [dbo].random_string(11) last_name  
     , [dbo].random_date(20*365, 60*365) dob
     , 'N/A' phone
     , 'junk' junk
     , [dbo].random_int(1, (n*29)/9000) subsidiary_id
  FROM generator
OPTION (MAXRECURSION 9000)
GO

CREATE UNIQUE NONCLUSTERED INDEX 
       employees_pk_tmp 
       on employees (employee_id, subsidiary_id);
GO
ALTER TABLE employees DROP CONSTRAINT employees_pk;
GO
ALTER TABLE employees ADD CONSTRAINT employees_pk
      PRIMARY KEY NONCLUSTERED (employee_id, subsidiary_id);
GO
DROP INDEX employees_pk_tmp ON employees;
GO

exec sp_updatestats;
GO