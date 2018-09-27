class BgPicturesController < ApplicationController
  before_action :require_login
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    @pictures = BgPicture.all
  end

  def show
    @picture = BgPicture.find(params[:id])
  end

  def new
    @picture = BgPicture.new
  end

  def create
    @picture.image = params[:bg_pictures][:image]
    @picture.mood = params[:bg_pictures][:mood]
  end

  def edit
    @picture = BgPicture.find(params[:id])
  end

  def update
    @picture = BgPicture.find(params[:id])
    # @picture.image = params[:bg_picture][:image]
    @picture.mood = params[:bg_picture][:mood]

    if @picture.save
      flash[:alert] = "Successfully updated picture"
      redirect_to bg_pictures_url
    else
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    flash[:alert] = "You have successfully deleted the picture."
    redirect_to bg_pictures_url
  end
end
