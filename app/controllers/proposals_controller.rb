class ProposalsController < ApplicationController
  before_action :authenticate_admin_user!, except:[:index]
  before_action :set_proposal, except: [:index, :new, :create]

  def index
    @proposals = Proposal.order(date_submitted: :desc)
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save!
      flash[:notice] = "Proposal create successfully"
    else
      flash[:alert] = "Somthing went wrong please try again later"
    end
    redirect_to proposals_path
  end

  def update
    if @proposal.update!(proposal_params)
      flash[:notice] = "Proposal update successfully"
      redirect_to proposals_path
    else
      flash[:alert] = "Somthing went wrong"
      redirect_to :edit
    end
  end

  private

  def set_proposal
    @proposal = Proposal.find_by(id: params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:date_submitted, :date_agm, :company, :company_url, :ticker, :proposal_type, :proposal_url, :correspondence, :proxy_url, :in_proxy, :yes_percent)
  end
end
