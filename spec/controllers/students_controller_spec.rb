require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe "#index" do
    context "正常系" do
      context "管理者としてログインしたとき" do
        context "as admin" do
          before do
            admin = FactoryBot.create(:staff, :admin)
            sign_in admin
            get :index
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
            get :index
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
            get :index
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

      context "セルフケアコースの受講生としてログインしたとき" do
        context "as a self care coure student" do
          before do
            student = FactoryBot.create(:student, :self_care)
            sign_in student
            get :index
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
            get :index
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
  describe "#show" do
    context "正常系" do
      context "管理者としてログインしたとき" do
        context "as admin" do
          before do
            admin = FactoryBot.create(:staff, :admin)
            sign_in admin
            student = FactoryBot.create(:student)
            get :show, params: { id: student.id }
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
            student = FactoryBot.create(:student)
            get :show, params: { id: student.id }
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
            another_student = FactoryBot.create(:student)
            get :show, params: { id: another_student.id }
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

      context "セルフケアコースの受講生としてログインしたとき" do
        context "as a self care course student" do
          before do
            student = FactoryBot.create(:student, :self_care)
            sign_in student
            another_student = FactoryBot.create(:student)
            get :show, params: { id: another_student.id }
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
            student = FactoryBot.create(:student)
            get :show, params: { id: student.id }
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
  describe "#update" do
    context "正常系" do
      context "管理者としてログインしたとき" do
        context "as admin" do
          before do
            admin = FactoryBot.create(:staff, :admin)
            sign_in admin
            @student = FactoryBot.create(:student)
            student_params = FactoryBot.attributes_for(:student, name: "abc")
            patch :update, params: { id: @student.id, student: student_params }
          end
          context "abcに更新されること" do
            it "responds successfully" do
              expect(@student.reload.name).to eq "abc"
            end
          end
          context "詳細ページへリダイレクトされること" do
            it "redirets to " do
              expect(response).to redirect_to student_path
            end
          end
          context "302レスポンスを返すこと" do
            it "returns a 302 response" do
              expect(response).to have_http_status "302"
            end
          end
          context "ルート画面にリダイレクトされないこと" do
            it "redirects to the root page" do
              expect(response).to_not redirect_to "/"
            end
          end
        end
      end
    end

    context "異常系" do
      context "スタッフとしてログインしたとき" do
        context "as a staff" do
          before do
            @staff = FactoryBot.create(:staff)
            sign_in @staff
            @student = FactoryBot.create(:student)
            student_params = FactoryBot.attributes_for(:student, name: "abc")
            patch :update, params: { id: @student.id, student: student_params }
          end
          context "abcに更新されないこと" do
            it "not updated to abc" do
              expect(@student.reload.name).to_not eq "abc"
            end
          end
          context "正常にレスポンスを返さないこと" do
            it "responds not successfully" do
              expect(response).to_not be_successful
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
            @another_student = FactoryBot.create(:student)
            student_params = FactoryBot.attributes_for(:student, name: "abc")
            patch :update, params: { id: @another_student.id, student: student_params }
          end
          context "abcに更新されないこと" do
            it "not updated to abc" do
              expect(@another_student.reload.name).to_not eq "abc"
            end
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
            @another_student = FactoryBot.create(:student)
            student_params = FactoryBot.attributes_for(:student, name: "abc")
            patch :update, params: { id: @another_student.id, student: student_params }
          end
          context "abcに更新されないこと" do
            it "not updated to abc" do
              expect(@another_student.reload.name).to_not eq "abc"
            end
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
            @student = FactoryBot.create(:student)
            student_params = FactoryBot.attributes_for(:student, name: "abc")
            patch :update, params: { id: @student.id, student: student_params }
          end
          context "abcに更新されないこと" do
            it "not updated to abc" do
              expect(@student.reload.name).to_not eq "abc"
            end
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
  describe "#destroy" do
    context "正常系" do
      context "管理者としてログインしたとき" do
        context "as admin" do
          before do
            admin = FactoryBot.create(:staff, :admin)
            sign_in admin
            @student = FactoryBot.create(:student)
          end
          context "削除されること" do
            it "admin deletes student" do
              expect {
                delete :destroy, params: { id: @student.id }
              }.to change(Student, :count).by(-1)
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
            @student = FactoryBot.create(:student)
          end
          context "削除できないこと" do
            it "does not delelt student" do
              expect {
                delete :destroy, params: { id: @student.id }
              }.to_not change(Student, :count)
            end
          end
        end
      end
      context "セラピスト養成コースの受講生としてログインしたとき" do
        context "as a therapist training course student" do
          before do
            student = FactoryBot.create(:student)
            sign_in student
            @another_student = FactoryBot.create(:student)
          end
          context "削除できないこと" do
            it "does not delete student" do
              expect {
                delete :destroy, params: { id: @another_student.id }
              }.to_not change(Student, :count)
            end
          end
        end
      end
      context "セルフケアコースの受講生としてログインしたとき" do
        context "as a self care coure student" do
          before do
            student = FactoryBot.create(:student, :self_care)
            sign_in student
            @another_student = FactoryBot.create(:student)
          end
          context "削除できないこと" do
            it "does not delete student" do
              expect {
                delete :destroy, params: { id: @another_student.id }
              }.to_not change(Student, :count)
            end
          end
        end
      end
 
      context "ゲストとして" do
        context "as a guest" do
          before do
            @student = FactoryBot.create(:student)
          end
          context "削除できないこと" do
            it "does not delete student" do
              expect {
                delete :destroy, params: { id: @student.id }
              }.to_not change(Student, :count)
            end
          end
        end
      end
    end
  end
end

