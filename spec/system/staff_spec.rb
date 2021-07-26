require 'rails_helper'

RSpec.describe "Staffs", type: :system do

  context "スタッフ新規作成機能" do
    before do
      visit root_path
      click_link "管理者・スタッフはこちら"
      click_link "スタッフ新規登録"
      expect(page).to have_content "アカウント登録"
    end

    describe "正常系" do
      context "誰かがスタッフを新規作成する" do
        it "someone creates new staff" do
          fill_in "名前", with: "staff-a"
          fill_in "Eメール", with: "sample-a@email.com"
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: "password"
          click_button "アカウント登録"
          expect(page).to have_content "アカウント登録が完了しました。"
          expect(page).to have_content "スタッフ画面"
          expect(page).to have_link "スタッフブログ投稿"
          expect(page).to have_link "イベント・講座投稿"
        end
      end

      context "ログインリンクを押す" do
        it "somene click login link" do
          click_link "ログイン"
          expect(page).to have_content "ログイン"
          expect(page).to have_content "Eメール"
          expect(page).to have_link "受講生の方はこちら"
          expect(page).to have_link "スタッフ新規登録"
        end
      end
 
    end

    describe "異常系" do
      context "名前のないスタッフを新規作成する" do
        it "someone create new staff without name" do
          fill_in "名前", with: ""
          fill_in "Eメール", with: "sample-b@email.com"
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: "password"
          click_button "アカウント登録"
          expect(page).to have_content "名前を入力してください"
          expect(page).to have_content "名前は2文字以上で入力してください"
        end
      end

      context "Eメールのないスタッフを新規作成する" do
        it "someone create new staff without email" do
          fill_in "名前", with: "staff-c"
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: "password"
          click_button "アカウント登録"
          expect(page).to have_content "Eメールを入力してください"
        end
      end

      context "パスワードのないスタッフを新規作成する" do
        it "someone create new staff without password" do
          fill_in "名前", with: "staff-d"
          fill_in "Eメール", with: "sample-d@eamil.com"
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: "password"
          click_button "アカウント登録"
          expect(page).to have_content "パスワードを入力してください"
          expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
        end
      end

      context "パスワード(確認用)のないスタッフを新規作成する" do
        it "someone create new staff without confirm password" do
          fill_in "名前", with: "staff-e"
          fill_in "Eメール", with: "sample-e@email.com"
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: ""
          click_button "アカウント登録"
          expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
        end
      end

      context "名前とEメールのないスタッフを新規作成する" do
        it "someone create new staff without name and email" do
          fill_in "名前", with: ""
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: "password"
          click_button "アカウント登録"
          expect(page).to have_content "Eメールを入力してください"
          expect(page).to have_content "名前を入力してください"
          expect(page).to have_content "名前は2文字以上で入力してください"
        end
      end

       context "名前とパスワードのないスタッフを新規作成する" do
        it "someone create new staff without name and password" do
          fill_in "名前", with: ""
          fill_in "Eメール", with: "sample-f@email.com"
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: "password"
          click_button "アカウント登録"
          expect(page).to have_content "パスワードを入力してください"
          expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
          expect(page).to have_content "名前を入力してください"
          expect(page).to have_content "名前は2文字以上で入力してください"
        end
      end

     context "名前とパスワード(確認用)のないスタッフを新規作成する" do
        it "someone create new staff without name and confirm password" do
          fill_in "名前", with: ""
          fill_in "Eメール", with: "sample-f@email.com"
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: ""
          click_button "アカウント登録"
          expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
          expect(page).to have_content "名前を入力してください"
          expect(page).to have_content "名前は2文字以上で入力してください"
        end
      end

     context "Eメールとパスワードのないスタッフを新規作成する" do
        it "someone create new staff without email and  password" do
          fill_in "名前", with: "staff-g"
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: "password"
          click_button "アカウント登録"
          expect(page).to have_content "Eメールを入力してください"
          expect(page).to have_content "パスワードを入力してください"
          expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
        end
      end

      context "Eメールとパスワード(確認用)のないスタッフを新規作成する" do
        it "someone create new staff without email and confirm password" do
          fill_in "名前", with: "staff-h"
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: ""
          click_button "アカウント登録"
          expect(page).to have_content "Eメールを入力してください"
          expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
        end
      end

      context "パスワードとパスワード(確認用)のないスタッフを新規作成する" do
        it "someone create new staff without password and confirm password" do
          fill_in "名前", with: "staff-i"
          fill_in "Eメール", with: "sample-i@email.com"
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: ""
          click_button "アカウント登録"
          expect(page).to have_content "パスワードを入力してください"
        end
      end

      context "名前とEメールとパスワードのないスタッフを新規作成する" do
        it "someone create new staff without name, email and password " do
          fill_in "名前", with: ""
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: "password"
          click_button "アカウント登録"
          expect(page).to have_content "Eメールを入力してください"
          expect(page).to have_content "パスワードを入力してください"
          expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
          expect(page).to have_content "名前を入力してください"
          expect(page).to have_content "名前は2文字以上で入力してください"
        end
      end

      context "名前とEメールとパスワード(確認用)のないスタッフを新規作成する" do
        it "someone create new staff without name, email and confirm password " do
          fill_in "名前", with: ""
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: ""
          click_button "アカウント登録"
          expect(page).to have_content "Eメールを入力してください"
          expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
          expect(page).to have_content "名前を入力してください"
          expect(page).to have_content "名前は2文字以上で入力してください"
        end
      end

      context "名前とパスワードとパスワード(確認用)のないスタッフを新規作成する" do
        it "someone create new staff without name, password and confirm password " do
          fill_in "名前", with: ""
          fill_in "Eメール", with: "sample-j@email.com"
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: ""
          click_button "アカウント登録"
          expect(page).to have_content "パスワードを入力してください"
          expect(page).to have_content "名前を入力してください"
          expect(page).to have_content "名前は2文字以上で入力してください"
        end
      end

      context "Eメールとパスワードとパスワード(確認用)のないスタッフを新規作成する" do
        it "someone create new staff without email, password and confirm password " do
          fill_in "名前", with: "staff-k"
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: ""
          click_button "アカウント登録"
          expect(page).to have_content "Eメールを入力してください"
          expect(page).to have_content "パスワードを入力してください"
        end
      end

      context "名前とEメールとパスワードとパスワード(確認用)のないスタッフを新規作成する" do
        it "someone create new staff without name, email, password and confirm password " do
          fill_in "名前", with: ""
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: ""
          click_button "アカウント登録"
          expect(page).to have_content "Eメールを入力してください"
          expect(page).to have_content "パスワードを入力してください"
          expect(page).to have_content "名前を入力してください"
          expect(page).to have_content "名前は2文字以上で入力してください"
        end
      end


    end
  end
end
