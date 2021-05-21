class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]


  # スケジュール一覧
  def index
    @schedules = Schedule.all.order(date: "DESC")
  end

  # スケジュール詳細
  def show
  end

  # スケジュール作成
  def new
    @schedule = Schedule.new
  end

  # スケジュール作成・保存
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:success] = 'スケジュールを作成しました。'
      redirect_to @schedule
    else
      render :new
    end
  end

  # スケジュール編集
  def edit
  end

  # スケジュール更新
  def update
  end

  # スケジュール削除
  def destroy
  end


  private

      def schedule_params
        # params.require(:schedule).permit(:date, :area, :place, :teacher, :type, :title, :details, :image, :public_status, :judgment_of_menbers)
        params.require(:schedule).permit(:details, :image)
      end

end
