class MoviesController < ApplicationController

  # default homepage
  def index
    render 'movies/index'
  end

  def details
    @movie_id = params[:id]
    proxy = Movies.new('xxxx')
    @ping = proxy.Ping

    render 'movies/detail'
  end
end