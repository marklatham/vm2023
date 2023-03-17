class PresentationsController < ApplicationController
  def index
    @presentations = Presentation.order(pdate: :desc)
  end
end
