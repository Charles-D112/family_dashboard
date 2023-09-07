class TutosController < ApplicationController
  before_action :set_tuto, only: %i[show edit update destroy]

  def index
    @tutos = Tuto.all
  end

  def show
  end

  def new
    @tuto = Tuto.new
  end

  def create
    @tuto = Tuto.new(tuto_params)
    if @tuto.save
      redirect_to tutos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @tuto_photos = @tuto.photos
    @tuto.update(tuto_params)
    if tuto_params["photos"].join.empty?
      @tuto.update(photos: @tuto_photos)
    end
    redirect_to tuto_path(@tuto)
  end

  def destroy
    @tuto.destroy
    redirect_to tutos_path, status: :see_other
  end

  private

  def set_tuto
    @tuto = Tuto.find(params[:id])
  end

  def tuto_params
    params.require(:tuto).permit(:name, :description, :url, photos: [])
  end
end
