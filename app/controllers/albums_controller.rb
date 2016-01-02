class AlbumsController < ApplicationController
  before_action :require_admin, only: [:new, :edit, :destroy, :create_track, :update_track, :destroy_track]

  def index
    @albums = Album.all.order(:artist, :year)
  end

  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks.order(:id)
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

  def create_track
    @album = Album.find(params[:id])
    @track = @album.tracks.new(track_params)
    if @track.save
      redirect_to(:action => "show", :id => @album.id)
    end
  end

  def update_track
    @album = Album.find(params[:id])
    @track = @album.tracks.find(params[:track_id])
    if @track.update_attributes(track_params)
      redirect_to(:action => "show", :id => @album.id)
    end
  end

  def destroy_track
    @album = Album.find(params[:id])
    @track = @album.tracks.find(params[:track_id])
    @track.destroy
    redirect_to(:action => "show", :id => @album.id)
  end

  private
  def album_params
    params.require(:album).permit(:title, :artist, :year, :cd_number, :genre, :tracks_num, :label, :image, :listen, tracks_attributes: [:name, :duration])
  end

  def track_params
    params.require(:track).permit(:name, :duration)
  end

end