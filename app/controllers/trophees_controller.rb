class TropheesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trophee = current_user.total_points
  end
end
