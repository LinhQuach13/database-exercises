# Use the albums_db database.
USE albums_db;

# Explore the structure of the albums table.

# a. How many rows are in the albums table?
# Answer: 31 rows
SELECT *
FROM albums;


#b. How many unique artist names are in the albums table?
# Answer: 23 rows
SELECT DISTINCT artist
FROM albums;


# c. What is the primary key for the albums table?
# Answer: PRIMARY KEY (`id`)
SHOW CREATE TABLE albums;


# d. What is the oldest release?
# Answers: 1967
SELECT release_date
FROM albums;



# Write queries to find the following information:

# a. The name of all albums by Pink Floyd
# Answer: The Dark Side of the Moon and The Wall.
SELECT *
FROM albums
WHERE artist= 'pink floyd';



# b. The year Sgt. Pepper's Lonely Hearts Club Band was released
# Answers: 1967
SELECT *
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";


# c. The genre for the album Nevermind
# Answer: Grunger, Alternative rock
SELECT *
FROM albums
WHERE name = "Nevermind";


# d. Which albums were released in the 1990s
# Answer: Dangerous, The Immaculate Collection, Metallica, and Nevermind 
SELECT *
FROM albums
WHERE release_date BETWEEN 1990 and 1991;


# e. Which albums had less than 20 million certified sales
# Answer: Thriller, Back in black, The dark side of the mmon, Bat out of hell, The bodyguard, Their greatest hits (1971-1975), Saturday night fever, Rumours, Led Zeppelin IV, Jagged Little Pill, Come on over, Falling into you, Hotel California, 21, 1, Metallica, Supernatureal, and Appetite for destruction.
SELECT *
FROM albums
WHERE sales > 20;

# f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
# Answer & Explanation: I used select function and from function to pull all data from albums. 
#Then I used the where function to filter genre by name rock. Hard rock and progressive rock is not included
#because it filters by the literal string name rock.
SELECT *
FROM albums
WHERE genre= "rock";