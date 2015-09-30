class AlbumsController < ApplicationController
  def index
  	@albums = Album.all.order(:artist, :year)
  end

  def show
  	@album = Album.find(params[:id])
  	@tracks = @album.tracks
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

  private
  def album_params
  	params.require(:album).permit(:title, :artist, :year, :cd_number, :genre, :tracks_num, :label, :image, :listen)
  end
end
