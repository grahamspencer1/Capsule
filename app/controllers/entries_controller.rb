class EntriesController < ApplicationController

  def index
    @entries = Entry.last_five_entry
    if params[:from_date]
      date = params[:from_date][:date]
      # raise
      @entries = Entry.entry_search(date)
    end
  end

  def show
     @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new
    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]

    # if params[:private] == "0"
    #   @title.private = false
    # end
    #
    # @entry.bg_picture_id
  end

  def new
    @entry = Entry.new
  end

  def destroy

  end

  def update

  end

  def edit
    @entry = Entry.find(params[:id])
  end


end
