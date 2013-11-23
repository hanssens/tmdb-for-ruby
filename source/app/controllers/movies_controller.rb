class MoviesController < ApplicationController

  # default homepage
  def index

  end

  def details
    movie_id = params[:id]
    proxy = Movies.new('xxxx')
    @ping = proxy.Ping

    render 'movies/index'
  end
end