class BackgroundsController < ApplicationController
  def index
    @background = Background.new
    @backgrounds = Background.all.order(created_at: :desc)
  end

  def create
    @background = Background.new(background_params)
    if @background.save
      flash[:notice] = "投稿しました！"
      redirect_to backgrounds_url
    else
      render :index
    end
  end

  def update
    @background = Background.find(params[:id])
    @background.update_attributes(default: true)
    flash[:notice] = "背景画像に設定しました"
    redirect_to backgrounds_url
  end

  private

    def background_params
      params.require(:background).permit(:image)
    end

end
