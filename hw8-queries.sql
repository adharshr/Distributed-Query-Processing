/*
Adharsh Ranganathan
CSE 414 - HW8

These queries ran in parallel databases hosted
on AWS using Apache Spark.
*/

--Q1
SELECT COUNT(*) FROM fbFacts
/*
563,980,447
*/

--Q2
SELECT COUNT(DISTINCT Predicate) FROM fbFacts
/*
18,944
*/

--Q3
SELECT * FROM fbFacts WHERE subject = "/m/0284r5q"
/*
/m/0284r5q	/type/object/key	/wikipedia/en_id	9,327,603
/m/0284r5q	/type/object/key	/wikipedia/en	Flyte_$0028chocolate_bar$0029
/m/0284r5q	/type/object/key	/wikipedia/en_title	Flyte_$0028chocolate_bar$0029
/m/0284r5q	/common/topic/article	/m/0284r5t	
/m/0284r5q	/type/object/type	/common/topic	
/m/0284r5q	/type/object/type	/food/candy_bar	
/m/0284r5q	/type/object/type	/business/brand	
/m/0284r5q	/type/object/type	/base/tagit/concept	
/m/0284r5q	/food/candy_bar/manufacturer	/m/01kh5q	
/m/0284r5q	/common/topic/notable_types	/business/brand	
/m/0284r5q	/common/topic/notable_types	/food/candy_bar	
/m/0284r5q	/food/candy_bar/sold_in	/m/09c7w0	
/m/0284r5q	/common/topic/notable_for		{"types":[], "id":"/food/candy_bar", "property":"/type/object/type", "name":"Candy bar"}
/m/0284r5q	/type/object/name	/lang/en	Flyte
/m/0284r5q	/common/topic/image	/m/04v6jtv	
*/

--Q4
SELECT COUNT(*) FROM fbFacts WHERE predicate = "/type/object/type" AND obj = "/travel/travel_destination"
/*
295
*/

--Q5
SELECT f2.context as Name, COUNT(*) as Count
FROM fbFacts f1, fbFacts f2 
WHERE f1.predicate = "/travel/travel_destination/tourist_attractions" AND f2.predicate = "/type/object/name" 
AND f2.obj = "/lang/en" AND f2.subject = f1.subject
GROUP BY f2.context
ORDER BY Count DESC, Name ASC
LIMIT 20
/*
London	109
Norway	74
Finland	59
Burlington	41
Rome	40
Toronto	36
Beijing	32
Buenos Aires	28
San Francisco	26
Bangkok	20
Munich	19
Sierra Leone	19
Vienna  19
Montpelier  18
Athens  17
Atlanta 17
Tanzania    17
Berlin  16
Laos    16
Portland    15
*/

--Q6
SELECT x.count_distinct_predicate as distinct_predicates, COUNT(*) as count
FROM (SELECT COUNT(DISTINCT f.predicate) as count_distinct_predicate, f.subject
     FROM fbFacts f
     GROUP BY f.subject) as x
GROUP BY x.count_distinct_predicate

--Multiple choice

/*
1. a
2. c
3. d
4. b

5.  a. T
	b. T
	c. T
	d. T
*/

