class SelfCareCourseController < ApplicationController
  before_action :authenticate_student!
  before_action :set_student

  def index
  end
  
  def show
  end
end
