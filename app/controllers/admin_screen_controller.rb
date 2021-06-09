class AdminScreenController < ApplicationController
  def index
    @staff = current_staff
  end
end
