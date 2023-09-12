class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
    @tasks = []
  end

  def show
    if params[:id].present?
      @list = List.find(params[:id])
    else
      redirect_to lists_path, alert: "La liste que vous cherchez n'existe pas."
    end
  end

  def new
    @list = List.new
    @task = Task.new
  end

  def create
    @task = Task.new
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      create_tasks_from_names(list_params[:task_names].last.split(","))
      redirect_to lists_path, notice: "#{@list.name} ajoutée à vos To-Do Lists!"
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path, notice: "#{@list.name} mise à jour avec succès!"
    else
      render :edit
    end
  end

  def remove_task
    @list = List.find(params[:list_id])
    task_to_remove = params[:task]
    return unless @list.task_names.delete(task_to_remove) && @list.save

    redirect_to edit_list_path(@list), notice: "La tâche a été supprimée avec succès."
  end

  def destroy
    @list = List.find(params[:id])
    Task.where(list: @list).destroy_all
    @list.destroy
    redirect_to lists_path, notice: "Liste supprimée avec succès."
  end

  private

  def list_params
    params.require(:list).permit(:name, task_names: [])
  end

  def create_tasks_from_names(task_strings)
    task_strings.each do |task_string|
      Task.create(name: task_string, list: @list, owner: current_user)
    end
  end
end
