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
    @entries = current_user.entries.reverse

    if @entry.private && @entry.user != current_user
      flash[:alert] = "You are not allowed to view this entry"
      redirect_to root_path
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

    @entry.image.attach(params[:entry][:image])

    @entry.title = params[:entry][:title]
    @entry.content = params[:entry][:content]
    @entry.user = current_user
    @entry.private = params[:entry][:private]
    @entry.auto_mood = params[:entry][:auto_mood]

    if @entry.title == "" || @entry.content == ""
      flash[:alert] = "The title and/or content can not be empity"
      @pictures = BgPicture.all
      return redirect_to "/entries/new"
    end

    if @entry.auto_mood
      if @entry.content.length >= 3
        @bg_picture.image = Entry.unsplash_response(@entry.content)
        @entry.bg_picture = @bg_picture
      else
        @pictures = BgPicture.all
      end
    else
      @entry.mood = "neutral"
    if @entry.content.length >= 3
        @entry.bg_picture_id = params[:entry][:bg_picture_id]
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
      redirect_to "/entries"
    else
      flash[:alert] = "Entry not saved! Please try again"
      render "entries/new"
    end
  end

  def destroy
    @entry = Entry.find(params[:id])

    if @entry.user != current_user
      flash[:alert] = "You are not allowed to delete this entry"
      return redirect_to root_path
    end

    @entry.destroy
    redirect_to "/entries"
  end

  def update
    @entry = Entry.find(params[:id])
    @bg_picture = @entry.bg_picture

    if @entry.user != current_user
      flash[:alert] = "You are not allowed to edit this entry"
      return redirect_to root_path
    end

    if @entry.user != current_user
      flash[:alert] = "You are not allowed to edit this entry"
      return redirect_to root_path
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
      if @entry.content.length >= 3
        @bg_picture = BgPicture.new
        @bg_picture.image = Entry.unsplash_response(@entry.content)
        @entry.bg_picture = @bg_picture
      else
        @pictures = BgPicture.all
      end
    else
      @entry.mood = "neutral"
      if @entry.content.length >= 3
        @entry.bg_picture_id = params[:entry][:bg_picture_id]
      else
        @pictures = BgPicture.all
      end
    end

    if @entry.save
      if @entry.mood
        @bg_picture.mood = @entry.mood
        @bg_picture.save
      end
      flash[:alert] = "Entry successfully updated"
      redirect_to "/entries/#{@entry.id}"
    else
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
      return redirect_to root_path
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
