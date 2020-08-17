class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path, notice: "#{@cocktail} was successfully destroyed."
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktails, notice: "#{@cocktail} was successfully updated."
    else
      render :edit
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
