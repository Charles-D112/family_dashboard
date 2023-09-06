class TropheesController < ApplicationController
  def index
    @trophee = current_user.total_points
  end
end
