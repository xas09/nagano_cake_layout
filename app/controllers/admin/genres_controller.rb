class Admin::GenresController < Admin::ApplicationController
  def index
    @newgenre = Genre.new
    @genres = Genre.all
  end

  def create
    @newgenre = Genre.new(genre_params)
    @newgenre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end
  
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
