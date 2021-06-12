require 'rails_helper'

RSpec.feature "Blogs", type: :feature do

  before do
    visit root_path
    click_link "管理者・スタッフはこちら"
  end

  describe "新規作成機能" do

    context "正常系" do

      context "管理者は新しいブログを作成する" do
        scenario "admin creates new blog" do
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
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          }.to change(admin.blogs, :count).by(1)
        end
      end

      context "スタッフは新しいブログを作成する" do 
        scenario "a staff creates new blog" do
          staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: "title1"
            fill_in "日時", with: DateTime.current
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
            click_button '作成する'
            expect(page).to have_content "title1"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content staff.name
          }.to change(staff.blogs, :count).by(1)
        end
      end
    end

    context "異常系" do

      context "管理者はタイトルの無い新しいブログを作成する" do
        scenario "admin creates new blog without a title" do
          admin = FactoryBot.create(:staff, :admin)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: ""
            fill_in "日時", with: DateTime.current
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
            click_button '作成する'
            expect(page).to have_content "タイトルを入力してください"
            expect(page).to have_content "スタッフブログ作成"
          }.to change(admin.blogs, :count).by(0)
        end
      end

      context "管理者は日時の無い新しいブログを作成する" do
        scenario "admin creates new blog without datetime" do
          admin = FactoryBot.create(:staff, :admin)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: "title0"
            fill_in "日時", with: ""
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
            click_button '作成する'
            expect(page).to have_content "日時を入力してください"
            expect(page).to have_content "スタッフブログ作成"
          }.to change(admin.blogs, :count).by(0)
        end
      end

      context "管理者はタイトルと日時の無い新しいブログを作成する" do
        scenario "admin creates new blog without a title and datetime" do
          admin = FactoryBot.create(:staff, :admin)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: ""
            fill_in "日時", with: ""
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
            click_button '作成する'
            expect(page).to have_content "タイトルを入力してください"
            expect(page).to have_content "日時を入力してください"
            expect(page).to have_content "スタッフブログ作成"
          }.to change(admin.blogs, :count).by(0)
        end
      end

      context "スタッフはタイトルの無い新しいブログを作成する" do 
        scenario "a staff creates new blog without a title" do
          staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: ""
            fill_in "日時", with: DateTime.current
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
            click_button '作成する'
            expect(page).to have_content "タイトルを入力してください"
            expect(page).to have_content "スタッフブログ作成"
          }.to change(staff.blogs, :count).by(0)
        end
      end

      context "スタッフは日時の無い新しいブログを作成する" do 
        scenario "a staff creates new blog without datetime" do
          staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: "title1"
            fill_in "日時", with: ""
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
            click_button '作成する'
            expect(page).to have_content "日時を入力してください"
            expect(page).to have_content "スタッフブログ作成"
          }.to change(staff.blogs, :count).by(0)
        end
      end

      context "スタッフはタイトルと日時の無い新しいブログを作成する" do 
        scenario "a staff creates new blog without a title and datetime" do
          staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: ""
            fill_in "日時", with: ""
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
            click_button '作成する'
            expect(page).to have_content "タイトルを入力してください"
            expect(page).to have_content "日時を入力してください"
            expect(page).to have_content "スタッフブログ作成"
          }.to change(staff.blogs, :count).by(0)
        end
      end

    end

  end

  describe "一覧表示機能" do

    context "管理者はブログを一覧表示する" do
      scenario "admin lists blogs" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        admin = Staff.find(admin_blog.staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        expect(page).to have_content "スタッフブログ一覧"
        expect(page).to have_content admin_blog.title
        expect(page).to have_content I18n.l(Date.today, format: :longdate)
        expect(page).to have_content "管理者"
        expect(page).to have_content blog[1].title
        expect(page).to have_content "#{Staff.find(blog[1].staff_id).name}"
        expect(page).to have_content blog[2].title
        expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}"
        expect(page).to have_content blog[3].title
        expect(page).to have_content "#{Staff.find(blog[3].staff_id).name}"
        expect(page).to have_content blog[4].title
        expect(page).to have_content "#{Staff.find(blog[4].staff_id).name}"
      end
    end

    context "スタッフはブログを一覧表示する" do
      scenario "a staff lists blogs" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        staff = Staff.find(blog[1].staff_id)
        fill_in "Eメール", with: staff.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        expect(page).to have_content "スタッフブログ一覧"
        expect(page).to have_content admin_blog.title
        expect(page).to have_content I18n.l(Date.today, format: :longdate)
        expect(page).to have_content "管理者"
        expect(page).to have_content blog[1].title
        expect(page).to have_content "#{Staff.find(blog[1].staff_id).name}"
        expect(page).to have_content blog[2].title
        expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}"
        expect(page).to have_content blog[3].title
        expect(page).to have_content "#{Staff.find(blog[3].staff_id).name}"
        expect(page).to have_content blog[4].title
        expect(page).to have_content "#{Staff.find(blog[4].staff_id).name}"
      end
    end

  end

  describe "詳細表示機能" do

    context "管理者は管理者自身のブログを詳細表示する" do
      scenario "admin views admin's own blog in detail" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        1.upto 4 do |n|
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
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        admin = Staff.find(admin_blog.staff_id)
        staff = Staff.find(blog[1].staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        click_link "show1"
        expect(page).to have_content "スタッフブログ詳細表示"
        expect(page).to have_content blog[1].title # = show - 1
        expect(page).to have_content staff.name
      end
    end

    context "スタッフは管理者のブログを詳細表示する" do
      scenario "a staff views admin's blog details" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        log_in_staff = Staff.find(blog[2].staff_id)
        fill_in "Eメール", with: log_in_staff.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        click_link "show0"
        expect(page).to have_content "スタッフブログ詳細表示"
        expect(page).to have_content admin_blog.title
        expect(page).to have_content "管理者"
      end
    end

    context "スタッフは自身のブログを詳細表示する" do
      scenario "a staff views his own blog details" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        staff = Staff.find(blog[3].staff_id)
        fill_in "Eメール", with: staff.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        click_link "show3"
        expect(page).to have_content "スタッフブログ詳細表示"
        expect(page).to have_content blog[3].title
        expect(page).to have_content staff.name
      end
    end

    context "スタッフは別スタッフのブログを詳細表示する" do
      scenario "a staff views another staff's blog details" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        log_in_staff = Staff.find(blog[2].staff_id)
        staff = Staff.find(blog[3].staff_id) # = show -1
        fill_in "Eメール", with: log_in_staff.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        click_link "show3"
        expect(page).to have_content "スタッフブログ詳細表示"
        expect(page).to have_content blog[3].title # = show -1
        expect(page).to have_content staff.name
      end
    end

  end

  describe "編集機能" do

    context "正常系" do

      context "管理者は管理者自身のブログを編集する" do
        scenario "admin edits his own blog" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          admin = Staff.find(admin_blog.staff_id)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit0").click
          expect(page).to have_content "管理者のブログ編集"
          expect(page).to have_field("タイトル", with: admin_blog.title)
          fill_in "タイトル", with: admin_blog.title + "-updated"
          fill_in "日時", with: DateTime.current + 1
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "ブログを更新しました。"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to have_content admin_blog.title + "-updated"
          expect(page).to have_content I18n.l(Date.today + 1, format: :longdate)
          expect(page).to have_content "管理者"
        end
      end

      context "管理者はスタッフのブログを編集する" do
        scenario "admin edits staff's blog" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          admin = Staff.find(admin_blog.staff_id)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit2").click
          expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}のブログ編集" # edit -1
          expect(page).to have_field("タイトル", with: blog[2].title) # edit -1
          fill_in "タイトル", with: blog[2].title + "-updated" # edit - 1
          fill_in "日時", with: DateTime.current + 1
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する" 
          expect(page).to have_content "ブログを更新しました。"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to have_content blog[2].title + "-updated" # edit -1
          expect(page).to have_content I18n.l(Date.today + 1, format: :longdate)
          expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}" # edit + 17
        end
      end

      context "スタッフは自分自身のブログを編集する" do
        scenario "admin edits his own blog" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          staff = Staff.find(blog[2].staff_id)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit2").click
          expect(page).to have_content "#{staff.name}のブログ編集" # edit -1
          expect(page).to have_field("タイトル", with: blog[2].title) # edit -1
          fill_in "タイトル", with: blog[2].title + "-updated" # edit - 1
          fill_in "日時", with: DateTime.current + 1
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する" 
          expect(page).to have_content "ブログを更新しました。"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to have_content blog[2].title + "-updated" # edit -1
          expect(page).to have_content I18n.l(Date.today + 1, format: :longdate)
          expect(page).to have_content "#{staff.name}"
        end
      end

      context "スタッフ自身の編集ボタンのみ表示される" do
        scenario "staff finds his own edit button" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          staff = Staff.find(blog[1].staff_id)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page.all(".edit0").empty?).to eq true
          expect(page.all(".edit1").empty?).to eq false
          expect(page.all(".edit2").empty?).to eq true
          expect(page.all(".edit3").empty?).to eq true
          expect(page.all(".edit4").empty?).to eq true
        end
      end

    end

    context "異常系" do

      context "管理者はタイトルの無い管理者自身のブログを編集する" do
        scenario "admin edits admin's own blog without a title" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          admin = Staff.find(admin_blog.staff_id)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit0").click
          expect(page).to have_content "管理者のブログ編集"
          expect(page).to have_field("タイトル", with: admin_blog.title)
          fill_in "タイトル", with: ""
          fill_in "日時", with: DateTime.current + 1
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "タイトルを入力してください"
          expect(page).to have_content "管理者のブログ編集"
        end
      end

      context "管理者は日時の無い管理者自身のブログを編集する" do
        scenario "admin edits admin's own blog without datetime" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          admin = Staff.find(admin_blog.staff_id)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit0").click
          expect(page).to have_content "管理者のブログ編集"
          expect(page).to have_field("タイトル", with: admin_blog.title)
          fill_in "タイトル", with: admin_blog.title + "-updated"
          fill_in "日時", with: ""
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "日時を入力してください"
          expect(page).to have_content "管理者のブログ編集"
        end
      end

      context "管理者はタイトルと日時の無い管理者自身のブログを編集する" do
        scenario "admin edits admin's own blog without a title and datetime" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          admin = Staff.find(admin_blog.staff_id)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit0").click
          expect(page).to have_content "管理者のブログ編集"
          expect(page).to have_field("タイトル", with: admin_blog.title)
          fill_in "タイトル", with: ""
          fill_in "日時", with: ""
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "タイトルを入力してください"
          expect(page).to have_content "日時を入力してください"
          expect(page).to have_content "管理者のブログ編集"
        end
      end

      context "管理者はタイトルの無いスタッフのブログを編集する" do
        scenario "admin edits staff's blog without a title" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          admin = Staff.find(admin_blog.staff_id)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit2").click
          expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}のブログ編集" # edit -1
          expect(page).to have_field("タイトル", with: blog[2].title) # edit -1
          fill_in "タイトル", with: ""
          fill_in "日時", with: DateTime.current + 1
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "タイトルを入力してください"
          expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}のブログ編集"
        end
      end

      context "管理者は日時の無いスタッフのブログを編集する" do
        scenario "admin edits staff's blog without datetime" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          admin = Staff.find(admin_blog.staff_id)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit2").click
          expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}のブログ編集" # edit -1
          expect(page).to have_field("タイトル", with: blog[2].title) # edit -1
          fill_in "タイトル", with: blog[2].title + "-updated"
          fill_in "日時", with: ""
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "日時を入力してください"
          expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}のブログ編集"
        end
      end

      context "管理者はタイトルと日時の無いスタッフのブログを編集する" do
        scenario "admin edits staff's blog without a title and datetime" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          admin = Staff.find(admin_blog.staff_id)
          fill_in "Eメール", with: admin.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit2").click
          expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}のブログ編集" # edit -1
          expect(page).to have_field("タイトル", with: blog[2].title) # edit -1
          fill_in "タイトル", with: ""
          fill_in "日時", with: ""
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "タイトルを入力してください"
          expect(page).to have_content "日時を入力してください"
          expect(page).to have_content "#{Staff.find(blog[2].staff_id).name}のブログ編集"
        end
      end

      context "スタッフはタイトルの無い自分自身のブログを編集する" do
        scenario "staff edits staff's blog without a title" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          staff = Staff.find(blog[1].staff_id)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit1").click
          expect(page).to have_content "#{staff.name}のブログ編集" # edit -1
          expect(page).to have_field("タイトル", with: blog[1].title) # edit -1
          fill_in "タイトル", with: ""
          fill_in "日時", with: DateTime.current + 1
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "タイトルを入力してください"
          expect(page).to have_content "#{staff.name}のブログ編集"
        end
      end

      context "スタッフは日時の無い自分自身のブログを編集する" do
        scenario "staff edits staff's blog without datetime" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          staff = Staff.find(blog[2].staff_id)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit2").click
          expect(page).to have_content "#{staff.name}のブログ編集" # edit -1
          expect(page).to have_field("タイトル", with: blog[2].title) # edit -1
          fill_in "タイトル", with: blog[2].title + "-updated"
          fill_in "日時", with: ""
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "日時を入力してください"
          expect(page).to have_content "#{staff.name}のブログ編集"
        end
      end

      context "管理者はタイトルと日時の無い自分自身のブログを編集する" do
        scenario "staff edits staff's blog without a title and datetime" do
          admin_blog = FactoryBot.create(:blog, :admin)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          staff = Staff.find(blog[4].staff_id)
          fill_in "Eメール", with: staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          find(".edit4").click
          expect(page).to have_content "#{staff.name}のブログ編集" # edit -1
          expect(page).to have_field("タイトル", with: blog[4].title) # edit -1
          fill_in "タイトル", with: ""
          fill_in "日時", with: ""
          attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/2.jpg"
          click_button "編集する"
          expect(page).to have_content "タイトルを入力してください"
          expect(page).to have_content "日時を入力してください"
          expect(page).to have_content "#{staff.name}のブログ編集"
        end
      end

    end

  end

  describe "削除機能" do

    context "管理者は管理者自身のブログを削除する" do
      scenario "admin deteles admin's own blog" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        1.upto 4 do |n|
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
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        #admin = Staff.find(admin_blog.staff_id)
        staff = Staff.find(blog[3].staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        expect {
          find(".delete2").click
          expect(page).to have_content "ブログのデータを削除しました。"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to_not have_content blog[3].title
          expect(page).to_not have_content "#{staff.name}"
        }.to change(staff.blogs, :count).by(-1)
      end
    end

    context "スタッフは自分自身のブログを削除する" do
      scenario "staff deletes his own blog" do
        #admin_blog = FactoryBot.create(:blog, :admin)
        admin = FactoryBot.create(:staff, :admin)
        blog = []
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        #admin = Staff.find(admin_blog.staff_id)
        staff = Staff.find(blog[2].staff_id)
        fill_in "Eメール", with: admin.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        expect {
          find(".delete1").click
          expect(page).to have_content "ブログのデータを削除しました。"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to_not have_content blog[2].title
          expect(page).to_not have_content "#{staff.name}"
        }.to change(staff.blogs, :count).by(-1)
      end
    end

    context "スタッフ自身の削除ボタンのみ表示される" do
      scenario "staff finds his own delete button" do
        admin_blog = FactoryBot.create(:blog, :admin)
        blog = []
        1.upto 4 do |n|
          blog[n] = FactoryBot.create(:blog)
        end
        staff = Staff.find(blog[1].staff_id)
        fill_in "Eメール", with: staff.email
        click_button 'ログイン'
        click_link "スタッフブログ投稿"
        expect(page.all(".delete0").empty?).to eq true
        expect(page.all(".delete1").empty?).to eq false
        expect(page.all(".delete2").empty?).to eq true
        expect(page.all(".delete3").empty?).to eq true
        expect(page.all(".delete4").empty?).to eq true
      end
    end

  end

  describe "閲覧可能範囲設定" do

    context "新規作成系" do

      context "管理者が閲覧可能範囲でスタッフを指定してブログを新規作成" do

        before do

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
            find("option[value='staff']").select_option
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          }.to change(admin.blogs, :count).by(1)
          click_link "ログアウト"
          click_link "受講生の方はこちら"

        end


        context "管理者からは見える" do
          scenario "admins can see blogs" do
            admin = FactoryBot.create(:staff, :admin)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: admin.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end

        context "スタッフからは見える" do
          scenario "staffs can see blogs" do
            staff = FactoryBot.create(:staff)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: staff.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end



        context "セラピスト養成コースの受講生からは見えない" do
          scenario "therapist training course students can't see blogs" do
            student = FactoryBot.create(:student)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to_not have_content "title0"
            expect(page).to_not have_content I18n.l(Date.today, format: :longdate)
            expect(page).to_not have_content "管理者"
          end
        end

        context "セルフケアコースの受講生からは見えない" do
          scenario "self care course students can't see blogs" do
            student = FactoryBot.create(:student, :self_care)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to_not have_content "title0"
            expect(page).to_not have_content I18n.l(Date.today, format: :longdate)
            expect(page).to_not have_content "管理者"
          end
        end








      end

      context "スタッフが閲覧可能範囲でスタッフを指定してブログを新規作成" do

        before do

          @staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: @staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: "title0"
            fill_in "日時", with: DateTime.current
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
            find("option[value='staff']").select_option
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          }.to change(@staff.blogs, :count).by(1)
          click_link "ログアウト"
          click_link "受講生の方はこちら"

        end

        context "管理者からは見える" do
          scenario "admins can see blogs" do
            admin = FactoryBot.create(:staff, :admin)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: admin.email
            click_button "ログイン"
            click_link "スタッフブログ投稿"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end

        context "スタッフからは見える" do
          scenario "staffs can see blogs" do
            staff = FactoryBot.create(:staff)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: staff.email
            click_button "ログイン"
            click_link "スタッフブログ投稿"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end



        context "セラピスト養成コースの受講生からは見えない" do
          scenario "therapist training course students can't see blogs" do
            student = FactoryBot.create(:student)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to_not have_content "title0"
            expect(page).to_not have_content I18n.l(Date.today, format: :longdate)
            expect(page).to_not have_content @staff.name
          end
        end

        context "セルフケアコースの受講生からは見えない" do
          scenario "self care course students can't see blogs" do
            student = FactoryBot.create(:student, :self_care)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to_not have_content "title0"
            expect(page).to_not have_content I18n.l(Date.today, format: :longdate)
            expect(page).to_not have_content @staff.name
          end
        end








      end

      context "管理者が閲覧可能範囲でセラピスト養成コースを指定してブログを新規作成" do

        before do

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
            find("option[value='therapist_training']").select_option
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          }.to change(admin.blogs, :count).by(1)
          click_link "ログアウト"
          click_link "受講生の方はこちら"

        end

        context "管理者からは見える" do
          scenario "admins can see blogs" do
            admin = FactoryBot.create(:staff, :admin)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: admin.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end

        context "スタッフからは見える" do
          scenario "staffs can see blogs" do
            staff = FactoryBot.create(:staff)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: staff.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end




        context "セラピスト養成コースの受講生から見える" do
          scenario "therapist training course students can see blogs" do
            student = FactoryBot.create(:student)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end

        context "セルフケアコースの受講生からは見えない" do
          scenario "self care course students can't see blogs" do
            student = FactoryBot.create(:student, :self_care)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to_not have_content "title0"
            expect(page).to_not have_content I18n.l(Date.today, format: :longdate)
            expect(page).to_not have_content "管理者"
          end
        end








      end

      context "スタッフが閲覧可能範囲でセラピスト養成コースを指定してブログを新規作成" do

        before do

          @staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: @staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: "title0"
            fill_in "日時", with: DateTime.current
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
            find("option[value='therapist_training']").select_option
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          }.to change(@staff.blogs, :count).by(1)
          click_link "ログアウト"
          click_link "受講生の方はこちら"

        end

        context "管理者からは見える" do
          scenario "admins can see blogs" do
            admin = FactoryBot.create(:staff, :admin)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: admin.email
            click_button "ログイン"
            click_link "スタッフブログ投稿"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end

        context "スタッフからは見える" do
          scenario "staffs can see blogs" do
            staff = FactoryBot.create(:staff)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: staff.email
            click_button "ログイン"
            click_link "スタッフブログ投稿"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end



        context "セラピスト養成コースの受講生からは見える" do
          scenario "therapist training course students can see blogs" do
            student = FactoryBot.create(:student)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end

        context "セルフケアコースの受講生からは見えない" do
          scenario "self care course students can't see blogs" do
            student = FactoryBot.create(:student, :self_care)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to_not have_content "title0"
            expect(page).to_not have_content I18n.l(Date.today, format: :longdate)
            expect(page).to_not have_content @staff.name
          end
        end








      end


      context "管理者が閲覧可能範囲でセルフケアコースを指定してブログを新規作成" do

        before do

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
            find("option[value='self_care']").select_option
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          }.to change(admin.blogs, :count).by(1)
          click_link "ログアウト"
          click_link "受講生の方はこちら"

        end

        context "管理者からは見える" do
          scenario "admins can see blogs" do
            admin = FactoryBot.create(:staff, :admin)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: admin.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end

        context "スタッフからは見える" do
          scenario "staffs can see blogs" do
            staff = FactoryBot.create(:staff)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: staff.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end



        context "セラピスト養成コースの受講生から見える" do
          scenario "therapist training course students can see blogs" do
            student = FactoryBot.create(:student)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end

        context "セルフケアコースの受講生からは見える" do
          scenario "self care course students can see blogs" do
            student = FactoryBot.create(:student, :self_care)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end








      end

      context "スタッフが閲覧可能範囲でセルフケアコースを指定してブログを新規作成" do

        before do

          @staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: @staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: "title0"
            fill_in "日時", with: DateTime.current
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
            find("option[value='self_care']").select_option
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          }.to change(@staff.blogs, :count).by(1)
          click_link "ログアウト"
          click_link "受講生の方はこちら"

        end

        context "管理者からは見える" do
          scenario "admins can see blogs" do
            admin = FactoryBot.create(:staff, :admin)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: admin.email
            click_button "ログイン"
            click_link "スタッフブログ投稿"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end

        context "スタッフからは見える" do
          scenario "staffs can see blogs" do
            staff = FactoryBot.create(:staff)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: staff.email
            click_button "ログイン"
            click_link "スタッフブログ投稿"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end



        context "セラピスト養成コースの受講生からは見える" do
          scenario "therapist training course students can see blogs" do
            student = FactoryBot.create(:student)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end

        context "セルフケアコースの受講生からは見える" do
          scenario "self care course students can see blogs" do
            student = FactoryBot.create(:student, :self_care)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end








      end


      context "管理者が閲覧可能範囲で一般を指定してブログを新規作成" do

        before do

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
            find("option[value='general']").select_option
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          }.to change(admin.blogs, :count).by(1)
          click_link "ログアウト"
          click_link "受講生の方はこちら"

        end

        context "管理者からは見える" do
          scenario "admins can see blogs" do
            admin = FactoryBot.create(:staff, :admin)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: admin.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end

        context "スタッフからは見える" do
          scenario "staffs can see blogs" do
            staff = FactoryBot.create(:staff)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: staff.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end



        context "セラピスト養成コースの受講生から見える" do
          scenario "therapist training course students can see blogs" do
            student = FactoryBot.create(:student)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end

        context "セルフケアコースの受講生からは見える" do
          scenario "self care course students can see blogs" do
            student = FactoryBot.create(:student, :self_care)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content "管理者"
          end
        end








      end

      context "スタッフが閲覧可能範囲で一般を指定してブログを新規作成" do

        before do

          @staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: @staff.email
          click_button 'ログイン'
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect {
            click_link "新規作成"
            fill_in "タイトル", with: "title0"
            fill_in "日時", with: DateTime.current
            attach_file "blog[image]", "/mnt/c/Users/ruffini47/Pictures/人工インターン_EarTherage/1.jpg"
            find("option[value='general']").select_option
            click_button '作成する'
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          }.to change(@staff.blogs, :count).by(1)
          click_link "ログアウト"
          click_link "受講生の方はこちら"

        end

        context "管理者からは見える" do
          scenario "admins can see blogs" do
            admin = FactoryBot.create(:staff, :admin)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: admin.email
            click_button "ログイン"
            click_link "スタッフブログ投稿"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end

        context "スタッフからは見える" do
          scenario "staffs can see blogs" do
            staff = FactoryBot.create(:staff)
            click_link "管理者・スタッフはこちら"
            fill_in "Eメール", with: staff.email
            click_button "ログイン"
            click_link "スタッフブログ投稿"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end



        context "セラピスト養成コースの受講生からは見える" do
          scenario "therapist training course students can see blogs" do
            student = FactoryBot.create(:student)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end

        context "セルフケアコースの受講生からは見える" do
          scenario "self care course students can see blogs" do
            student = FactoryBot.create(:student, :self_care)
            fill_in "Eメール", with: student.email
            click_button "ログイン"
            click_link "スタッフブログ"
            expect(page).to have_content "スタッフブログ一覧"
            expect(page).to have_content "title0"
            expect(page).to have_content I18n.l(Date.today, format: :longdate)
            expect(page).to have_content @staff.name
          end
        end








      end







    end

    context "詳細表示系" do

      before do
        @blog = []
        @blog[0] = FactoryBot.create(:blog, :admin)
        @blog[1] = FactoryBot.create(:blog)
        @blog[2] = FactoryBot.create(:blog, :therapist_training)
        @blog[3] = FactoryBot.create(:blog, :self_care)
        @blog[4] = FactoryBot.create(:blog, :general)
        @blog[5] = FactoryBot.create(:blog, :admin)
        @blog[6] = FactoryBot.create(:blog)
        @blog[7] = FactoryBot.create(:blog, :therapist_training)
        @blog[8] = FactoryBot.create(:blog, :self_care)
        @blog[9] = FactoryBot.create(:blog, :general)

      end

      context "管理者から見る"do

        scenario "admins can see all blogs" do
          admin = FactoryBot.create(:staff, :admin)
          fill_in "Eメール", with: admin.email
          click_button "ログイン"
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to have_content @blog[0].title
          expect(page).to have_content I18n.l(Date.today, format: :longdate)
          expect(page).to have_content "管理者"
          expect(page).to have_content @blog[1].title
          expect(page).to have_content "#{Staff.find(@blog[1].staff_id).name}"
          expect(page).to have_content @blog[2].title
          expect(page).to have_content "#{Staff.find(@blog[2].staff_id).name}"
          expect(page).to have_content @blog[3].title
          expect(page).to have_content "#{Staff.find(@blog[3].staff_id).name}"
          expect(page).to have_content @blog[4].title
          expect(page).to have_content "#{Staff.find(@blog[4].staff_id).name}"
          expect(page).to have_content @blog[5].title
          expect(page).to have_content "#{Staff.find(@blog[5].staff_id).name}"
          expect(page).to have_content @blog[6].title
          expect(page).to have_content "#{Staff.find(@blog[6].staff_id).name}"
          expect(page).to have_content @blog[7].title
          expect(page).to have_content "#{Staff.find(@blog[7].staff_id).name}"
          expect(page).to have_content @blog[8].title
          expect(page).to have_content "#{Staff.find(@blog[8].staff_id).name}"
          expect(page).to have_content @blog[9].title
          expect(page).to have_content "#{Staff.find(@blog[9].staff_id).name}"
        end
      end

      context "スタッフから見る"do

        scenario "staffs can see all blogs" do
          staff = FactoryBot.create(:staff)
          fill_in "Eメール", with: staff.email
          click_button "ログイン"
          click_link "スタッフブログ投稿"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to have_content @blog[0].title
          expect(page).to have_content I18n.l(Date.today, format: :longdate)
          expect(page).to have_content "管理者"
          expect(page).to have_content @blog[1].title
          expect(page).to have_content "#{Staff.find(@blog[1].staff_id).name}"
          expect(page).to have_content @blog[2].title
          expect(page).to have_content "#{Staff.find(@blog[2].staff_id).name}"
          expect(page).to have_content @blog[3].title
          expect(page).to have_content "#{Staff.find(@blog[3].staff_id).name}"
          expect(page).to have_content @blog[4].title
          expect(page).to have_content "#{Staff.find(@blog[4].staff_id).name}"
          expect(page).to have_content @blog[5].title
          expect(page).to have_content "#{Staff.find(@blog[5].staff_id).name}"
          expect(page).to have_content @blog[6].title
          expect(page).to have_content "#{Staff.find(@blog[6].staff_id).name}"
          expect(page).to have_content @blog[7].title
          expect(page).to have_content "#{Staff.find(@blog[7].staff_id).name}"
          expect(page).to have_content @blog[8].title
          expect(page).to have_content "#{Staff.find(@blog[8].staff_id).name}"
          expect(page).to have_content @blog[9].title
          expect(page).to have_content "#{Staff.find(@blog[9].staff_id).name}"
        end
      end


      context "セラピスト養成コース受講生から見る"do

        scenario "therapist training course students can see therapist_training course blogs" do
          student = FactoryBot.create(:student)
          click_link "受講生の方はこちら"
          fill_in "Eメール", with: student.email
          click_button "ログイン"
          click_link "スタッフブログ"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to_not have_content @blog[0].title
          expect(page).to have_content I18n.l(Date.today, format: :longdate)
          expect(page).to_not have_content "管理者"
          expect(page).to_not have_content @blog[1].title
          expect(page).to_not have_content "#{Staff.find(@blog[1].staff_id).name}"
          expect(page).to have_content @blog[2].title
          expect(page).to have_content "#{Staff.find(@blog[2].staff_id).name}"
          expect(page).to have_content @blog[3].title
          expect(page).to have_content "#{Staff.find(@blog[3].staff_id).name}"
          expect(page).to have_content @blog[4].title
          expect(page).to have_content "#{Staff.find(@blog[4].staff_id).name}"
          expect(page).to_not have_content @blog[5].title
          expect(page).to_not have_content "#{Staff.find(@blog[5].staff_id).name}"
          expect(page).to_not have_content @blog[6].title
          expect(page).to_not have_content "#{Staff.find(@blog[6].staff_id).name}"
          expect(page).to have_content @blog[7].title
          expect(page).to have_content "#{Staff.find(@blog[7].staff_id).name}"
          expect(page).to have_content @blog[8].title
          expect(page).to have_content "#{Staff.find(@blog[8].staff_id).name}"
          expect(page).to have_content @blog[9].title
          expect(page).to have_content "#{Staff.find(@blog[9].staff_id).name}"
        end
      end

      context "セルフケアコース受講生から見る"do

        scenario "self care course students can see self_care course blogs" do
          student = FactoryBot.create(:student, :self_care)
          click_link "受講生の方はこちら"
          fill_in "Eメール", with: student.email
          click_button "ログイン"
          click_link "スタッフブログ"
          expect(page).to have_content "スタッフブログ一覧"
          expect(page).to_not have_content @blog[0].title
          expect(page).to have_content I18n.l(Date.today, format: :longdate)
          expect(page).to_not have_content "管理者"
          expect(page).to_not have_content @blog[1].title
          expect(page).to_not have_content "#{Staff.find(@blog[1].staff_id).name}"
          expect(page).to_not have_content @blog[2].title
          expect(page).to_not have_content "#{Staff.find(@blog[2].staff_id).name}"
          expect(page).to have_content @blog[3].title
          expect(page).to have_content "#{Staff.find(@blog[3].staff_id).name}"
          expect(page).to have_content @blog[4].title
          expect(page).to have_content "#{Staff.find(@blog[4].staff_id).name}"
          expect(page).to_not have_content @blog[5].title
          expect(page).to_not have_content "#{Staff.find(@blog[5].staff_id).name}"
          expect(page).to_not have_content @blog[6].title
          expect(page).to_not have_content "#{Staff.find(@blog[6].staff_id).name}"
          expect(page).to_not have_content @blog[7].title
          expect(page).to_not have_content "#{Staff.find(@blog[7].staff_id).name}"
          expect(page).to have_content @blog[8].title
          expect(page).to have_content "#{Staff.find(@blog[8].staff_id).name}"
          expect(page).to have_content @blog[9].title
          expect(page).to have_content "#{Staff.find(@blog[9].staff_id).name}"
        end
      end







    end

  end

end
