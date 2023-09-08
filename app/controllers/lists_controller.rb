class ListsController < ApplicationController
  before_action :authenticate_user!

  attr_accessor :task_strings

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
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      create_tasks_from_strings(params[:list][:task_strings])
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
    Task.where(list: @list).destroy_all
    @list.destroy
    redirect_to lists_path, notice: "Liste supprimée avec succès."
  end

  private

  def list_params
    list_params = params.require(:list).permit(:name, task_strings: [])
    list_params[:task_strings].reject!(&:empty?) if list_params[:task_strings].present?
    list_params
  end

  def create_tasks_from_strings(task_strings)
    task_strings.each do |task_string|
      Task.create(name: task_string, list: @list, owner: current_user)
    end
  end

end
