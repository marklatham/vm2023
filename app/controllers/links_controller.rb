class LinksController < ApplicationController
  def index
    @links = Link.order(title: :asc)
  end
end
