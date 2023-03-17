class ClippingsController < ApplicationController
  def index
    @clippings = Clipping.order(date_sequence: :desc)
  end
end
