class LessonsController < ApplicationController
  def create #index.htmlのstart learnボタンをおした時に飛ぶところを指定
    @category = Category.find(params[:category_id])#lessonはcategoryに紐づくから、先にカテゴリを書く
    @lesson = @category.lessons.create(user: current_user)
    redirect_to new_lesson_answer_url(@lesson) #←new_lesson_answer_urlでanswerscontrollerのnewメソッドへ飛ぶ
  end

  def show
  end
end