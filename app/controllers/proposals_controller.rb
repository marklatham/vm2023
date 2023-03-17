class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.order(date_submitted: :desc)
  end
end
