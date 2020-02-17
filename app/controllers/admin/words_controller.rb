class Admin::WordsController < ApplicationController
  def new
    @word = Word.new
  end
end
