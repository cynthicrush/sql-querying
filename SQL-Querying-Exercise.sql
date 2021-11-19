-- PART I

-- 0 --

-- 1.
SELECT population FROM world
WHERE name = 'Germany'
-- 2.
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- 3.
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000


-- 1 --

-- 1.
SELECT name FROM world
WHERE name LIKE 'Y%'
-- 2.
SELECT name FROM world
WHERE name LIKE '%y'
-- 3.
SELECT name FROM world
WHERE name LIKE '%x%'
-- 4.
SELECT name FROM world
WHERE name LIKE '%land'
-- 5.
SELECT name FROM world
WHERE name LIKE 'C%ia'
-- 6.
SELECT name FROM world
WHERE name LIKE '%oo%'
-- 7.
SELECT name FROM world
WHERE name LIKE '%a%a%a%'
-- 8.
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name
-- 9.
SELECT name FROM world
WHERE name LIKE '%o__o%'
-- 10.
SELECT name FROM world
WHERE name LIKE '____'
-- 11.
SELECT name
FROM world
WHERE name = capital
-- 12.
SELECT name
FROM world
WHERE capital = concat(name, ' City');
-- 13.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%');
-- 14.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%') AND capital > name;
-- 15.
SELECT name, REPLACE(capital, name, '')
FROM world 
WHERE capital LIKE concat(name, '%') AND capital > name;


-- 2 --

-- 1.
SELECT name, continent, population FROM world
-- 2.
SELECT name FROM world
WHERE population > 200000000
-- 3.
SELECT name, GDP/population
FROM world
WHERE population > 200000000
-- 4.
SELECT name, population/1000000
FROM world
WHERE continent='South America';
-- 5.
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');
-- 6.
SELECT name
FROM world
WHERE name LIKE '%United%'
-- 7.
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;
-- 8.
SELECT name, population, area
FROM world
WHERE (area > 3000000 OR population > 250000000)
AND NOT(area > 3000000 AND population > 250000000);
-- 9.
SELECT name, ROUND(population/1000000,2),
             ROUND(gdp/1000000000,2)
FROM world
WHERE continent='South America';
-- 10.
SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp>1000000000000;
-- 11.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);
-- 12.
SELECT name, capital
FROM world
WHERE LEFT(name,1)=LEFT(capital,1) XOR name = capital
-- 13.
SELECT name
FROM world
WHERE name LIKE '%a%' 
AND name LIKE '%e%' 
AND name LIKE '%i%' 
AND name LIKE '%o%' 
AND name LIKE '%u%'
AND name NOT LIKE '% %'


-- 3 --

-- 1.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950
-- 2.
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'
-- 3.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';
-- 4.
SELECT winner 
FROM nobel
WHERE yr>='2000' AND subject='Peace';
-- 5.
SELECT yr, subject, winner 
FROM nobel
WHERE subject='Literature' AND yr BETWEEN 1980 AND 1989
-- 6.
SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 
                  'Barack Obama')
-- 7.
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'
-- 8.
SELECT yr, subject, winner
FROM nobel
WHERE (subject='Physics' AND yr='1980')
OR (subject='Chemistry' AND yr='1984')
-- 9.
SELECT yr, subject, winner
FROM nobel
WHERE subject NOT IN ('Chemistry', 'Medicine') AND yr='1980'
-- 10.
SELECT yr, subject, winner
FROM nobel
WHERE (subject='Medicine' AND yr<1910) 
OR (subject='Literature' AND yr>=2004) 
-- 11.
SELECT yr, subject, winner
FROM nobel
WHERE winner='PETER GRÜNBERG'
-- 12.
SELECT yr, subject, winner
FROM nobel
WHERE winner='EUGENE O''NEILL'
-- 13.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr desc;
-- 14.
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject, winner


-- 5 --

-- 1.
SELECT SUM(population)
FROM world
-- 2.
SELECT DISTINCT continent
FROM world
-- 3.
SELECT SUM(gdp)
FROM world
WHERE continent='Africa'
-- 4.
SELECT COUNT(*)
FROM world
WHERE area>=1000000;
-- 5.
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');
-- 6.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;
-- 7.
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent
-- 8.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000
 


-- PART II

-- SQL Basics: Simple WHERE and ORDER BY
SELECT *
FROM people
WHERE age > 50
ORDER BY age desc

-- SQL Basics: Simple SUM
SELECT SUM(age) AS age_sum 
FROM people

-- SQL Basics: Simple MIN / MAX
SELECT 
      MIN(age) AS age_min,
      MAX(age) AS age_max
FROM
    people

-- Find all active students
SELECT * 
FROM students
WHERE IsActive IN (1)

-- SQL Basics: Simple GROUP BY
SELECT
  age,
  COUNT(*) AS people_count 
FROM people
GROUP BY age

-- SQL Basics: Simple HAVING
SELECT 
age,
COUNT(*) AS total_people
