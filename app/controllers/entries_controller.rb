class EntriesController < ApplicationController
  before_action :require_login

  def index
    @entries = Entry.last_five_entry(current_user)
    if params[:from_date]
      date = params[:from_date][:date]
      # raise
      @entries = Entry.entry_search(date)
    end
  end

  def show
     @entry = Entry.find(params[:id])
     if @entry
       @entries = current_user.entries.reverse

       if @entries.length > 1
         @next_entry = User.next_entry(@entry, @entries)
         @previous_entry = User.previous_entry(@entry, @entries)
      end
    end
  end

  def create
    @entry = Entry.new
    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]
    @entry.user = current_user

    if params[:private] == false
      @title.private = false
    end

    @entry.bg_picture_id = 1
    @entry.mood = "Neutral"
    @entry.auto_mood = false

    if @entry.save
      flash[:alert] = "Success!"
      redirect_to "/entries"
    else
      flash[:alert] = "Failure!"
      render "entries/new"
    end
  end

  def new
    @entry = Entry.new
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to "/entries"
  end

  def update
    @entry = Entry.find(params[:id])

    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]
    @entry.user = current_user

    if params[:private] == false
      @title.private = false
    end

    @entry.bg_picture_id = 1
    @entry.mood = "Neutral"
    @entry.auto_mood = false

    if @entry.save
      flash[:alert] = "Successfully updated entry"
      redirect_to "/entries/#{@entry.id}"
    else
      render :edit
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end


end
