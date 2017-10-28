class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(params_band)
    if @band.save
      redirect_to bands_url(@band)
    else
      flash.new[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(params_band)
      redirect_to bands_url(@band)
    else
      flash.new[:errors] = @band.errors.full_messages
      render :edit
    end
  end


  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private
  def params_band
    params.require(:band).permit(:name)
  end
end
