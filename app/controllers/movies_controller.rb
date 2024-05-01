class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def create
    if params[:movie][:title].empty? || params[:movie][:rating].empty? || params[:movie][:description].empty? || params[:movie]["release_date(1i)"].empty? || params[:movie]["release_date(2i)"].empty? || params[:movie]["release_date(3i)"].empty?
      throw :invalid_movie_input
    end

    # TODO: Throw if release_date is in the past
    @movie = Movie.create!({
      title: params[:movie][:title],
      rating: params[:movie][:rating],
      description: params[:movie][:description],
      release_date: Date.new(params[:movie]["release_date(1i)"].to_i, params[:movie]["release_date(2i)"].to_i, params[:movie]["release_date(3i)"].to_i),
    })
    flash[:notice] = "Movie '#{@movie[:title]}' was successfully created."
    redirect_to movies_path
  end
end
