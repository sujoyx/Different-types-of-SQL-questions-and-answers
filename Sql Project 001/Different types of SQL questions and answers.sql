-- Show first name of patients that start with the letter 'C'
SELECT 
   first_name 
FROM patients 
WHERE first_name like 'C%';

-- Show first name and last name of patients that weight within the range of 100 to 120 (inclusive).
SELECT
  first_name,
  last_name
FROM patients
WHERE weight BETWEEN 100 AND 120;

-- Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'.
UPDATE patients
SET allergies = 'NKA'
WHERE allergies is NULL;

-- Show first name and last name concatinated into one column to show their full name.
SELECT 
concat (first_name,' ', last_name) AS full_name
FROM patients;

-- Show first name, last name, and the full province name of each patient.
SELECT 
  first_name, 
  last_name,
  province_name
FROM patients a
JOIN province_names b ON a.province_id = b.province_id;

-- Show how many patients have a birth_date with 2010 as the birth year.
SELECT count(*) 
FROM patients 
WHERE YEAR(birth_date)= 2010; 

-- Show the first_name, last_name, and height of the patient with the greatest height.
SELECT
  first_name,
  last_name,
  height 
FROM patients
ORDER BY height DESC LIMIT 1;



-- Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
SELECT *
FROM patients
WHERE patient_id IN (1,45,534,879,1000);

-- Show the total number of admissions
SELECT COUNT(patient_id)
FROM admissions;


-- Show all the columns from admissions where the patient was admitted and discharged on the same day
SELECT *
FROM admissions
WHERE admission_date = discharge_date;

-- Show the total number of admissions for patient_id 579.
SELECT 
  patient_id, 
count(*) AS total_admission
FROM admissions
WHERE patient_id = 579;

-- Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
SELECT 
DISTINCT(city) AS unique_cities
FROM patients
WHERE province_id= 'NS';

-- Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
SELECT 
  first_name, 
  last_name, 
  birth_date
FROM patients
WHERE height > 160 AND weight > 70;

-- Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null
SELECT
  first_name,
  last_name,
  allergies
FROM patients
WHERE city = 'Hamilton'
AND allergies IS NOT NULL;

-- Based on cities where our patient lives in, write a query to display the list of unique city starting with a vowel (a, e, i, o, u). Show the result order in ascending by city.
 SELECT
 distinct city
 from patients
 where 
 city like 'a%'
 or city like 'e%'
 or city like 'i%'
 or city like 'o%'
 or city like 'u%'
 order by city ;

-- Show unique birth years from patients and order them by ascending.
 SELECT
 DISTINCT YEAR (birth_date) AS unique_birth_years
 FROM patients 
 ORDER BY birth_date;

-- Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
 SELECT
   patient_id,
   first_name
 FROM patients
 WHERE first_name LIKE 's____%s';
 
 
-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
 SELECT 
   a.patient_id, 
   first_name, 
   last_name
 FROM patients a  
 JOIN admissions b 
 ON a.patient_id = b.patient_id WHERE diagnosis = 'Dementia';

-- Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
 SELECT 
  (SELECT 
    COUNT(gender) 
    FROM patients 
    WHERE gender= 'M') AS male_count,
 COUNT(gender) AS female_count 
 from patients 
 where gender = 'F';
 
 -- Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
 SELECT 
   last_name,
   allergies
 FROM patients 
 WHERE allergies IN ('Penicillin' , 'Morphine')   
 ORDER BY
   allergies, 
   first_name, 
   last_name;

-- Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date. medium
 SELECT 
   first_name, 
   last_name, 
   birth_date
 FROM patients
 WHERE YEAR(birth_date) BETWEEN 1970 AND 1979
 ORDER BY birth_date ASC;

-- We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
 SELECT
   CONCAT(UPPER(last_name), ',' , LOWER(first_name)) AS full_name
 FROM patients
 ORDER BY first_name DESC;

-- Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.


















 
