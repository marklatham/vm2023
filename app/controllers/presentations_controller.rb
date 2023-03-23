class PresentationsController < ApplicationController
  before_action :authenticate_admin_user!, except:[:index]
  before_action :set_presentation, except: [:index, :new, :create]

  def index
    @presentations = Presentation.order(pdate: :desc)
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)
    if @presentation.save!
      flash[:notice] = "Presentation create successfully"
    else
      flash[:alert] = "Somthing went wrong please try again later"
    end
    redirect_to presentations_path
  end

  def update
    if @presentation.update!(presentation_params)
      flash[:notice] = "Presentation update successfully"
      redirect_to presentations_path
    else
      flash[:alert] = "Somthing went wrong"
      redirect_to :edit
    end
  end

  private

  def set_presentation
    @presentation = Presentation.find_by(id: params[:id])
  end

  def presentation_params
    params.require(:presentation).permit(:pdate, :place, :host)
  end
end
