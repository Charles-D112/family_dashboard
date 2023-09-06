class ListsController < ApplicationController

  def index
    @list = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    redirect_to lists_path(@list)
  end

  def new
    @list = List.new
    @list.tasks
    @existing_tasks = Task.all
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      new_task_names = params[:list][:new_tasks]
      new_task_names.each do |task_name|
        @list.tasks.create(name: task_name)
      end
      redirect_to lists_path, notice: "#{@list.name} ajoutée à vos To Do List!"
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

  def destroy
    @list = List.find(params[:id])
    return unless @list.destroy

    redirect_to lists_path, notice: "Liste supprimée avec succès."
  end

  private

  def list_params
    params.require(:list).permit(:name, :existing_task_id, tasks_attributes: %i[id name _destroy])
  end

  def add_existing_task
    existing_task_id = params[:list][:existing_task_id]
    return unless existing_task_id.present?

    existing_task = Task.find_by(id: existing_task_id)
    @list.tasks << existing_task if existing_task
  end

  def add_new_tasks
    new_task_names = params[:list][:new_tasks]
    new_task_names.each do |task_name|
      @list.tasks.create(name: task_name)
    end
  end
end
