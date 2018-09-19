class EntriesController < ApplicationController
  before_action :require_login

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

    if params[:private] == false
      @title.private = false
    end

    @entry.bg_picture_id = 1

    if @entry.save
      flash[:alert] = "Success!"
      redirect_to "/entries"
    else
      flash[:alert] = "Failure!"
      render :new
    end
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
