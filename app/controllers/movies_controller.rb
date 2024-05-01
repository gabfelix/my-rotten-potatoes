class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update!({
      title: params[:movie][:title],
      rating: params[:movie][:rating],
      description: params[:movie][:description],
      release_date: Date.new(params[:movie]["release_date(1i)"].to_i, params[:movie]["release_date(2i)"].to_i, params[:movie]["release_date(3i)"].to_i),
    })
    flash[:notice] = "Movie '#{@movie.title}' was successfully updated."
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def create
    if params[:movie][:title].empty? || params[:movie][:rating].empty? || params[:movie][:description].empty? || params[:movie]["release_date(1i)"].empty? || params[:movie]["release_date(2i)"].empty? || params[:movie]["release_date(3i)"].empty?
      flash[:warning] = "Movie creation failed. Invalid data provided."
      redirect_to movies_path
      return
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
