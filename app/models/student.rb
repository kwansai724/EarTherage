class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :course_type, inclusion: { in: ["therapist_training","self_care"] }

  def self.import(file)
    i = 1
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      # IDが見つかれば、レコードを呼び出し、見つからなければ、新しく作成
      student = find_by("id": i.to_s) || new

      # CSVからデータを取得し、設定する

      # hashのkeyを変更する
      hh = row.to_hash
      key_map = {}
      for ii in hh.keys do
        if ii == "名前"
          key_map.store(ii, "name")
        elsif ii == "メールアドレス"
          key_map.store(ii, "email")
        elsif ii == "電話番号"
          key_map.store(ii, "phone_number")
        else
          key_map.store(ii, ii)
        end
      end
      hh.transform_keys! {|k| key_map[k] }

      # hhから取ってくるカラムだけを選択してstudentに設定
      student.attributes = hh.slice(*updatable_attributes)
      # 足らないカラムの値を追加
      student.attributes = { course_type: "therapist_training", password: "password", password_confirmation: "password" }
      #保存する
      student.save
      i += 1
    end
  end

  def self.updatable_attributes
    ["name", "email", "phone_number"]
  end

end
