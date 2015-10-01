class AlbumsController < ApplicationController
  def index
  	@albums = Album.all.order(:artist, :year)
  end

  def show
  	@album = Album.find(params[:id])
  	@tracks = @album.tracks
  end

  def new
  	@album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
    	redirect_to albums_path
    else
      render 'new'
    end
  end

  def edit
  	@album = Album.find(params[:id])
  end

  def update
  	@album = Album.find(params[:id])
  	if @album.update_attributes(album_params)
  		redirect_to(:action => "show", :id => @album.id)
  	else
  		render "edit"
  	end
  end

  def destroy
  	@album = Album.find(params[:id])
  	@album.destroy
  	flash[:success] = "Album deleted"
  	redirect_to albums_url
  end

  private
  def album_params
  	params.require(:album).permit(:title, :artist, :year, :cd_number, :genre, :tracks_num, :label, :image, :listen)
  end
end
