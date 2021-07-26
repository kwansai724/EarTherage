class StaffsController < ApplicationController
  def index
    @staffs = Staff.order(created_at: "ASC").paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def destroy
    @staff.destroy
    flash[:success] = "「#{@staff.name}」のデータを削除しました。"
    redirect_to staffs_url
  end

end
