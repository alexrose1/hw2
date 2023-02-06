# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Actor.destroy_all
Character.destroy_all
Movie.destroy_all
Studio.destroy_all
Role.destroy_all


# Generate models and tables, according to the domain model.
# TODO!

    #AR - rails generate model actors
    #AR - rails generate model movies
    #AR - rails generate model characters
    #AR - rails generate model roles
    #AR - rails generate model studios
    #AR - rails db:migrate 

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

    #studios
        new_studio = Studio.new
            new_studio["name"] = "Warner Bros."
            new_studio.save

    #Actors
    christian_bale = Actor.new
        christian_bale["full_name"] = "Christian Bale"
        christian_bale.save

    michael_caine = Actor.new
        michael_caine["full_name"] = "Michael Caine"
        michael_caine.save

    liam_neeson = Actor.new  
        liam_neeson["full_name"] = "Liam Neeson"
        liam_neeson.save
    
    katie_holmes = Actor.new 
        katie_holmes["full_name"] = "Katie Holmes"
        katie_holmes.save

    gary_oldman = Actor.new
        gary_oldman["full_name"] = "Gary Oldman"
        gary_oldman.save

    heath_ledger = Actor.new
        heath_ledger["full_name"] = "Heath Ledger"
        heath_ledger.save

    aaron_eckhart = Actor.new
        aaron_eckhart["full_name"] = "Aaron Eckhart"
        aaron_eckhart.save

    maggie_gyllenhaal = Actor.new
        maggie_gyllenhaal["full_name"] = "Maggie Gyllenhaal"
        maggie_gyllenhaal.save

    tom_hardy = Actor.new
        tom_hardy["full_name"] = "Tom Hardy"
        tom_hardy.save

    joseph_gordon = Actor.new
        joseph_gordon["full_name"] = "Joseph Gordon-Levitt"
        joseph_gordon.save

    anne_hathaway = Actor.new
        anne_hathaway["full_name"] = "Anne Hathaway"
        anne_hathaway.save


    #movies
    warner_id = Studio.find_by("name" => "Warner Bros.")

    
    batman_begins = Movie.new
        batman_begins["title"] = "Batman Begins"
        batman_begins["year_released"] = 2005
        batman_begins["rated"] = "PG-13"
        batman_begins["studio_id"] = warner_id["id"]
        batman_begins.save

    dark_knight = Movie.new
        dark_knight["title"] = "The Dark Knight"
        dark_knight["year_released"] = 2008
        dark_knight["rated"] = "PG-13"
        dark_knight["studio_id"] = warner_id["id"]
        dark_knight.save

    dark_knight_rises = Movie.new
        dark_knight_rises["title"] = "The Dark Knight Rises"
        dark_knight_rises["year_released"] = 2012
        dark_knight_rises["rated"] = "PG-13"
        dark_knight_rises["studio_id"] = warner_id["id"]
        dark_knight_rises.save

    #roles
    bb_id = Movie.find_by("title" => "Batman Begins")
    dk_id = Movie.find_by("title" => "The Dark Knight")
    dkr_id = Movie.find_by("title" => "The Dark Knight Rises")
    

    cbale_id = Actor.find_by("full_name" => "Christian Bale")
    mcaine = Actor.find_by("full_name" => "Michael Caine")
    lneeson = Actor.find_by("full_name" => "Liam Neeson")
    kholmes = Actor.find_by("full_name" => "Katie Holmes") 
    goldman = Actor.find_by("full_name" => "Gary Oldman") 
    hledger = Actor.find_by("full_name" => "Heath Ledger") 
    aeckhart = Actor.find_by("full_name" => "Aaron Eckhart")
    mgyllenhaal = Actor.find_by("full_name" => "Maggie Gyllenhaal") 
    thardy = Actor.find_by("full_name" => "Tom Hardy") 
    jgordon = Actor.find_by("full_name" => "Joseph Gordon-Levitt") 
    ahathaway = Actor.find_by("full_name" => "Anne Hathaway") 


    bruce_wayne1 = Character.new
        bruce_wayne1["char_name"] = "Bruce Wayne"
        bruce_wayne1["movie_id"] = bb_id["id"]
        bruce_wayne1["actor_id"] = cbale_id["id"]
        bruce_wayne1.save

        bruce_wayne2 = Character.new
        bruce_wayne2["char_name"] = "Bruce Wayne"
        bruce_wayne2["movie_id"] = dk_id["id"]
        bruce_wayne2["actor_id"] = cbale_id["id"]
        bruce_wayne2.save

        bruce_wayne3 = Character.new
        bruce_wayne3["char_name"] = "Bruce Wayne"
        bruce_wayne3["movie_id"] = dkr_id["id"]
        bruce_wayne3["actor_id"] = cbale_id["id"]
        bruce_wayne3.save

        alfred1 = Character.new
        alfred1["char_name"] = "Alfred"
        alfred1["movie_id"] = bb_id["id"]
        alfred1["actor_id"] = mcaine["id"]
        alfred1.save

        alfred2 = Character.new
        alfred2["char_name"] = "Alfred"
        alfred2["movie_id"] = dk_id["id"]
        alfred2["actor_id"] = mcaine["id"]
        alfred2.save

        rag = Character.new
        rag["char_name"] = "Ra's Al Ghul"
        rag["movie_id"] = bb_id["id"]
        rag["actor_id"] = lneeson["id"]
        rag.save


        rachel_dawes = Character.new
        rachel_dawes["char_name"] = "Rachel Dawes"
        rachel_dawes["movie_id"] = bb_id["id"]
        rachel_dawes["actor_id"] = kholmes["id"]
        rachel_dawes.save

        gordon1 = Character.new
        gordon1["char_name"] = "Commissioner Gordon"
        gordon1["movie_id"] = bb_id["id"]
        gordon1["actor_id"] = goldman["id"]
        gordon1.save

        gordon2 = Character.new
        gordon2["char_name"] = "Commissioner Gordon"
        gordon2["movie_id"] = dk_id["id"]
        gordon2["actor_id"] = goldman["id"]
        gordon2.save

        gordon3 = Character.new
        gordon3["char_name"] = "Commissioner Gordon"
        gordon3["movie_id"] = dkr_id["id"]
        gordon3["actor_id"] = goldman["id"]
        gordon3.save


        joker = Character.new
        joker["char_name"] = "Joker"
        joker["movie_id"] = dk_id["id"]
        joker["actor_id"] = hledger["id"]
        joker.save

        harvey_dent = Character.new
        harvey_dent["char_name"] = "Harvey Dent"
        harvey_dent["movie_id"] = dk_id["id"]
        harvey_dent["actor_id"] = aeckhart["id"]
        harvey_dent.save

        bane = Character.new
        bane["char_name"] = "Bane"
        bane["movie_id"] = dkr_id["id"]
        bane["actor_id"] = thardy["id"]
        bane.save

        john_blake = Character.new
        john_blake["char_name"] = "John Blake"
        john_blake["movie_id"] = dkr_id["id"]
        john_blake["actor_id"] = jgordon["id"]
        john_blake.save

        selina_kyle = Character.new
        selina_kyle["char_name"] = "Selina Kyle"
        selina_kyle["movie_id"] = dkr_id["id"]
        selina_kyle["actor_id"] = ahathaway["id"]
        selina_kyle.save


 

# Prints a header for the movies output


# Query the movies data and loop through the results to display the movies output.
# TODO!
puts "Movies"
puts "======"
puts ""

all_movies = Movie.all
for movie in all_movies
    
    puts "#{movie["title"]}     #{movie["year_released"]}     #{movie["rated"]}     #{new_studio["name"]}"
end 


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""


# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
all_actors = Actor.all


for movie in all_movies 


    rosters = Character.where({"movie_id" => movie["id"]})

        for roster in rosters
            fullnames = Actor.find_by({"id" => roster["actor_id"]})
            movienames = Movie.find_by({"id" => roster["movie_id"]})

            puts "#{movienames["title"]}     #{roster["char_name"]}     #{fullnames["full_name"]}"
        
        
            end 
    end