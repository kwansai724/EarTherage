require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe "#index" do

    # 管理者としてログインしたとき
    context "as admin" do
      before do
        @admin = FactoryBot.create(:staff, :admin)
      end

      # 正常にレスポンスを返すこと
      it "responds successfully" do
        sign_in @admin
        get :index
        expect(response).to be_successful
      end

      # 200レスポンスを返すこと
      it "returns a 200 response" do
        sign_in @admin
        get :index
        expect(response).to have_http_status "200"
      end
    end

    # スタッフとしてログインしたとき
    context "as a staff" do
      before do
        @staff = FactoryBot.create(:staff)
      end

      # 正常にレスポンスを返さないこと
      it "responds not successfully" do
        sign_in @staff
        get :index
        expect(response).not_to be_successful
      end

      # 302レスポンスを返すこと
      it "returns a 302 response" do
        sign_in @staff
        get :index
        expect(response).to have_http_status "302"
      end

      #ルート画面にリダイレクトすること
      it "redirects to the root page" do
        sign_in @staff
        get :index
        expect(response).to redirect_to "/"
      end

    end

    # 受講生としてログインしたとき
    context "as a student" do
      before do
        @student = FactoryBot.create(:student)
      end

      # 正常にレスポンスを返さないこと
      it "responds not successfully" do
        sign_in @student
        get :index
        expect(response).not_to be_successful
      end

      # 302レスポンスを返すこと
      it "returns a 302 response" do
        sign_in @student
        get :index
        expect(response).to have_http_status "302"
      end

      #ルート画面にリダイレクトすること
      it "redirects to the root page" do
        sign_in @student
        get :index
        expect(response).to redirect_to root_path
      end
    end

    # ゲストとして
    context "as a guest" do

      # 正常にレスポンスを返さないこと
      it "responds not successfully" do
        get :index
        expect(response).not_to be_successful
      end

      # 302レスポンスを返すこと
      it "returns a 302 response" do
        get :index
        expect(response).to have_http_status "302"
      end

      #ルート画面にリダイレクトすること
      it "redirects to the root page" do
        get :index
        expect(response).to redirect_to root_path
      end

    end
  end
end
