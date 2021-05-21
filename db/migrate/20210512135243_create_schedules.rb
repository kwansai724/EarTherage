class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date # 日付
      t.string :area # 地域
      t.string :place # 場所
      t.string :teacher # 講師
      t.string :type # 種類（イベントor講座）
      t.string :title # タイトル（イベント名・講座名）
      t.text :details # 詳細
      t.string :image # 画像
      t.string :public_status # 公開状況
      t.boolean :judgment_of_menbers # 会員・非会員の判定

      t.timestamps
    end
  end
end
