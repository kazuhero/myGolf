class ToppagesController < ApplicationController
  def index
    if logged_in? 
      redirect_to new_course_path
    end
  end
end
