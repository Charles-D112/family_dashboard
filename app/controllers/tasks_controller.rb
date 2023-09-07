class TasksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @tasks = Task.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_back(fallback_location: root_path, notice: 'Task was successfully created.')
    else
      render 'new'
    end
  end

  def search
    query = params[:query]
    @tasks = Task.where('name LIKE ?', "%#{query}%")

    render partial: 'tasks/search_results'
  end
end
