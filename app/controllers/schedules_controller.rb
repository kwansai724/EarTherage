class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]


  # スケジュール一覧
  def index
    @schedules = Schedule.all.order(created_at: "DESC")
    # if params[:search].present?
    #   @schedules = Schedule.paginate(page: params[:page]).search(params[:search]) 
    # end

#追加分-------------------------------------------------------------------
    if params[:area].present?
      @schedules = @schedules.get_by_area params[:area]
      # @schedules = Schedule.areas.key(params[:area].to_i)
    end
    if params[:event_type].present?
      @schedules = @schedules.get_by_event_type params[:event_type]
    end
    if params[:teacher].present?
      @schedules = @schedules.get_by_teacher params[:teacher]
    end
#--------------------------------------------------------------------------    
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
      flash[:success] = '新規投稿しました。'
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
    if @schedule.update_attributes!(schedule_params)
      flash[:success] = "更新しました。"
      redirect_to @schedule
    else
      render :edit
    end
  end

  # スケジュール削除
  def destroy
    @schedule.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to schedules_url
  end


  private

      def schedule_params
        params.require(:schedule).permit(:date, :area, :place, :teacher, :event_type, :title, :details, :image, :public_status, :judgment_of_menbers)
        # params.require(:schedule).permit(:details, :image)
      end

end
