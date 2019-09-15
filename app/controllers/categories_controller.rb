class CategoriesController < ApplicationController
  before_action :get_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params(:name))
    redirect_to category_path(@category)
  end

  def edit
  end

  def update
    @category.update(category_params(:name))
    redirect_to category_path(@category)
  end

  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params(*args)
    params.require(:category).permit(*args)
  end

end
