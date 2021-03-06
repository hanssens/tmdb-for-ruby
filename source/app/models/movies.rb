require 'net/http'	# required for communicating with the REST API
#require 'json' 		# JSON consuming
#require 'rubygems'
#require 'hashie' 	# Converts hashes into objects

# Wrapper for connecting with TheMovieDb API.
# Params:
# +apikey+:: API key, as provided by themoviedb.org
class Movies

  def initialize(apikey)
    @api_key = apikey
    puts 'Initialize: API Key (' + @api_key + ')'
  end

  def Execute(args)
    # private function that executes a REST command on the TMDB API
    # and returns the response (as JSON)
    composed_url = "http://api.themoviedb.org/3/#{args}?api_key=#{@api_key}"

    response = Net::HTTP.get_response(URI.parse(composed_url))
    raw_data = JSON.parse(response.body)
    #return raw_data

    # convert to a Hashie; an anonymous object, based on the JSON response
    data = ::Hashie::Mash.new raw_data

    return data
  end

  # Retrieves a movie by TMDB id.
  def FindById(movie_id=200)
    return Execute("movie/#{movie_id}")
  end

  def FindByName
    # Planet TError: tt1077258
    url = "http://api.themoviedb.org/3/find/query=prometheus?ap_key=" + "f2c1dc474ed0b8b3af7eebbd9136aba5"
    response = Net::HTTP.get_response(URI.parse(url))
    puts response.body
  end

  def Ping
    return 'Pong!'
  end

  # define the private functions
  private :Execute
end




