class AlbumsController < ApplicationController
  def index
  	@albums = Album.all.order(:artist, :year)
  end

  def show
  end
end
