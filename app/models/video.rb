class Video < ApplicationRecord
  scope :video_search, ->(query) { where("title LIKE ? OR description LIKE ? OR tags LIKE ? OR category LIKE ? OR url LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") }
end
