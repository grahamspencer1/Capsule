class Entry < ApplicationRecord
  # before_validation :sentiment_response
  belongs_to :user
  belongs_to :bg_picture
  has_one_attached :image

  validates :title, length: { minimum: 3, maximum: 50 }, presence: true
  validates :content, length: { minimum: 3, maximum: 1500 }, presence: true
  validate :check_image_file_type

  def self.recent_entries(current_user)
    result = current_user.entries.order('id desc').limit(10)
    return result
  end

  def self.entry_search(current_user, date)
    current_user.entries.where("created_at >= ? ", date).order('id desc')
  end

  def self.sentiment_response(content)
    query = {"text" => "#{content}"}
    headers = {
      "X-Mashape-Key" => "#{ENV["SENTIMENT_KEY"]}",
      "Accept" => "application/json"
    }

    response = HTTParty.post(
      "https://twinword-sentiment-analysis.p.mashape.com/analyze/",
      :query => query,
      :headers => headers
    )
    return response["type"]
  end

  def self.unsplash_response(keyword, mood)
    keyword = keyword.split.max_by{|word| word.length}

    if mood == "positive"
      custom_keyword = ["sun", "summer", "laughter", "calm", "bright"].sample
    elsif mood == "negative"
      custom_keyword = ["rain", "storm", "tears", "dark", "gloomy"].sample
    else
      custom_keyword = ["coffee", "code", "computer", "notebook", "photo"].sample
    end

    response = HTTParty.get("https://api.unsplash.com/search/photos?client_id=#{ENV["UNSPLASH_KEY"]}&query=#{keyword}+#{custom_keyword}")
    response_json = JSON.parse(response.body)

    # if response_json["results"].length != 0
      return response_json["results"].sample["urls"]["regular"]
    # else
      # return "jess-watters-684713-unsplash.jpg"
    # end
  end

  # def custom_keyword
  #   if self.mood == "positive"
  #     keyword = ["sun", "summer", "laughter", "calm", "bright"].sample
  #   elsif self.mood == "negative"
  #     keyword = ["rain", "storm", "tears", "dark", "gloomy"].sample
  #   else
  #     keyword = ["coffee", "code", "computer", "notebook", "photo"].sample
  #   end
  #   return keyword
  # end

  private

  def check_image_file_type
    if image.attached? && !image.blob.content_type.in?(%w(image/png image/jpeg image/gif))
      image.purge
      errors.add(:image, "Must be a JPEG, PNG, or GIF")
    end
  end
end
