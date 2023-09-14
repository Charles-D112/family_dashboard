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

  def complete_task
    task = Task.find_by(id: params[:id])

    unless task
      render json: { error: 'Task not found', success: false }, status: :not_found and return
    end

    new_status = params[:done] == "true"

    if task.update(done: new_status)
      new_status ? current_user.increment!(:total_points, 1) : current_user.decrement!(:total_points, 1)
      render json: { success: true }
    else
      render json: { error: 'Failed to update task', success: false }, status: :unprocessable_entity
    end
  end


  private

  def task_params
    params.require(:task).permit(:name, :description, :list_id)
  end
end
