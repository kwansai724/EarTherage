class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date # 開催日
      t.integer :area # 地域
      t.string :place # 場所
      t.integer :teacher # セラピスト
      t.integer :event_type # 種類（イベントor講座）
      t.string :title # タイトル（イベント名・講座名）
      t.text :details # 詳細
      t.string :image # 画像
      t.integer :public_status, default: false, null: false # 公開状況
      t.boolean :judgement_of_members # 会員・非会員の判定

      t.timestamps
    end
  end
end
