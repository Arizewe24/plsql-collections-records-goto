SET SERVEROUTPUT ON SIZE 1000000
DECLARE
  TYPE salary_map_t IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
  salary_map salary_map_t;
  v_emp_code VARCHAR2(20);
  v_sum NUMBER := 0;
  v_count NUMBER := 0;
BEGIN
  salary_map('E100') := 5000;
  salary_map('E101') := 6000;
  salary_map('E102') := 5500;

  IF salary_map.EXISTS('E101') THEN
    DBMS_OUTPUT.PUT_LINE('E101 salary: ' || salary_map('E101'));
  ELSE
    DBMS_OUTPUT.PUT_LINE('E101 not found');
  END IF;

  v_emp_code := salary_map.FIRST;
  WHILE v_emp_code IS NOT NULL LOOP
    v_sum := v_sum + salary_map(v_emp_code);
    v_count := v_count + 1;
    DBMS_OUTPUT.PUT_LINE('Employee=' || v_emp_code || ' Salary=' || salary_map(v_emp_code));
    v_emp_code := salary_map.NEXT(v_emp_code);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total employees: ' || v_count || ', Sum salaries: ' || v_sum);
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
