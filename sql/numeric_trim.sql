CREATE EXTENSION numeric_trim;

SELECT numeric_trim(NULL);
SELECT numeric_trim('NaN');
SELECT numeric_trim('0');
SELECT numeric_trim('0.0');
SELECT numeric_trim('-0.0');
SELECT numeric_trim('1000.00');
SELECT numeric_trim('1000.0010');
SELECT numeric_trim('1.00000000000000000000000000000000000000000000000000000');
SELECT numeric_trim('1.000000000000000000000000000000000000000000000000000001');
SELECT numeric_trim('-1000.00');
SELECT numeric_trim('-1000.0010');
SELECT numeric_trim('-1.00000000000000000000000000000000000000000000000000000');
SELECT numeric_trim('-1.000000000000000000000000000000000000000000000000000001');