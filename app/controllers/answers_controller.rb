class AnswersController < ApplicationController
  def new  #check if all words are answered
    @answer = Answer.new
    @lesson = Lesson.find(params[:lesson_id])

    if @lesson.next_word.nil? #after the last word is finished, return to XXX page
      @lesson.update(result: @lesson.lesson_results) #lessonsテーブルのresultだけを編集するから
      @lesson.create_activity(user: current_user)
      redirect_to lesson_url(@lesson) #in show page: @lesson.result
    end
  end

  def create #Save answer
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.answers.create(answer_params)
    redirect_to new_lesson_answer_url(@lesson)
  end

  private
  def answer_params
    params.require(:answer).permit(:word_id,:choice_id)
  end
end
