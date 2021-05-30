require 'rails_helper'

RSpec.feature "Blogs", type: :feature do
  # ユーザーは新しいブログを作成する
  scenario "admin creates a new blog" do
    admin = FactoryBot.create(:staff, :admin)
    visit root_path
    click_link "受講生の方はこちら"
    click_link "管理者・スタッフはこちら"
    fill_in "Eメール", with: admin.email
    click_button 'ログイン'
    expect {
      click_link "スタッフブログ投稿"
      click_link "新規作成"
      fill_in "Title", with: "title"
      fill_in "Datetime", with: DateTime.now
      attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
      click_button '作成する'
    }.to change(admin.blogs, :count).by(1)
  end
end
