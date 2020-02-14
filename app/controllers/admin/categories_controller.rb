class Admin::CategoriesController < ApplicationController
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

  def edit
    @category = Category.find(params[:id])
  end

  def update

  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

end
