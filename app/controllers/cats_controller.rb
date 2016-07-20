class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def new
    @cat = Cat.new
    render :new
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(cat_params)

    if @cat.save
      redirect_to cat_url(params[:id])
    else
      render :edit
    end
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      # fail
      redirect_to cats_url
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :birth_date, :sex, :color, :description)
  end

  # what is the #new???
end
