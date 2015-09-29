class AlbumsController < ApplicationController
  def index
  	@albums = Album.all.order(:artist, :year)
  end

  def show
  	@album = Album.find(params[:id])
  	@tracks = @album.tracks
  end
end
