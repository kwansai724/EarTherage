class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @staff = Staff.find(current_staff.id)
  end

  def new
    @blog = Blog.new
    @staff = Staff.find(params[:staff_id])
  end

  def create
    @blog = Blog.new(blog_params)
    @staff = Staff.find(params[:staff_id])
    if @blog.save!
      flash.now[:success] = "ブログを作成しました。"
      redirect_to staff_blogs_url(@staff)
    else
      render :new
    end
  end

  private

    def blog_params
      params.require(:blog).permit(:title, :date, :image_name, :share_with, :staff_id)
    end
end
