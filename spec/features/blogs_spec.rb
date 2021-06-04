require 'rails_helper'

RSpec.feature "Blogs", type: :feature do

  before do
    visit root_path
    click_link "受講生の方はこちら"
    click_link "管理者・スタッフはこちら"
  end

  describe "新規作成機能" do

    # 管理者は新しいブログを作成する
    scenario "admin creates new blog" do
      admin = FactoryBot.create(:staff, :admin)
      fill_in "Eメール", with: admin.email
      click_button 'ログイン'
      click_link "スタッフブログ投稿"
      expect(page).to have_content "スタッフブログ一覧"
      expect {
        click_link "新規作成"
        fill_in "Title", with: "title0"
        fill_in "Datetime", with: DateTime.current
        attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
        click_button '作成する'
        expect(page).to have_content "title0"
        expect(page).to have_content Date.today
        expect(page).to have_content "管理者"
      }.to change(admin.blogs, :count).by(1)
    end

    # スタッフは新しいブログを作成する
    scenario "a staff creates new blog" do
      staff = FactoryBot.create(:staff)
      fill_in "Eメール", with: staff.email
      click_button 'ログイン'
      click_link "スタッフブログ投稿"
      expect(page).to have_content "スタッフブログ一覧"
      expect {
        click_link "新規作成"
        fill_in "Title", with: "title1"
        fill_in "Datetime", with: DateTime.current
        attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
        click_button '作成する'
        expect(page).to have_content "title1"
        expect(page).to have_content Date.today
        expect(page).to have_content "staff1"
      }.to change(staff.blogs, :count).by(1)
    end

  end

  describe "一覧表示機能" do

    # 管理者はブログを一覧表示する
    scenario "admin lists blogs" do
      admin_blog = FactoryBot.create(:blog, :admin)
      blog = []
      4.times do |n|
          blog[n] = FactoryBot.create(:blog)
      end
      admin = Staff.find(admin_blog.staff_id)
      fill_in "Eメール", with: admin.email
      click_button 'ログイン'
      click_link "スタッフブログ投稿"
      expect(page).to have_content "スタッフブログ一覧"
      expect(page).to have_content admin_blog.title
      expect(page).to have_content Date.today
      expect(page).to have_content "管理者"
      expect(page).to have_content blog[0].title
      expect(page).to have_content "#{Staff.find(blog[0].staff_id).name}"
      expect(page).to have_content blog[1].title
      expect(page).to have_content "#{Staff.find(blog[1].staff_id).name}"
      expect(page).to have_content blog[2].title
      expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}"
      expect(page).to have_content blog[3].title
      expect(page).to have_content "#{Staff.find(blog[3].staff_id).name}"
    end

    # スタッフはブログを一覧表示する
    #scenario "a staff lists a blog" do
    #  blog = FactoryBot.create(:blog)
    #  staff = Staff.find(blog.staff_id)
    #  fill_in "Eメール", with: staff.email
    #  click_button 'ログイン'
    #  click_link "スタッフブログ投稿"
    #  expect(page).to have_content "スタッフブログ一覧"
    #  expect(page).to have_content blog.title
    #  expect(page).to have_content Date.today
    #  expect(page).to have_content "staff2"
    #end

  end

  describe "詳細表示機能" do

    context "管理者は管理者自身のブログを詳細表示する" do
      scenario "admin views admin's own blog in detail" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        4.times do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        admin = Staff.find(admin_blog.staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        click_link "show0"
        expect(page).to have_content "スタッフブログ詳細表示"
        expect(page).to have_content admin_blog.title
        expect(page).to have_content "管理者"
      end
    end

    context "管理者はスタッフのブログを詳細表示する" do
      scenario "admin views staff's blog in detail" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        4.times do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        admin = Staff.find(admin_blog.staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        click_link "show2"
        expect(page).to have_content "スタッフブログ詳細表示"
        expect(page).to have_content blog[1].title # = show - 1
        expect(page).to have_content "#{Staff.find(blog[1].staff_id).name}" #= show + 9
      end
    end

    #スタッフはブログを詳細表示する
    #scenario "a staff views blog details" do
    #  blog = FactoryBot.create(:blog)
    #  staff = Staff.find(blog.staff_id)
    #  fill_in "Eメール", with: staff.email
    #  click_button 'ログイン'
    #  click_link "スタッフブログ投稿"
    #  click_link "Show"
    #  expect(page).to have_content "スタッフブログ詳細表示"
    #  expect(page).to have_content blog.title
    #  expect(page).to have_content "MyString"
    #  expect(page).to have_content "staff4"
    #end

  end

  describe "編集機能" do

    context "管理者は管理者自身のブログを編集する" do
      scenario "admin edits admin's own blog" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        4.times do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        admin = Staff.find(admin_blog.staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        find(".edit0").click
        expect(page).to have_content "管理者のブログ編集"
        expect(page).to have_field("Title", with: admin_blog.title)
        fill_in "Title", with: admin_blog.title + "-updated"
        fill_in "Datetime", with: DateTime.current + 1
        attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
        click_button "編集する"
        expect(page).to have_content "ブログを更新しました。"
        expect(page).to have_content "スタッフブログ一覧"
        expect(page).to have_content admin_blog.title + "-updated"
        expect(page).to have_content Date.today + 1
        expect(page).to have_content "管理者"
      end
    end

    context "管理者はスタッフのブログを編集する" do
      scenario "admin edits staff's blog" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        4.times do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        admin = Staff.find(admin_blog.staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        find(".edit3").click
        expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}のブログ編集" # edit -1
        expect(page).to have_field("Title", with: blog[2].title) # edit -1
        fill_in "Title", with: blog[2].title + "-updated" # edit - 1
        fill_in "Datetime", with: DateTime.current + 1
        attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
        click_button "編集する" 
        expect(page).to have_content "ブログを更新しました。"
        expect(page).to have_content "スタッフブログ一覧"
        expect(page).to have_content blog[2].title + "-updated" # edit -1
        expect(page).to have_content Date.today + 1
        expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}" # edit + 17
      end
    end

  end

    describe "削除機能" do

    context "管理者は管理者自身のブログを削除する" do
      scenario "admin deteles admin's own blog" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        4.times do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        admin = Staff.find(admin_blog.staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        expect {
          find(".delete0").click
          expect(page).to have_content "ブログのデータを削除しました。"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to_not have_content admin_blog.title
          expect(page).to_not have_content "管理者"
        }.to change(admin.blogs, :count).by(-1)
      end
    end

    context "管理者はスタッフのブログを削除する" do
      scenario "admin deletes staff's blog" do
        #admin_blog = FactoryBot.create(:blog, :admin)
        admin = FactoryBot.create(:staff, :admin)
        blog = []
        4.times do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        #admin = Staff.find(admin_blog.staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        expect {
          find(".delete3").click
          expect(page).to have_content "ブログのデータを削除しました。"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to_not have_content blog[3].title
          expect(page).to_not have_content "#{Staff.find(blog[3].staff_id).name}"
        }.to change(Staff.find(blog[3].staff_id).blogs, :count).by(-1)
      end
    end

  end


end
