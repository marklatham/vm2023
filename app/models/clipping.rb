class Clipping < ApplicationRecord
  scope :clipping_search, ->(query) { where("title LIKE ? OR title_url LIKE ? OR to_char(date_sequence, 'YYYY-MM-DD') LIKE ? OR source LIKE ? OR source_url LIKE ? OR author LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") }
end
