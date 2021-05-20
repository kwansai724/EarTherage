class StudentsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_student

  def show
  end
end
