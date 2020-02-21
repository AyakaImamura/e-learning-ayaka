class AnswersController < ApplicationController
  def new  #check if all words are answered
    @answer = Answer.new
    @lesson = Lesson.find(params[:lesson_id])
    if@lesson.next_word.nil?
      redirect_to lesson_url(@lesson)
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
