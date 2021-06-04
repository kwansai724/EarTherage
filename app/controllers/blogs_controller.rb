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
    if @blog.save
      flash.now[:success] = "ブログを作成しました。"
      redirect_to staff_blogs_url(@staff)
    else
      flash.now[:danger] = "#{@blog.errors.full_messages}" if @blog.errors.present?
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @staff = Staff.find(params[:staff_id])
  end

  def edit
    @blog = Blog.find(params[:id])
    @staff = Staff.find(@blog.staff_id)
  end

  def update
    @blog = Blog.find(params[:id])
    @staff = Staff.find(@blog.staff_id)
    if @blog.update_attributes(blog_params)
      flash[:success] = "ブログを更新しました。"
      redirect_to staff_blogs_url(@staff)
    else
      flash.now[:danger] = "#{@blog.errors.full_messages}" if @blog.errors.present?
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @staff = Staff.find(@blog.staff_id)
    @blog.destroy
    flash[:success] = "ブログのデータを削除しました。"
    redirect_to staff_blogs_url(@staff)
  end

  private

    def blog_params
      params.require(:blog).permit(:title, :datetime, :image, :share_with, :staff_id)
    end
end
