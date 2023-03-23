class VideosController < ApplicationController
  before_action :authenticate_admin_user!, except:[:index, :show]
  before_action :set_video, except: [:index, :new, :create]

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save!
      flash[:notice] = "Video create successfully"
    else
      flash[:alert] = "Somthing went wrong please try again later"
    end
    redirect_to videos_path
  end

  def update
    if @video.update!(video_params)
      flash[:notice] = "Video update successfully"
      redirect_to videos_path
    else
      flash[:alert] = "Somthing went wrong"
      redirect_to :edit
    end
  end

  private

  def set_video
    @video = Video.find_by(id: params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :tags, :category, :url, :transcript, :description)
  end
end
