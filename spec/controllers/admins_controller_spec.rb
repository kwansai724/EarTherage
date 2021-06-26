require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  describe "#student_edit" do
    context "正常系" do
      context "管理者としてログインしたとき" do
        context "as admin" do
          before do
            admin = FactoryBot.create(:staff, :admin)
            sign_in admin
            student = FactoryBot.create(:student, :sample)
            get :student_edit, params: { student_id: student.id }
          end
          context "正常にレスポンスを返すこと" do
            it "responds successfully" do
              expect(response).to be_successful
            end
          end
          context "200レスポンスを返すこと" do
            it "returns a 200 response" do
              expect(response).to have_http_status "200"
            end
          end
        end
      end
    end
    context "異常系" do

      context "スタッフとしてログインしたとき" do
        context "as a staff" do
          before do
            staff = FactoryBot.create(:staff)
            sign_in staff
            student = FactoryBot.create(:student, :sample)
            get :student_edit, params: { student_id: student.id }
          end
          context "正常にレスポンスを返さないこと" do
            it "responds not successfully" do
              expect(response).not_to be_successful
            end
          end
          context "302レスポンスを返すこと" do
            it "returns a 302 response" do
              expect(response).to have_http_status "302"
            end
          end
          context "ルート画面にリダイレクトすること" do
            it "redirects to the root page" do
              expect(response).to redirect_to "/"
            end
          end
        end
      end

      context "セラピスト養成コースの受講生としてログインしたとき" do
        context "as a therapist training course student" do
          before do
            student = FactoryBot.create(:student)
            sign_in student
            student = FactoryBot.create(:student, :sample)
            get :student_edit, params: { student_id: student.id }
          end
          context "正常にレスポンスを返さないこと" do
            it "responds not successfully" do
              expect(response).not_to be_successful
            end
          end
          context "302レスポンスを返すこと" do
            it "returns a 302 response" do
              expect(response).to have_http_status "302"
            end
          end
          context "ルート画面にリダイレクトすること" do
            it "redirects to the root page" do
              expect(response).to redirect_to root_path
            end
          end
        end
      end

      context "セルフケアコースの受講生としてログインしたとき" do
        context "as a self care course student" do
          before do
            student = FactoryBot.create(:student, :self_care)
            sign_in student
            student = FactoryBot.create(:student, :sample)
            get :student_edit, params: { student_id: student.id }
          end
          context "正常にレスポンスを返さないこと" do
            it "responds not successfully" do
              expect(response).not_to be_successful
            end
          end
          context "302レスポンスを返すこと" do
            it "returns a 302 response" do
              expect(response).to have_http_status "302"
            end
          end
          context "ルート画面にリダイレクトすること" do
            it "redirects to the root page" do
              expect(response).to redirect_to root_path
            end
          end
        end
      end


      context "ゲストとして" do
        context "as a guest" do
          before do
            student = FactoryBot.create(:student, :sample)
            get :student_edit, params: { student_id: student.id }
          end
          context "正常にレスポンスを返さないこと" do
            it "responds not successfully" do
              expect(response).not_to be_successful
            end
          end
          context "302レスポンスを返すこと" do
            it "returns a 302 response" do
              expect(response).to have_http_status "302"
            end
          end
          context "ルート画面にリダイレクトすること" do
            it "redirects to the root page" do
              expect(response).to redirect_to root_path
            end
          end
        end
      end
    end
  end
end
