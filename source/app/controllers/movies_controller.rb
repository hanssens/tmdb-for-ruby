

class MoviesController < ApplicationController

  # default homepage
  def index
    render 'movies/index'
  end

  def details
    @movie_id = params[:id]
    api_key = File.read('config/apikey.txt')
    proxy = Movies.new(api_key)

    # fetch the actual movie
    @movie = proxy.FindById(@movie_id)

    render 'movies/detail'
  end
end