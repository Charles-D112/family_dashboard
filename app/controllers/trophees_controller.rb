class TropheesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trophee = current_user.total_points
    @users = User.all.sort_by { |user| user.my_executed_tasks }.reverse
  end
end
