require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  describe "#index" do
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
  end
end
