class LinksController < ApplicationController
  before_action :authenticate_admin_user!, except:[:index]
  before_action :set_link, except: [:index, :new, :create]

  def index
    @links = Link.order(title: :asc)
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save!
      flash[:notice] = "Link create successfully"
    else
      flash[:alert] = "Somthing went wrong please try again later"
    end
    redirect_to links_path
  end

  def update
    if @link.update!(link_params)
      flash[:notice] = "Link update successfully"
      redirect_to links_path
    else
      flash[:alert] = "Somthing went wrong"
      redirect_to :edit
    end
  end

  private

  def set_link
    @link = Link.find_by(id: params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url, :category, :description)
  end
end
