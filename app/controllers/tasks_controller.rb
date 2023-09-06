class TasksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @tasks = Task.where(list_id: @list.id)
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_back(fallback_location: root_to('lists#new'), notice: 'Task was successfully created.')
    else
      render 'new'
    end
  end
end
