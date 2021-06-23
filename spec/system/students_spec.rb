require 'rails_helper'

RSpec.describe "Students", type: :system do

  before do
    @therapist_training = []
    1.upto 10 do |n|
      @therapist_training[n] = FactoryBot.create(:student)
    end
    @self_care = []
    1.upto 10 do |n|
      @self_care[n] = FactoryBot.create(:student, :self_care)
    end
    admin = FactoryBot.create(:staff, :admin)
    sign_in admin
    visit admin_screen_path
    expect(page).to have_content "管理者画面"
    click_link "受講生管理"
  end

  describe "一覧表示機能" do
    context "管理者は受講生を一覧表示する" do
      it "admin lists students" do
        expect(page).to have_content "受講生一覧"
        1.upto 10 do |n|
          expect(page).to have_content "student#{n}"
          expect(page).to have_content "sample-#{n}@email.com"
        end
        expect(page).to have_content "セラピスト養成コース"
        click_link "次へ"
        11.upto 20 do |n|
          expect(page).to have_content "student#{n%20}"
          expect(page).to have_content "sample-#{n%20}@email.com"
        end
        expect(page).to have_content "セルフケアコース"
      end
    end
  end

  describe "詳細表示機能" do
    context "管理者は受講生の詳細を表示する" do
      it "admin views students in detail" do
        expect(page).to have_content "受講生一覧"
        10.times do |n|
          find(".show#{n}").click
          expect(page).to have_content "受講生詳細"
          expect(page).to have_content "ID:"
          expect(page).to have_content "#{n+1}"
          expect(page).to have_content "名前:"
          expect(page).to have_content "student#{n+1}"
          expect(page).to have_content "Eメール:"
          expect(page).to have_content "sample-#{n+1}@email.com"
          expect(page).to have_content "コース:"
          expect(page).to have_content "セラピスト養成コース"
          click_link "戻る"
        end
        click_link "次へ"
        10.times do |n|
          find(".show#{n}").click
          expect(page).to have_content "受講生詳細"
          expect(page).to have_content "ID:"
          expect(page).to have_content "#{(n+11)%20}"
          expect(page).to have_content "名前:"
          expect(page).to have_content "student#{(n+11)%20}"
          expect(page).to have_content "Eメール:"
          expect(page).to have_content "sample-#{(n+11)%20}@email.com"
          expect(page).to have_content "コース:"
          expect(page).to have_content "セルフケアコース"
          click_link "戻る"
          click_link "次へ"
        end
      end
    end
  end

  describe "編集機能" do
    context "管理者は受講生を編集する" do
      context "セラピスト養成コースの受講生を編集する" do
        it "admins edit therapist training course student" do
          expect(page).to have_content "受講生一覧"
          10.times do |n|
            find(".edit#{n}").click
            expect(page).to have_content "アカウント情報の更新"
            fill_in "名前", with: "student-#{n+1}"
            fill_in "Eメール", with: "sample--#{n+1}@email.com"
            fill_in "電話番号", with: "0000#{n+1}"
            if n%2 == 0
              find("option[value='self_care']").select_option
            else
              find("option[value='therapist_training']").select_option
            end
            click_button "編集"
            expect(page).to have_content "受講生詳細"
            expect(page).to have_content "ID:"
            expect(page).to have_content "#{n+1}"
            expect(page).to have_content "名前:"
            expect(page).to have_content "student-#{n+1}"
            expect(page).to have_content "Eメール:"
            expect(page).to have_content "sample--#{n+1}@email.com"
            expect(page).to have_content "電話番号"
            expect(page).to have_content "0000#{n+1}"
            expect(page).to have_content "コース:"
            if n%2 == 0
              expect(page).to have_content "セルフケアコース"
            else
              expect(page).to have_content "セラピスト養成コース"
            end
            click_link "戻る"
          end
        end
      end

      context "セルフケアコースの受講生を編集する" do
        it "admin edits sefl care course student" do
          expect(page).to have_content "受講生一覧"
          10.times do |n|
            find(".edit#{n}").click
            expect(page).to have_content "アカウント情報の更新"
            fill_in "名前", with: "student-#{(n+11)%20}"
            fill_in "Eメール", with: "sample--#{(n+11)%20}@email.com"
            fill_in "電話番号", with: "0000#{(n+11)%20}"
            if n%2 == 1
              find("option[value='self_care']").select_option
            else
              find("option[value='therapist_training']").select_option
            end
            click_button "編集"
            expect(page).to have_content "受講生詳細"
            expect(page).to have_content "ID:"
            expect(page).to have_content "#{(n+11)%20}"
            expect(page).to have_content "名前:"
            expect(page).to have_content "student-#{(n+11)%20}"
            expect(page).to have_content "Eメール:"
            expect(page).to have_content "sample--#{(n+11)%20}@email.com"
            expect(page).to have_content "電話番号"
            expect(page).to have_content "0000#{(n+11)%20}"
            expect(page).to have_content "コース:"
            if n%2 == 1
              expect(page).to have_content "セルフケアコース"
            else
              expect(page).to have_content "セラピスト養成コース"
            end
            click_link "戻る"
          end
        end
      end
    end



  end

  describe "削除機能" do
    context "管理者は受講生を削除する" do
      context "セラピスト養成コースの受講生を削除する" do
        it "admin deletes therapist training course student" do
          expect(page).to have_content "受講生一覧"
          find(".delete0").click
          expect(page).to have_content "「student1」のデータを削除しました。"
          expect(page).to have_content "受講生一覧"
          expect(page).to have_no_content "sample-1@email.com"
          find(".delete1").click
          expect(page).to have_content "「student3」のデータを削除しました。"
          expect(page).to have_content "受講生一覧"
          expect(page).to have_no_content "sample-3@email.com"
        end
      end
      context "セルフケアコースの受講生を削除する" do
        it "admin deletes self care course student" do
          expect(page).to have_content "受講生一覧"
          click_link "次へ"
          find(".delete0").click
          click_link "次へ"
          expect(page).to have_no_content "student11"
          expect(page).to have_content "受講生一覧"
          expect(page).to have_no_content "sample-11@email.com"
          find(".delete2").click
          expect(page).to have_content "「student14」のデータを削除しました。"
          expect(page).to have_content "受講生一覧"
          expect(page).to have_no_content "sample-14@email.com"
        end
      end

    end
  end
end
