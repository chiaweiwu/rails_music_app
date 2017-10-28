class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(params_album)
    if @album.save
      redirect_to albums_url(@album)
    else
      flash.new[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(params_band)
      redirect_to albums_url(@album)
    else
      flash.new[:errors] = @album.errors.full_messages
      render :edit
    end
  end


  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url
  end

  private
  def params_album
    params.require(:album).permit(:title,:year,:band_id,:genre)
  end
end
