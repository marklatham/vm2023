class Link < ApplicationRecord
  scope :link_search, ->(query) { where("title LIKE ? OR url LIKE ? OR category LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") }

  CATEGORIES = ['Condominium Governance', 'Co-op Reform', 'Democracy Software', 'Democratic Reform', 'Media Reform', 'Municipal Politics', 'Corporate Governance Blogs', 'Corp Gov Links Pages', 'Corp Gov Organizations', 'Corp Gov Research', 'Disclosure for Investors', 'Individual Investor Resources'].sort
end
