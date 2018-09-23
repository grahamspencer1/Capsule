class EntriesController < ApplicationController
  before_action :require_login

  def index
    @entries = Entry.last_five_entry(current_user)
    if params[:from_date]
      date = params[:from_date][:date]
      @entries = Entry.entry_search(current_user, date)
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

  def categoryshow
    @entry = entry.find(params[:private])
  end

  def create
    @entry = Entry.new
    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]
    @entry.user = current_user
    @entry.private = params[:entry][:private]
    @entry.bg_picture_id = 1
    @entry.auto_mood = params[:entry][:auto_mood]

    if @entry.auto_mood
      @entry.mood = Entry.sentiment_response(@entry.content)
    else
      @entry.mood = "neutral"
    end

    if @entry.save
      flash[:alert] = "Time capsule created - After today, you won't be able to edit this entry!"
      redirect_to "/entries"
    else
      flash[:alert] = "Entry not saved! Please try again"
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
    @entry.private = params[:entry][:private]
    @entry.auto_mood = params[:entry][:auto_mood]

    @entry.bg_picture_id = 1

    if @entry.auto_mood
      @entry.mood = Entry.sentiment_response(@entry.content)
    else
      @entry.mood = "neutral"
    end

    if @entry.save
      flash[:alert] = "Entry successfully updated"
      redirect_to "/entries/#{@entry.id}"
    else
      render :edit
    end
  end

  def edit
    @entry = Entry.find(params[:id])
    today = Time.now
    today_date = today.strftime("%d %b %Y")
    if @entry.created_at < today_date
      flash.now[:alert] = "Entries cannot be edited beyond the day they were made - Learn to appreciate how you felt this day!"
      render :show
    end
  end
end
