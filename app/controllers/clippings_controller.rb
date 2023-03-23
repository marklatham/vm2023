class ClippingsController < ApplicationController
  before_action :authenticate_admin_user!, except:[:index]
  before_action :set_clipping, except: [:index, :new, :create]

  def index
    @clippings = Clipping.order(date_sequence: :desc)
  end

  def new
    @clipping = Clipping.new
  end

  def create
    @clipping = Clipping.new(clipping_params)
    if @clipping.save!
      flash[:notice] = "Clipping create successfully"
    else
      flash[:alert] = "Somthing went wrong please try again later"
    end
    redirect_to clippings_path
  end

  def update
    if @clipping.update!(clipping_params)
      flash[:notice] = "Clipping update successfully"
      redirect_to clippings_path
    else
      flash[:alert] = "Somthing went wrong"
      redirect_to :edit
    end
  end

  private

  def set_clipping
    @clipping = Clipping.find_by(id: params[:id])
  end

  def clipping_params
    params.require(:clipping).permit(:date_sequence, :date_text, :source, :source_url, :author, :title, :title_url, :description)
  end
end
