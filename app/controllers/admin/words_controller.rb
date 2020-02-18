class Admin::WordsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.new #左記は省略系。Word.new(category_id: params[:category_id])
    3.times{ @word.choices.new}
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.new(word_params)
    if @word.save
      redirect_to admin_category_url(@category)
    else
      render 'new'
    end
  end

  private #定義するためだけに存在するのでprivate
  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
  end
  
end
