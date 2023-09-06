class TasksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @tasks = Task.where(list_id: @list.id)
  end

end
