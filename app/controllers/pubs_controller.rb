class PubsController < ApplicationController
  before_action :authenticate_admin_user!, except:[:index]
  before_action :set_pub, except: [:index, :new, :create]

  def index
    @pubs = Pub.all
  end

  def new
    @pub = Pub.new
  end

  def create
    @pub = Pub.new(pub_params)
    if @pub.save!
      flash[:notice] = "Pub create successfully"
    else
      flash[:alert] = "Somthing went wrong please try again later"
    end

    redirect_to pubs_path
  end

  def update
    if @pub.update!(pub_params)
      flash[:notice] = "Pub update successfully"
      redirect_to pubs_path
    else
      flash[:alert] = "Somthing went wrong"
      redirect_to :edit
    end
  end

  private

  def set_pub
    @pub = Pub.find_by(id: params[:id])
  end

  def pub_params
    params.require(:pub).permit(:date, :title, :pages, :stars, :country, :description)
  end
end
