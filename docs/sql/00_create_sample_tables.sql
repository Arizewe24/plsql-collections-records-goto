-- Creates a small employees table used by examples.
CREATE TABLE dev_employees (
  employee_id   NUMBER PRIMARY KEY,
  employee_code VARCHAR2(20) UNIQUE,
  first_name    VARCHAR2(50),
  last_name     VARCHAR2(50),
  department_id NUMBER
);

INSERT INTO dev_employees VALUES (100, 'E100', 'Alice', 'Ames', 10);
INSERT INTO dev_employees VALUES (101, 'E101', 'Bob', 'Baker', 10);
INSERT INTO dev_employees VALUES (102, 'E102', 'Carol', 'Chen', 20);
COMMIT;
