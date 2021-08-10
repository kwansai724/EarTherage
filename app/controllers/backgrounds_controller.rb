class BackgroundsController < ApplicationController
  before_action :admin_only
  before_action :set_background, only:[:update, :destroy]

  def index
    @background = Background.new
    @backgrounds = Background.all.order(created_at: :desc)
  end

  def create
    @background = Background.new(background_params)
    if @background.save
      flash[:notice] = "画像を追加しました"
      redirect_to backgrounds_url
    else
      render :index
    end
  end

  def update
    @no_background = Background.where(default: true)
    @no_background.update_all(default: false)
    @background.update_attributes(default: true)
    flash[:notice] = "背景画像に設定しました"
    redirect_to backgrounds_url
  end

  def destroy
    @background.destroy
    flash[:info] = "画像を削除しました。"
    redirect_to backgrounds_url
  end

  private

    def set_background
      @background = Background.find(params[:id])
    end


    def background_params
      params.require(:background).permit(:image)
    end

end
