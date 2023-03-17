class Presentation < ApplicationRecord
  scope :presentation_search, ->(query) { where("place LIKE ? OR to_char(pdate, 'YYYY-MM-DD') LIKE ? OR host LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%") }
end
