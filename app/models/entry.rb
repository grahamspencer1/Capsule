class Entry < ApplicationRecord
  before_validation :sentiment_response
  belongs_to :user
  belongs_to :bg_picture

  validates :title, length: { minimum: 3, maximum: 50 }, presence: true
  validates :content, length: { minimum: 3, maximum: 1500 }, presence: true

  def self.last_five_entry(current_user)
    result = current_user.entries.order('id desc').limit(5)
    return result
  end

  def self.entry_search(current_user, date)
    current_user.entries.where("created_at >= ? ", date)
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

    self.mood = response["type"]
  end
end
