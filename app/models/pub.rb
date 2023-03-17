class Pub < ApplicationRecord
  scope :publication_search, ->(query) { where("title LIKE ? OR to_char(date, 'YYYY-MM-DD') LIKE ? OR country LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") }
end
