class Proposal < ApplicationRecord
  scope :proposal_search, ->(query) { where("to_char(date_submitted, 'YYYY-MM-DD') LIKE ? OR to_char(date_agm, 'YYYY-MM-DD') LIKE ? OR company LIKE ? OR company_url LIKE ? OR ticker LIKE ? OR proposal_type LIKE ? OR proposal_url LIKE ? OR correspondence LIKE ? OR proxy_url LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") }
end
