class BgPicturesController < ApplicationController
  before_action :require_login
  before_action :require_admin

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
  end

  def edit
    @picture = BgPicture.find(params[:id])
  end

  def update
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    flash[:alert] = "You have successfully deleted the picture."
    redirect_to bg_pictures_url
  end
end
