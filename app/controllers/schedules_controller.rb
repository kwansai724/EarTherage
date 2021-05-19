class SchedulesController < ApplicationController
  # スケジュール一覧
  def index
    @schedules = Schedule.all.order(date: "DESC")
  end

  # スケジュール詳細
  def show
  end

  # スケジュール編集
  def edit
  end

  # スケジュール更新
  def update
  end

  # スケジュール作成
  def new
  end

  # スケジュール作成・保存
  def create
  end

  # スケジュール削除
  def destroy
  end

end
