class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def create
    puts params[:movie]
    @movie = Movie.create!({
      title: params[:movie][:title],
      rating: params[:movie][:rating],
      description: params[:movie][:description],
      release_date: Date.new(params[:movie]["release_date(1i)"].to_i, params[:movie]["release_date(2i)"].to_i, params[:movie]["release_date(3i)"].to_i),
    })
    redirect_to movies_path
  end
end
