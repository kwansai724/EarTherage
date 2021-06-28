require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  describe "#edit" do

    context "正常系" do

      context "管理者は管理者自身のブログにeditでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @admin = Staff.find(@admin_blog.staff_id)
        end

        it "responds successfully" do
          sign_in @admin
          get :edit, params: { staff_id: @admin.id, id: @admin_blog.id }
          expect(response).to be_successful
        end
      end

      context "管理者はスタッフのブログにeditでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @admin = FactoryBot.create(:staff, :admin)
        end

        it "responds successfully" do
          sign_in @admin
          get :edit, params: { staff_id: @admin.id, id: @blog.id }
          expect(response).to be_successful
        end
      end

      context "スタッフは自分自身のブログにeditでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @staff = Staff.find(@blog.staff_id)
        end

        it "responds successfully" do
          sign_in @staff
          get :edit, params: { staff_id: @staff.id, id: @blog.id }
          expect(response).to be_successful
        end
      end

    end

    context "異常系" do

       context "スタッフは管理者のブログにeditでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @staff = FactoryBot.create(:staff)
        end

        it "redirects to the dashboard" do
          sign_in @staff
          get :edit, params: { staff_id: @staff.id, id: @admin_blog.id }
          expect(response).to redirect_to root_path
        end
      end

      context "スタッフは他のスタッフのブログにeditでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @other_staffs_blog = FactoryBot.create(:blog)
          @staff = Staff.find(@blog.staff_id)
        end

        it "redirects to the dashboard" do
          sign_in @staff
          get :edit, params: { staff_id: @staff.id, id: @other_staffs_blog.id }
          expect(response).to redirect_to root_path
        end
      end

      context "ゲストは管理者のブログにeditでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @staff = FactoryBot.create(:staff)
        end

        it "redirects to the dashboard" do
          get :edit, params: { staff_id: @staff.id, id: @admin_blog.id }
          expect(response).to redirect_to root_path
        end
      end

      context "ゲストはスタッフのブログにeditでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @staff = Staff.find(@blog.staff_id)
        end

        it "redirects to the dashboard" do
          get :edit, params: { staff_id: @staff.id, id: @blog.id }
          expect(response).to redirect_to root_path
        end
      end


    end

  end

  describe "#update" do

    context "正常系" do

      context "管理者は管理者自身のブログにupdateでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @admin = Staff.find(@admin_blog.staff_id)
        end

        it "responds successfully" do
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          sign_in @admin
          patch :update, params: {staff_id: @admin.id, id: @admin_blog.id, blog: blogs_params }
          expect(@admin_blog.reload.title).to eq "New Blog Name"
        end
      end

      context "管理者はスタッフのブログにupdateでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @admin = FactoryBot.create(:staff, :admin)
        end

        it "responds successfully" do
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          sign_in @admin
          patch :update, params: {staff_id: @admin.id, id: @blog.id, blog: blogs_params }
          expect(@blog.reload.title).to eq "New Blog Name"
        end
      end

      context "スタッフは自分自身のブログにupdateでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @staff = Staff.find(@blog.staff_id)
        end

        it "responds successfully" do
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          sign_in @staff
          patch :update, params: {staff_id: @staff.id, id: @blog.id, blog: blogs_params }
          expect(@blog.reload.title).to eq "New Blog Name"
        end
      end

    end

    context "異常系" do

       context "スタッフは管理者のブログにupdateでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          #puts @admin_blog.title
          @staff = FactoryBot.create(:staff)
        end

        it "redirects to the dashboard" do
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          sign_in @staff
          patch :update, params: {staff_id: @staff.id, id: @admin_blog.id, blog: blogs_params }
          expect(@admin_blog.reload.title).to eq "title12"
          expect(response).to redirect_to root_path
        end
      end

       context "スタッフは他のスタッフのブログにupdateでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @other_staffs_blog = FactoryBot.create(:blog)
          #puts @other_staffs_blog.title
          @staff = Staff.find(@blog.staff_id)
        end

        it "redirects to the dashboard" do
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          sign_in @staff
          patch :update, params: {staff_id: @staff.id, id: @other_staffs_blog.id, blog: blogs_params }
          expect(@other_staffs_blog.reload.title).to eq "title14"
          expect(response).to redirect_to root_path
        end
      end

      context "ゲストは管理者のブログにupdateでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          #puts @admin_blog.title
          @staff = FactoryBot.create(:staff)
        end

        it "redirects to the dashboard" do
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: @staff.id, id: @admin_blog.id, blog: blogs_params }
          expect(@admin_blog.reload.title).to eq "title15"
          expect(response).to redirect_to root_path
        end
      end

       context "ゲストはスタッフのブログにupdateでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          #puts @blog.title
          @staff = Staff.find(@blog.staff_id)
        end

        it "redirects to the dashboard" do
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: @staff.id, id: @blog.id, blog: blogs_params }
          expect(@blog.reload.title).to eq "title16"
          expect(response).to redirect_to root_path
        end
      end



    end

  end

  describe "#destroy" do

    context "正常系" do

      context "管理者は管理者自身のブログにdeleteでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @admin = Staff.find(@admin_blog.staff_id)
        end

        it "responds successfully" do
          sign_in @admin
          expect {
            delete :destroy, params: {staff_id: @admin.id, id: @admin_blog.id}
          }.to change(@admin.blogs, :count).by(-1)
        end
      end

      context "管理者はスタッフのブログにdeleteでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @staff = Staff.find(@blog.staff_id)
          @admin = FactoryBot.create(:staff, :admin)
        end

        it "responds successfully" do
          sign_in @admin
          expect {
            delete :destroy, params: {staff_id: @admin.id, id: @blog.id}
          }.to change(@staff.blogs, :count).by(-1)
        end
      end

      context "スタッフは自分自身のブログにdeleteでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @staff = Staff.find(@blog.staff_id)
        end

        it "responds successfully" do
          sign_in @staff
          expect {
            delete :destroy, params: {staff_id: @staff.id, id: @blog.id}
          }.to change(@staff.blogs, :count).by(-1)
        end
      end

    end

    context "異常系" do

      context "スタッフは管理者のブログにdeleteでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @staff = FactoryBot.create(:staff)
        end

        it "redirects to the dashboard " do
          sign_in @staff
          expect {
            delete :destroy, params: {staff_id: @staff.id, id: @admin_blog.id}
          }.to_not change(Blog, :count)
          expect(response).to redirect_to root_path
        end
      end

      context "スタッフは他のスタッフのブログにdeleteでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @other_staffs_blog = FactoryBot.create(:blog)
          @staff = Staff.find(@blog.staff_id)
        end

        it "redirects to the dashboard " do
          sign_in @staff
          expect {
            delete :destroy, params: {staff_id: @staff.id, id: @other_staffs_blog.id}
          }.to_not change(Blog, :count)
          expect(response).to redirect_to root_path
        end
      end

      context "ゲストは管理者のブログにdeleteでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @staff = FactoryBot.create(:staff)
        end

        it "redirects to the dashboard " do
          expect {
            delete :destroy, params: {staff_id: @staff.id, id: @admin_blog.id}
          }.to_not change(Blog, :count)
          expect(response).to redirect_to root_path
        end
      end

      context "ゲストはスタッフのブログにdeleteでアクセス" do
        before do
          @blog = FactoryBot.create(:blog)
          @staff = Staff.find(@blog.staff_id)
          #blog = FactoryBot.create(:blog)
          blog = []
          1.upto 4 do |n|
            blog[n] = FactoryBot.create(:blog)
          end
          #puts blog[4].datetime
        end

        it "redirects to the dashboard " do
          expect {
            delete :destroy, params: {staff_id: @staff.id, id: @blog.id}
          }.to_not change(Blog, :count)
          expect(response).to redirect_to root_path
        end
      end





    end
  end
end
