class EntriesController < ApplicationController

  def index
    @entries = Entries.all
  end

  def show
    @entry = Entries.find(params[:id])
  end

  def create
    @entry = Entries.new
    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]

    # if params[:private] == "0"
    #   @title.private = false
    # end
    #
    # @entry.bg_picture_id
  end

  def new

  end

  def destroy

  end

  def update

  end

  def edit

  end


end
