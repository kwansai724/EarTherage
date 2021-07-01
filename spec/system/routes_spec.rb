require 'rails_helper'

RSpec.describe "Routes", type: :system do
  before do
    @admin = FactoryBot.create(:staff, :admin)
    @staff = FactoryBot.create(:staff)
    @therapist_training = FactoryBot.create(:student)
    @self_care = FactoryBot.create(:student, :self_care)
  end

  describe "管理者としてログインして、ルートにアクセス" do
    it "redirect to admin screen" do
      visit root_path
      click_link "管理者・スタッフはこちら"
      fill_in "Eメール", with: @admin.email
      click_button 'ログイン'
      expect(page).to have_content "ログインしました。"
      expect(page).to have_content "管理者画面"
      expect(page).to have_link "スタッフブログ投稿"
      expect(page).to have_link "開講スケジュール投稿"
      expect(page).to have_link "受講生管理"
      visit root_path
      expect(page).to have_content "管理者画面"
      expect(page).to have_link "スタッフブログ投稿"
      expect(page).to have_link "開講スケジュール投稿"
      expect(page).to have_link "受講生管理"
    end
  end

  describe "スタッフとしてログインして、ルートにアクセス" do
    it "redirect to staff screen" do
      visit root_path
      click_link "管理者・スタッフはこちら"
      fill_in "Eメール", with: @staff.email
      click_button 'ログイン'
      expect(page).to have_content "ログインしました。"
      expect(page).to have_content "スタッフ画面"
      expect(page).to have_link "スタッフブログ投稿"
      expect(page).to have_link "開講スケジュール投稿"
      visit root_path
      expect(page).to have_content "スタッフ画面"
      expect(page).to have_link "スタッフブログ投稿"
      expect(page).to have_link "開講スケジュール投稿"
    end
  end

  describe "セラピスト養成コースの受講生としてログインして、ルートにアクセス" do
    it "redirect to therapist_training screen" do
      visit root_path
      fill_in "Eメール", with: @therapist_training.email
      click_button 'ログイン'
      expect(page).to have_content "ログインしました。"
      expect(page).to have_content "セラピスト養成コース"
      visit root_path
      expect(page).to have_content "セラピスト養成コース"
    end
  end

  describe "セルフケアコースの受講生としてログインして、ルートにアクセス" do
    it "redirect to self_care screen" do
      visit root_path
      fill_in "Eメール", with: @self_care.email
      click_button 'ログイン'
      expect(page).to have_content "ログインしました。"
      expect(page).to have_content "セルフケアコース"
      visit root_path
      expect(page).to have_content "セルフケアコース"
    end
  end

  describe "ゲストがスタッフブログを見ているとき、ルートにアクセス" do
    it "redirect to students/sessions#new" do
      visit root_path
      click_link "スタッフブログはこちら（一般向け）,（仮）"
      expect(page).to have_content "スタッフブログ一覧"
      visit root_path
      expect(page).to have_content "ログイン"
      expect(page).to have_content "Eメール"
      expect(page).to have_content "ログインを記憶する"
      expect(page).to have_button "ログイン"
      expect(page).to have_link "管理者・スタッフはこちら"
      expect(page).to have_link "スタッフブログはこちら（一般向け）,（仮）"
    end
  end
end
