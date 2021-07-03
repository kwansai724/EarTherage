require 'rails_helper'

RSpec.describe "Students", type: :system do

  context "CSVファイルインポート機能以外" do
    before do
      @therapist_training = []
      1.upto 10 do |n|
        @therapist_training[n] = FactoryBot.create(:student, :system_student)
      end
      @self_care = []
      1.upto 10 do |n|
        @self_care[n] = FactoryBot.create(:student, :self_care_system_student)
      end
      sign_in_as_admin
      #admin = FactoryBot.create(:staff, :admin)
      #sign_in admin
      #visit admin_screen_path
      #expect(page).to have_content "管理者画面"
      #click_link "受講生管理"
      #expect(page).to have_content "受講生一覧"
    end

    describe "一覧表示機能" do
      context "管理者は受講生を一覧表示する" do
        it "admin lists students" do
          1.upto 10 do |n|
            expect(page).to have_content "student---#{n%10}"
            expect(page).to have_content "sample---#{n%10}@email.com"
          end
          expect(page).to have_content "セラピスト養成コース"
          click_link "次へ"
          11.upto 20 do |n|
            expect(page).to have_content "student----#{n%10}"
            expect(page).to have_content "sample----#{n%10}@email.com"
          end
          expect(page).to have_content "セルフケアコース"
        end
      end
    end

    describe "詳細表示機能" do
      context "管理者は受講生の詳細を表示する" do
        it "admin views students in detail" do
          10.times do |n|
            find(".show#{n}").click
            expect(page).to have_content "受講生詳細"
            expect(page).to have_content "ID:"
            expect(page).to have_content "#{(n+1)%10}"
            expect(page).to have_content "名前:"
            expect(page).to have_content "student---#{(n+1)%10}"
            expect(page).to have_content "Eメール:"
            expect(page).to have_content "sample---#{(n+1)%10}@email.com"
            expect(page).to have_content "コース:"
            expect(page).to have_content "セラピスト養成コース"
            click_link "戻る"
          end
          click_link "次へ"
          10.times do |n|
            find(".show#{n}").click
            expect(page).to have_content "受講生詳細"
            expect(page).to have_content "ID:"
            expect(page).to have_content "#{(n+1)%10}"
            expect(page).to have_content "名前:"
            expect(page).to have_content "student----#{(n+1)%10}"
            expect(page).to have_content "Eメール:"
            expect(page).to have_content "sample----#{(n+1)%10}@email.com"
            expect(page).to have_content "コース:"
            expect(page).to have_content "セルフケアコース"
            click_link "戻る"
            click_link "次へ"
          end
        end
      end
    end

    describe "編集機能" do
      context "正常系"

        context "管理者は受講生を編集する" do
          context "セラピスト養成コースの受講生を編集する" do
            it "admins edit therapist training course student" do
              10.times do |n|
                find(".edit#{n}").click
                expect(page).to have_content "アカウント情報の更新"
                fill_in "名前", with: "student-edit#{n+1}"
                fill_in "Eメール", with: "sample-edit#{n+1}@email.com"
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
                expect(page).to have_content "student-edit#{n+1}"
                expect(page).to have_content "Eメール:"
                expect(page).to have_content "sample-edit#{n+1}@email.com"
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
            it "admin edits self care course student" do
              10.times do |n|
                find(".edit#{n}").click
                expect(page).to have_content "アカウント情報の更新"
                fill_in "名前", with: "student-edit#{n+1}"
                fill_in "Eメール", with: "sample-edit#{n+1}@email.com"
                fill_in "電話番号", with: "0000#{n+1}"
                if n%2 == 1
                  find("option[value='self_care']").select_option
                else
                  find("option[value='therapist_training']").select_option
                end
                click_button "編集"
                expect(page).to have_content "受講生詳細"
                expect(page).to have_content "ID:"
                expect(page).to have_content "#{(n+1)}"
                expect(page).to have_content "名前:"
                expect(page).to have_content "student-edit#{n+1}"
                expect(page).to have_content "Eメール:"
                expect(page).to have_content "sample-edit#{n+1}@email.com"
                expect(page).to have_content "電話番号"
                expect(page).to have_content "0000#{n+1}"
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

       context "異常系" do
         context "管理者は受講生を編集する" do
           context "セラピスト養成コースの受講生を編集する" do
             context "管理者は名前の無い受講生を編集する" do
               it "admin edits therapist training course student without name" do
                 10.times do |n|
                   find(".edit#{n}").click
                   expect(page).to have_content "アカウント情報の更新"
                   fill_in "名前", with: ""
                   fill_in "Eメール", with: "sample-edit#{n+1}@email.com"
                   fill_in "電話番号", with: "0000#{n+1}"
                   if n%2 == 0
                     find("option[value='self_care']").select_option
                   else
                     find("option[value='therapist_training']").select_option
                   end
                   click_button "編集"
                   expect(page).to have_content "名前を入力してください"
                   expect(page).to have_content "アカウント情報の更新"
                   click_link "戻る"
                 end
               end
             end

             context "管理者はEメールの無い受講生を編集する" do
               it "admin edits therapist training course student without email" do
                 10.times do |n|
                   find(".edit#{n}").click
                   expect(page).to have_content "アカウント情報の更新"
                   fill_in "名前", with: "student-edit#{n+1}"
                   fill_in "Eメール", with: ""
                   fill_in "電話番号", with: "0000#{n+1}"
                   if n%2 == 0
                     find("option[value='self_care']").select_option
                   else
                     find("option[value='therapist_training']").select_option
                   end
                   click_button "編集"
                   expect(page).to have_content "Eメールを入力してください"
                   expect(page).to have_content "アカウント情報の更新"
                   click_link "戻る"
                 end
               end
             end
             context "管理者は名前とEメールの無い受講生を編集する" do
               it "admin edits therapist training course student without name and email" do
                 10.times do |n|
                   find(".edit#{n}").click
                   expect(page).to have_content "アカウント情報の更新"
                   fill_in "名前", with: ""
                   fill_in "Eメール", with: ""
                   fill_in "電話番号", with: "0000#{n+1}"
                   if n%2 == 0
                     find("option[value='self_care']").select_option
                   else
                     find("option[value='therapist_training']").select_option
                   end
                   click_button "編集"
                   expect(page).to have_content "名前を入力してください"
                   expect(page).to have_content "Eメールを入力してください"
                   expect(page).to have_content "アカウント情報の更新"
                   click_link "戻る"
                 end
               end
             end
           end
           context "セルフケアコースの受講生を編集する" do
             context "管理者は名前の無い受講生を編集する" do
               it "admin edits self care course student without name" do
                 10.times do |n|
                   find(".edit#{n}").click
                   expect(page).to have_content "アカウント情報の更新"
                   fill_in "名前", with: ""
                   fill_in "Eメール", with: "sample-edit#{n+1}@email.com"
                   fill_in "電話番号", with: "0000#{n+1}"
                   if n%2 == 1
                     find("option[value='self_care']").select_option
                   else
                     find("option[value='therapist_training']").select_option
                   end
                   click_button "編集"
                   expect(page).to have_content "名前を入力してください"
                   expect(page).to have_content "アカウント情報の更新"
                   click_link "戻る"
                 end
               end
             end
             context "管理者はEメールの無い受講生を編集する" do
               it "admin edits self care course student without email" do
                 10.times do |n|
                   find(".edit#{n}").click
                   expect(page).to have_content "アカウント情報の更新"
                   fill_in "名前", with: "student-edit#{n+1}"
                   fill_in "Eメール", with: ""
                   fill_in "電話番号", with: "0000#{n+1}"
                   if n%2 == 1
                     find("option[value='self_care']").select_option
                   else
                     find("option[value='therapist_training']").select_option
                   end
                   click_button "編集"
                   expect(page).to have_content "Eメールを入力してください"
                   expect(page).to have_content "アカウント情報の更新"
                   click_link "戻る"
                 end
               end
             end
             context "管理者は名前とEメールの無い受講生を編集する" do
               it "admin edits self care course student without name and email" do
                 10.times do |n|
                   find(".edit#{n}").click
                   expect(page).to have_content "アカウント情報の更新"
                   fill_in "名前", with: ""
                   fill_in "Eメール", with: ""
                   fill_in "電話番号", with: "0000#{n+1}"
                   if n%2 == 1
                     find("option[value='self_care']").select_option
                   else
                     find("option[value='therapist_training']").select_option
                   end
                   click_button "編集"
                   expect(page).to have_content "名前を入力してください"
                   expect(page).to have_content "Eメールを入力してください"
                   expect(page).to have_content "アカウント情報の更新"
                   click_link "戻る"
                 end
               end
             end

           end
         end
       end



    end

    describe "削除機能" do
      context "管理者は受講生を削除する" do
        context "セラピスト養成コースの受講生を削除する" do
          it "admin deletes therapist training course student" do
            find(".delete0").click
            expect(page).to have_content "「student---1」のデータを削除しました。"
            expect(page).to have_content "受講生一覧"
            expect(page).to have_no_content "sample---1@email.com"
            find(".delete1").click
            expect(page).to have_content "「student---3」のデータを削除しました。"
            expect(page).to have_content "受講生一覧"
            expect(page).to have_no_content "sample---3@email.com"
          end
        end
        context "セルフケアコースの受講生を削除する" do
          it "admin deletes self care course student" do
            click_link "次へ"
            find(".delete0").click
            click_link "次へ"
            expect(page).to have_no_content "student----1"
            expect(page).to have_content "受講生一覧"
            expect(page).to have_no_content "sample----1@email.com"
            find(".delete2").click
            expect(page).to have_content "「student----4」のデータを削除しました。"
            expect(page).to have_content "受講生一覧"
            expect(page).to have_no_content "sample----4@email.com"
          end
        end

      end
    end
  end

  describe "CSVファイルインポート機能" do
    context "正常系" do
      context "管理者はCSVファイルをインポートする" do
        context "元からstudentが登録されていないとき" do
          before do
            sign_in_as_admin
          end
          it "admin imports CSV file" do
            attach_file "file", "/mnt/c/Users/ruffini47/Documents/セレブエンジニア/人工インターン_EarTherage/売上データ4.csv"
            click_button "CSVをインポート"
            expect(page).to have_content "CSVデータをインポートしました。"
            expect(page).to have_content "山本裕子"
            expect(page).to have_content "minny.yamamoto@o-anniversary.com"
            expect(page).to have_content "1000000000"
            expect(page).to have_content "岡本 颯"
            expect(page).to have_content "minny.yamamoto2@o-anniversary.com"
            expect(page).to have_content "2000000000"
            expect(page).to have_content "竹内 優花"
            expect(page).to have_content "minny.yamamoto3@o-anniversary.com"
            expect(page).to have_content "3000000000"
            expect(page).to have_content "宮崎 遼"
            expect(page).to have_content "minny.yamamoto4@o-anniversary.com"
            expect(page).to have_content "4000000000"
            expect(page).to have_content "平野 悠斗"
            expect(page).to have_content "minny.yamamoto5@o-anniversary.com"
            expect(page).to have_content "5000000000"
            expect(page).to have_content "清水 結"
            expect(page).to have_content "minny.yamamoto6@o-anniversary.com"
            expect(page).to have_content "6000000000"
            expect(page).to have_content "山本裕子"
            expect(page).to have_content "minny.yamamoto7@o-anniversary.com"
            expect(page).to have_content "7000000000"
            expect(page).to have_content "伊藤 翔"
            expect(page).to have_content "minny.yamamoto8@o-anniversary.com"
            expect(page).to have_content "8000000000"
          end
        end
        context "元からstudentが5名登録されているとき" do
          before do
            5.times do
              FactoryBot.create(:student, :sample)
            end
            sign_in_as_admin
          end
          it "admin imports CSV file" do
            attach_file "file", "/mnt/c/Users/ruffini47/Documents/セレブエンジニア/人工インターン_EarTherage/売上データ4.csv"
            click_button "CSVをインポート"
            expect(page).to have_content "CSVデータをインポートしました。"
            expect(page).to have_content "山本裕子"
            expect(page).to have_content "minny.yamamoto@o-anniversary.com"
            expect(page).to have_content "1000000000"
            expect(page).to have_content "岡本 颯"
            expect(page).to have_content "minny.yamamoto2@o-anniversary.com"
            expect(page).to have_content "2000000000"
            expect(page).to have_content "竹内 優花"
            expect(page).to have_content "minny.yamamoto3@o-anniversary.com"
            expect(page).to have_content "3000000000"
            expect(page).to have_content "宮崎 遼"
            expect(page).to have_content "minny.yamamoto4@o-anniversary.com"
            expect(page).to have_content "4000000000"
            expect(page).to have_content "平野 悠斗"
            expect(page).to have_content "minny.yamamoto5@o-anniversary.com"
            expect(page).to have_content "5000000000"
            expect(page).to have_content "清水 結"
            expect(page).to have_content "minny.yamamoto6@o-anniversary.com"
            expect(page).to have_content "6000000000"
            expect(page).to have_content "山本裕子"
            expect(page).to have_content "minny.yamamoto7@o-anniversary.com"
            expect(page).to have_content "7000000000"
            expect(page).to have_content "伊藤 翔"
            expect(page).to have_content "minny.yamamoto8@o-anniversary.com"
            expect(page).to have_content "8000000000"
          end
        end
        context "元からstudentが10名登録されているとき" do
          before do
            10.times do
              FactoryBot.create(:student, :sample)
            end
            sign_in_as_admin
          end
          it "admin imports CSV file" do
            attach_file "file", "/mnt/c/Users/ruffini47/Documents/セレブエンジニア/人工インターン_EarTherage/売上データ4.csv"
            click_button "CSVをインポート"
            expect(page).to have_content "CSVデータをインポートしました。"
            expect(page).to have_content "山本裕子"
            expect(page).to have_content "minny.yamamoto@o-anniversary.com"
            expect(page).to have_content "1000000000"
            expect(page).to have_content "岡本 颯"
            expect(page).to have_content "minny.yamamoto2@o-anniversary.com"
            expect(page).to have_content "2000000000"
            expect(page).to have_content "竹内 優花"
            expect(page).to have_content "minny.yamamoto3@o-anniversary.com"
            expect(page).to have_content "3000000000"
            expect(page).to have_content "宮崎 遼"
            expect(page).to have_content "minny.yamamoto4@o-anniversary.com"
            expect(page).to have_content "4000000000"
            expect(page).to have_content "平野 悠斗"
            expect(page).to have_content "minny.yamamoto5@o-anniversary.com"
            expect(page).to have_content "5000000000"
            expect(page).to have_content "清水 結"
            expect(page).to have_content "minny.yamamoto6@o-anniversary.com"
            expect(page).to have_content "6000000000"
            expect(page).to have_content "山本裕子"
            expect(page).to have_content "minny.yamamoto7@o-anniversary.com"
            expect(page).to have_content "7000000000"
            expect(page).to have_content "伊藤 翔"
            expect(page).to have_content "minny.yamamoto8@o-anniversary.com"
            expect(page).to have_content "8000000000"
          end
        end
      end
    end
    context "異常系" do
      context "管理者はCSVファイルを選択しないでCSVをインポートボタンを押す" do
        before do
          sign_in_as_admin
        end
        it "admin presses CSV import button without selecting CSV file" do
          click_button "CSVをインポート"
          expect(page).to have_content "csvデータが選択されていません。"
        end
      end
    end
  end
end

