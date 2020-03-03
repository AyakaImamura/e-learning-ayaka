class Admin::CategoriesController < ApplicationController
  before_action :check_admin

  def new
    @category = Category.new
  end

  def index
    #@categories = Category.all 全部表示させる
    @categories = Category.paginate(page: params[:page], per_page:5)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @words = @category.words
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

end
