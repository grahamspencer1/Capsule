class EntriesController < ApplicationController
  before_action :require_login

  def index
    @entries = Entry.recent_entries(current_user)
    if params[:from_date]
      date = params[:from_date][:date]
      @entries = Entry.entry_search(current_user, date)
    end
  end

  def show
    @entry = Entry.find(params[:id])
    @entries = current_user.entries.reverse

    if @entry.private && @entry.user != current_user
      flash[:alert] = "You are not allowed to view this entry"
      redirect_to root_url
    end

    if @entries.length > 1
      @next_entry = User.next_entry(@entry, @entries)
      @previous_entry = User.previous_entry(@entry, @entries)
    end
  end

  def new
    @entry = Entry.new
    @bg_picture = BgPicture.new
    @pictures = BgPicture.all
  end

  def create
    @entry = Entry.new
    @bg_picture = BgPicture.new
    @pictures = BgPicture.all
    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]
    @entry.user = current_user
    @entry.private = params[:entry][:private]
    @entry.auto_mood = params[:entry][:auto_mood]
    @entry.image.attach(params[:entry][:image])

    if @entry.title == "" || @entry.content == ""
      flash[:alert] = "The title and/or content can not be empity"
      @pictures = BgPicture.all
      return redirect_to "/entries/new"
    end

    if @entry.auto_mood
      @entry.mood = Entry.sentiment_response(@entry.content)
      @bg_picture.image = Entry.unsplash_response(@entry.content, @entry.mood)
      @entry.bg_picture = @bg_picture
    else
      @entry.mood = "neutral"
      if @entry.content.length >= 3
        @bg_picture = BgPicture.find(params[:entry][:bg_picture_id])
        @entry.bg_picture = @bg_picture
      else
        @pictures = BgPicture.all

     end

  end


    if @entry.save
      if @entry.mood
        @bg_picture.mood = @entry.mood
        @bg_picture.save
      end
      flash[:alert] = "Time capsule created - After today, you won't be able to edit this entry!"
      redirect_to entries_url
    else
      flash[:alert] = "Entry not saved! Please try again"
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])

    if @entry.user != current_user
      flash[:alert] = "You are not allowed to delete this entry"
      return redirect_to root_url
    end

    @entry.destroy
    redirect_to entries_url
  end

  def update
    @entry = Entry.find(params[:id])
    @bg_picture = @entry.bg_picture
    @bg_picture = BgPicture.new
    @pictures = BgPicture.all

    if @entry.user != current_user
      flash[:alert] = "You are not allowed to edit this entry"
      return redirect_to root_url
    end

    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]
    @entry.user = current_user
    @entry.private = params[:entry][:private]
    @entry.auto_mood = params[:entry][:auto_mood]

    if @entry.title == "" || @entry.content == ""
     flash[:alert] = "The title and/or content can not be empity"
     @pictures = BgPicture.all
     return redirect_to "/entries/#{@entry.id}"
    end

    if @entry.auto_mood
      @entry.mood = Entry.sentiment_response(@entry.content)
      @bg_picture.image = Entry.unsplash_response(@entry.content, @entry.mood)
      @entry.bg_picture = @bg_picture
    else
      @entry.mood = "neutral"
      @bg_picture = BgPicture.find(params[:entry][:bg_picture_id])
      @entry.bg_picture = @bg_picture
    end

    if params[:entry][:image] != nil
      @entry.image.attach(params[:entry][:image])
      # params.require(:entry).permit(:image)
    end

    if @entry.save
      if @entry.mood
        @bg_picture.mood = @entry.mood
        @bg_picture.save
      end
      flash[:alert] = "Entry successfully updated"
      redirect_to entries_url(@entry)
    else
      flash[:alert] = "Entry not saved! Please try again"
      render :edit
    end
  end

  def edit
    @entry = Entry.find(params[:id])
    @pictures = BgPicture.all
    @bg_picture = BgPicture.new
    today = Time.now
    today_date = today.strftime("%d %b %Y")

    if @entry.user != current_user
      flash[:alert] = "You are not allowed to edit this entry"
      return redirect_to root_url
    end

    if @entry.created_at < today_date
      flash.now[:alert] = "Entries cannot be edited beyond the day they were made - Learn to appreciate how you felt this day!"
      render :show
    end
  end

  def public
    @public_entries = Entry.where(private: false).shuffle
  end
end
