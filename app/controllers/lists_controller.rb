class ListsController < ApplicationController
  def index
    @list = current_user.lists
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @list.tasks.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
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

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: %i[id name])
  end
end
