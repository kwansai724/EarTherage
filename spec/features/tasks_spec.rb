require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  before do
    visit root_path
    click_link "管理者・スタッフはこちら"
  end

  describe "新規作成機能" do

    context "正常系" do

      context "管理者は新しいブログを作成する" do
        scenario "admin creates new blog", js: true do
          admin = FactoryBot.create(:staff, :admin)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: "title0"
            fill_in "日時", with: DateTime.current
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
            expect(page).to have_button '作成する'
            click_link '戻る'
            expect(page).to have_content "スタッフブログ一覧"
            #expect(page).to have_content I18n.l(Date.today, format: :longdate)
            #expect(page).to have_content "管理者"
          }.to change(admin.blogs, :count).by(0)
        end
      end
    end
  end
end

