# Use the albums_db database.
USE albums_db;

# Explore the structure of the albums table.
# a. How many rows are in the albums table?
# Answer: 31 rows.
/* Explanation: I used select function and from function to pull all data from albums. 
 You can see the amount of rows a the bottom of the screen. */

SELECT *
FROM albums;


#b. How many unique artist names are in the albums table?
# Answer: 23 rows
/* Explanation: I used select distinct function and from function to pull data (artist) 
from the artist table. You can see the amount of rows a the bottom of the screen.
*/

SELECT DISTINCT artist
FROM albums;


# c. What is the primary key for the albums table?
# Answer: PRIMARY KEY (`id`)
/* Explanation: I used SHOW CREATE TABLE to show the creation information for albums. 
Double- click the output and you can see the Primary key information.*/

SHOW CREATE TABLE albums;


# d. What is the oldest release?
# Answers: 1967
/* Explanation: I used the select function and from function to see the release dates from albums table.
You can order the release dates from clicking on the release column in the output section. 
You will see it ordered in oldest to newest.
*/

SELECT release_date
FROM albums;


# Write queries to find the following information:

# a. The name of all albums by Pink Floyd
# Answer: The Dark Side of the Moon and The Wall.
/* Explanation: I used select function and from function to pull all data from albums. 
Then I used the where function to filter artist by name Pink Floyd. When you run this
you will see the output at the bottom has the names of the albums under name column.
*/

SELECT *
FROM albums
WHERE artist= 'pink floyd';



# b. The year Sgt. Pepper's Lonely Hearts Club Band was released?
# Answers: 1967
/* Explanation: I used select function and from function to pull all data from albums. 
Then I used the where function to filter name by Sgt. Peppers Lonely Hearts Club Band.
When you run this you will see the output at the bottom has the release date information 
under the release_date column.
*/

SELECT *
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";



# c. The genre for the album Nevermind
# Answer: Grunger, Alternative rock
/* Explanation: I used select function and from function to pull all data from albums. 
Then I used the where function to filter name by Nevermind. When you run this
you will see the output at the bottom has the names of the albums under name column.
*/

SELECT *
FROM albums
WHERE name = "Nevermind";

# d. Which albums were released in the 1990s
# Answer: Dangerous, The Immaculate Collection, Metallica, and Nevermind
/* Explanation: I used select function and from function to pull all data from albums. 
Then I used the where function to filter release date bewtween 1990 and 1999. When you run this
you will see the output at the bottom with the album names under name column.
*/

SELECT *
FROM albums
WHERE release_date BETWEEN 1990 and 1991;


# e. Which albums had less than 20 million certified sales
# Answer: Thriller, Back in black, The dark side of the mmon, Bat out of hell, The bodyguard, Their greatest hits (1971-1975), Saturday night fever, Rumours, Led Zeppelin IV, Jagged Little Pill, Come on over, Falling into you, Hotel California, 21, 1, Metallica, Supernatureal, and Appetite for destruction.
/* Explanation: I used select function and from function to pull all data from albums. 
Then I used the where function to filter sales for anything below 20 million. When you run this
you will see the output at the bottom with all the sales below 20 million.
*/

SELECT *
FROM albums
WHERE sales > 20;


# f. All the albums with a genre of "Rock". Why do these query results not include albums with 
# a genre of "Hard rock" or "Progressive rock"?
# Answer & Explanation: Hard rock and progressive rock are not included because rock is a literal string we searched for. 
Then I used the where function to filter genre by name rock. Hard rock and progressive rock is not included
because it filters by the literal string name rock.

SELECT *
FROM albums
WHERE genre= "rock";



