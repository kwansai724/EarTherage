require 'rails_helper'

RSpec.feature "Blogs", type: :feature do

  # 管理者は新しいブログを作成する
  scenario "admin creates a new blog" do
    @admin = FactoryBot.create(:staff, :admin)
    visit root_path
    click_link "受講生の方はこちら"
    click_link "管理者・スタッフはこちら"
    fill_in "Eメール", with: @admin.email
    click_button 'ログイン'
    click_link "スタッフブログ投稿"
    expect {
      click_link "新規作成"
      fill_in "Title", with: "title"
      fill_in "Datetime", with: DateTime.now
      attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
      click_button '作成する'
    }.to change(@admin.blogs, :count).by(1)
  end

  # 管理者はブログを編集する
  scenario "admin edit a blog" do
    @admin_blog = FactoryBot.create(:blog, :admin)
    expect(Staff.find(@admin_blog.staff_id).name).to eq("管理者")
  end

  # スタッフはブログを編集する
  scenario "a staff edit a blog" do
    @blog = FactoryBot.create(:blog)
    expect(Staff.find(@blog.staff_id).name).to eq("staff1")
  end
end
