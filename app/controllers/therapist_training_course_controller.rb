class TherapistTrainingCourseController < ApplicationController
  before_action :authenticate_student!
  before_action :set_student

  def index
  end
end
