require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name) # => an array of hashes of movies
  my_film_hash = []
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # names_array = response_hash["results"]
  response_hash["results"].each do |person|
    if person["name"].downcase == character_name
      # my_films = person_hash["films"]
      person["films"].each do |film|
        url = RestClient.get(film)
        parser = JSON.parse url
        my_film_hash << parser
      end
    end
  end
  my_film_hash
end













  #end
#   names_array.each do |key,value|
#     puts key == :name ? "#{key} : \n" : "#{value}"
#
# my_film_hash = []
#   response_string = RestClient.get('http://www.swapi.co/api/people')
#   response_hash = JSON.parse(response_string)
#   names_array = response_hash["results"]
#   names_array.each do |person_hash|
#     if person_hash["name"] == character_name
#       my_films = person_hash["films"]
#
#       my_films.each do |film|
#         response = RestClient.get film
#         json_film = JSON.parse response
#         film_hashes << json_film
#
#     end
#   end
# end
#   my_film_hash
#   binding.pry
# end

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

# name = response_hash["results"][0]["name"]
# films = response_hash["results"][0] ["films"]







  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  new_empty = []
  films.each do|film|
    new_empty << film["title"]
  # some iteration magic and puts out the movies in a nice list
  end
  new_empty
  binding.pry
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
