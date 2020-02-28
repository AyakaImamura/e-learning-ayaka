class StaticPagesController < ApplicationController
  def home
    if logged_in?
      render "users/dashboard"
    end
  end
end
