class TasksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @tasks = Task.where(list_id: @list.id)
  end

  def new
  end

  def create
    @task = Task.new(task_params)
  end

  def search
    query = params[:query]
    @tasks = Task.where('name LIKE ?', "%#{query}%")

    render partial: 'tasks/search_results'
  end

  def destroy
    @task = Task.find(params[:task_id])
    @task.delete
    redirect_to edit_list_path(:list_id), notice: "Tâche supprimée avec succès."
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :list_id)
  end
end
