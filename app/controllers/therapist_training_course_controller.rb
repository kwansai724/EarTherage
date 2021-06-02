class TherapistTrainingCourseController < ApplicationController
  before_action :authenticate_student!
  before_action :set_students

  def index
  end

  def show
  end
end
