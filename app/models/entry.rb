class Entry < ApplicationRecord
  before_validation :sentiment_response
  belongs_to :user
  belongs_to :bg_picture
  has_one_attached :image

  validates :title, length: { minimum: 3, maximum: 50 }, presence: true
  validates :content, length: { minimum: 3, maximum: 1500 }, presence: true

  def self.last_five_entry(current_user)
    result = current_user.entries.order('id desc').limit(5)
    return result
  end

  def self.entry_search(current_user, date)
    current_user.entries.where("created_at >= ? ", date).order('id desc')
  end

  def sentiment_response
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

    return self.mood = response["type"]
  end

  def self.unsplash_response(keyword)
    keyword = keyword.split.max_by{|word| word.length}
    response = HTTParty.get("https://api.unsplash.com/search/photos?client_id=#{ENV["UNSPLASH_KEY"]}&query=#{keyword}")
    response_json = JSON.parse(response.body)

    if response_json["results"].length != 0
      return response_json["results"].sample["urls"]["regular"]
    else
      return "jess-watters-684713-unsplash.jpg"
    end
  end
end
