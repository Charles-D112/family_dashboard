class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
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
    @list = current_user.lists.build(list_params)

    task_names = params[:list][:task_names].drop(1)

    task_names.each do |task_name|
      @list.tasks.build(name: task_name)
    end

    if @list.save
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

  def destroy
    @list = List.find(params[:id])
    return unless @list.destroy

    redirect_to lists_path, notice: "Liste supprimée avec succès."
  end

  private

  def list_params
    params.require(:list).permit(:name, tasks: [])
  end
end
