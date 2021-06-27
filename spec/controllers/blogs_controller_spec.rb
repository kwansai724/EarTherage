require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  describe "#new" do
    context "正常系" do
      context "管理者は管理者自身のブログにnewでアクセス" do
        before do
          admin = FactoryBot.create(:staff, :admin)
          sign_in admin
          get :new, params: { staff_id: admin.id }
        end
        context "正常にレスポンスを返すこと200レスポンスを返すこと" do
          it "responds successfully and returns a 200 response" do
            expect(response).to be_successful
            expect(response).to have_http_status "200"
          end
        end
      end

      context "管理者はスタッフのブログにnewでアクセス" do
        before do
          staff = FactoryBot.create(:staff)
          admin = FactoryBot.create(:staff, :admin)
          sign_in admin
          get :new, params: { staff_id: staff.id }
        end
        context "正常にレスポンスを返すこと200レスポンスを返すこと" do
          it "responds successfully and returns a 200 response" do
            expect(response).to be_successful
            expect(response).to have_http_status "200"
          end
        end
      end

      context "スタッフはスタッフ自身のブログにnewでアクセス" do
        before do
          staff = FactoryBot.create(:staff)
          sign_in staff
          get :new, params: { staff_id: staff.id }
        end
        context "正常にレスポンスを返すこと200レスポンスを返すこと" do
          it "responds successfully and returns a 200 response" do
            expect(response).to be_successful
            expect(response).to have_http_status "200"
          end
        end
      end
    end

    context "異常系" do
      context "スタッフは管理者のブログにnewでアクセス" do
        before do
          admin = FactoryBot.create(:staff, :admin)
          staff = FactoryBot.create(:staff)
          sign_in staff
          get :new, params: { staff_id: admin.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "スタッフは別のスタッフのブログにnewでアクセス" do
        before do
          staff = FactoryBot.create(:staff)
          login_staff = FactoryBot.create(:staff)
          sign_in login_staff
          get :new, params: { staff_id: staff.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セラピスト養成コースの受講生は管理者のブログにnewでアクセス" do
        before do
          admin = FactoryBot.create(:staff, :admin)
          student = FactoryBot.create(:student)
          sign_in student
          get :new, params: { staff_id: admin.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セラピスト養成コースの受講生はスタッフのブログにnewでアクセス" do
        before do
          staff = FactoryBot.create(:staff)
          student = FactoryBot.create(:student)
          sign_in student
          get :new, params: { staff_id: staff.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セルフケアコースの受講生は管理者のブログにnewでアクセス" do
        before do
          admin = FactoryBot.create(:staff, :admin)
          student = FactoryBot.create(:student, :self_care)
          sign_in student
          get :new, params: { staff_id: admin.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セルフケアコースの受講生はスタッフのブログにnewでアクセス" do
        before do
          staff = FactoryBot.create(:staff)
          student = FactoryBot.create(:student, :self_care)
          sign_in student
          get :new, params: { staff_id: staff.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "ゲストは管理者のブログにnewでアクセス" do
        before do
          admin = FactoryBot.create(:staff, :admin)
          get :new, params: { staff_id: admin.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "ゲストはスタッフのブログにnewでアクセス" do
        before do
          staff = FactoryBot.create(:staff)
          get :new, params: { staff_id: staff.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end
    end
  end

  describe "#create" do
    context "正常系" do
      context "管理者は管理者自身のブログにcreateでアクセス" do
        before do
          @admin = FactoryBot.create(:staff, :admin)
          sign_in @admin
        end
        context "正常にレスポンスを返すこと200レスポンスを返すこと" do
          it "responds successfully and returns a 200 response" do
            admin_blog_params = FactoryBot.attributes_for(:blog, :admin)
            expect {
              post :create, params: { staff_id: @admin.id, blog: admin_blog_params }
            }.to change(@admin.blogs, :count).by(0)
            #expect(response).to redirect_to staff_blog_path(id: @admin.id, staff_id: @admin_blog)
            expect(response).to be_successful
            expect(response).to have_http_status "200"
            expect(response).to_not redirect_to "/"
          end
        end
      end
    end
  end





  describe "#edit" do
    context "正常系" do
      context "管理者は管理者自身のブログにeditでアクセス" do
        before do
          admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(admin_blog.staff_id)
          sign_in admin
          get :edit, params: { staff_id: admin.id, id: admin_blog.id }
        end
        context "正常にレスポンスを返すこと200レスポンスを返すこと" do
          it "responds successfully and returns a 200 response" do
            expect(response).to be_successful
            expect(response).to have_http_status "200"
          end
        end
      end

      context "管理者はスタッフのブログにeditでアクセス" do
        before do
          staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(staff_blog.staff_id)
          admin = FactoryBot.create(:staff, :admin)
          sign_in admin
          get :edit, params: { staff_id: staff.id, id: staff_blog.id }
        end
        context "正常にレスポンスを返すこと200レスポンスを返すこと" do
          it "responds successfully and returns a 200 response" do
           expect(response).to be_successful
           expect(response).to have_http_status "200"
          end
        end
      end

      context "スタッフは自分自身のブログにeditでアクセス" do
        before do
          staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(staff_blog.staff_id)
          sign_in staff
          get :edit, params: { staff_id: staff.id, id: staff_blog.id }
        end
        context "正常にレスポンスを返すこと200レスポンスを返すこと" do
          it "responds successfully and returns a 200 response" do
            expect(response).to be_successful
            expect(response).to have_http_status "200"
          end
        end
      end

    end

    context "異常系" do

       context "スタッフは管理者のブログにeditでアクセス" do
        before do
          admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(admin_blog.staff_id)
          staff = FactoryBot.create(:staff)
          sign_in staff
          get :edit, params: { staff_id: admin.id, id: admin_blog.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "スタッフは他のスタッフのブログにeditでアクセス" do
        before do
          staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(staff_blog.staff_id)
          login_staff = FactoryBot.create(:staff)
          sign_in login_staff
          get :edit, params: { staff_id: staff.id, id: staff_blog.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セラピスト養成コースの受講生は管理者のブログにeditでアクセス" do
        before do
          admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(admin_blog.staff_id)
          student = FactoryBot.create(:student)
          sign_in student
          get :edit, params: { staff_id: admin.id, id: admin_blog.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セラピスト養成コースの受講生はスタッフのブログにeditでアクセス" do
        before do
          staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(staff_blog.staff_id)
          student = FactoryBot.create(:student)
          sign_in student
          get :edit, params: { staff_id: staff.id, id: staff_blog.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セルフケアコースの受講生は管理者のブログにeditでアクセス" do
        before do
          admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(admin_blog.staff_id)
          student = FactoryBot.create(:student, :self_care)
          sign_in student
          get :edit, params: { staff_id: admin.id, id: admin_blog.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セルフケアコースの受講生はスタッフのブログにeditでアクセス" do
        before do
          staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(staff_blog.staff_id)
          student = FactoryBot.create(:student, :self_care)
          sign_in student
          get :edit, params: { staff_id: staff.id, id: staff_blog.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "ゲストは管理者のブログにeditでアクセス" do
        before do
          admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(admin_blog.staff_id)
          get :edit, params: { staff_id: admin.id, id: admin_blog.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "ゲストはスタッフのブログにeditでアクセス" do
        before do
          staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(staff_blog.staff_id)
          get :edit, params: { staff_id: staff.id, id: staff_blog.id }
        end
        context "正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトすること" do
          it "responds not successfully and returns a 302 response and redirects to the dashboard" do
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end
    end
  end

  describe "#update" do
    context "正常系" do
      context "管理者は管理者自身のブログにupdateでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(@admin_blog.staff_id)
          sign_in admin
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: admin.id, id: @admin_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されること、詳細ページへリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "updated to New Blog Name and redirects to show page and returns 302 response and not redirected to root page" do
            expect(@admin_blog.reload.title).to eq "New Blog Name"
            expect(response).to redirect_to staff_blog_path
            expect(response).to have_http_status "302"
            expect(response).to_not redirect_to "/"
          end
        end
      end

      context "管理者はスタッフのブログにupdateでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(@staff_blog.staff_id)
          admin = FactoryBot.create(:staff, :admin)
          sign_in admin
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: staff.id, id: @staff_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されること、詳細ページへリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "updated to New Blog Name and redirects to show page and returns 302 response and not redirected to root page" do
            expect(@staff_blog.reload.title).to eq "New Blog Name"
            expect(response).to redirect_to staff_blog_path
            expect(response).to have_http_status "302"
            expect(response).to_not redirect_to "/"
          end
        end
      end

      context "スタッフは自分自身のブログにupdateでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(@staff_blog.staff_id)
          sign_in staff
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: staff.id, id: @staff_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されること、詳細ページへリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "updated to New Blog Name and redirects to show page and returns 302 response and not redirected to root page" do
            expect(@staff_blog.reload.title).to eq "New Blog Name"
            expect(response).to redirect_to staff_blog_path
            expect(response).to have_http_status "302"
            expect(response).to_not redirect_to "/"
          end
        end
      end
    end

    context "異常系" do

       context "スタッフは管理者のブログにupdateでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(@admin_blog.staff_id)
          staff = FactoryBot.create(:staff)
          sign_in staff
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: admin.id, id: @admin_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されないこと、正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトされること" do
          it "not updated to New Blog Name and responds not successfully and returns a 302 response and redirects to root page" do
            expect(@admin_blog.reload.title).to_not eq "New Blog Name"
            expect(response).to_not be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to root_path
          end
        end
      end

      context "スタッフは他のスタッフのブログにupdateでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(@staff_blog.staff_id)
          login_staff = FactoryBot.create(:staff)
          sign_in login_staff
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: staff.id, id: @staff_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されないこと、正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトされること" do
          it "not updated to New Blog Name and responds not successfully and returns a 302 response and redirects to root page" do
            expect(@staff_blog.reload.title).to_not eq "New Blog Name"
            expect(response).to_not be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to root_path
          end
        end
      end

      context "セラピスト養成コースの受講生は管理者のブログにupdateでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(@admin_blog.staff_id)
          student = FactoryBot.create(:student)
          sign_in student
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: admin.id, id: @admin_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されないこと、正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトされること" do
          it "not updated to New Blog Name and responds not successfully and returns a 302 response and redirects to root page" do
            expect(@admin_blog.reload.title).to_not eq "New Blog Name"
            expect(response).to_not be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to root_path
          end
        end
      end

      context "セラピスト養成コースの受講生はスタッフのブログにupdateでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(@staff_blog.staff_id)
          student = FactoryBot.create(:student)
          sign_in student
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: staff.id, id: @staff_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されないこと、正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトされること" do
          it "not updated to New Blog Name and responds not successfully and returns a 302 response and redirects to root page" do
            expect(@staff_blog.reload.title).to_not eq "New Blog Name"
            expect(response).to_not be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to root_path
          end
        end
      end

      context "セルフケアコースの受講生は管理者のブログにupdateでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(@admin_blog.staff_id)
          student = FactoryBot.create(:student, :self_care)
          sign_in student
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: admin.id, id: @admin_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されないこと、正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトされること" do
          it "not updated to New Blog Name and responds not successfully and returns a 302 response and redirects to root page" do
            expect(@admin_blog.reload.title).to_not eq "New Blog Name"
            expect(response).to_not be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to root_path
          end
        end
      end

      context "セルフケアコースの受講生はスタッフのブログにupdateでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(@staff_blog.staff_id)
          student = FactoryBot.create(:student, :self_care)
          sign_in student
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: staff.id, id: @staff_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されないこと、正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトされること" do
          it "not updated to New Blog Name and responds not successfully and returns a 302 response and redirects to root page" do
            expect(@staff_blog.reload.title).to_not eq "New Blog Name"
            expect(response).to_not be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to root_path
          end
        end
      end

      context "ゲストは管理者のブログにupdateでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          admin = Staff.find(@admin_blog.staff_id)
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: admin.id, id: @admin_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されないこと、正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトされること" do
          it "not updated to New Blog Name and responds not successfully and returns a 302 response and redirects to root page" do
            expect(@admin_blog.reload.title).to_not eq "New Blog Name"
            expect(response).to_not be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to root_path
          end
        end
      end

      context "ゲストはスタッフのブログにupdateでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          staff = Staff.find(@staff_blog.staff_id)
          blogs_params = FactoryBot.attributes_for(:blog, title: "New Blog Name")
          patch :update, params: {staff_id: staff.id, id: @staff_blog.id, blog: blogs_params }
        end
        context "New Blog Nameに更新されないこと、正常にレスポンスを返さないこと、302レスポンスを返すこと、ルート画面にリダイレクトされること" do
          it "not updated to New Blog Name and responds not successfully and returns a 302 response and redirects to root page" do
            expect(@staff_blog.reload.title).to_not eq "New Blog Name"
            expect(response).to_not be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to root_path
          end
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
          sign_in @admin
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @admin.id, id: @admin_blog.id}
            }.to change(@admin.blogs, :count).by(-1)
            expect(response).to redirect_to staff_blogs_path
            expect(response).to have_http_status "302"
            expect(response).to_not redirect_to "/"
          end
        end
      end

      context "管理者はスタッフのブログにdeleteでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog, :admin)
          @staff = Staff.find(@staff_blog.staff_id)
          admin = FactoryBot.create(:staff, :admin)
          sign_in admin
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @staff.id, id: @staff_blog.id}
            }.to change(@staff.blogs, :count).by(-1)
            expect(response).to redirect_to staff_blogs_path
            expect(response).to have_http_status "302"
            expect(response).to_not redirect_to "/"
          end
        end
      end

      context "スタッフは自分自身のブログにdeleteでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog, :admin)
          @staff = Staff.find(@staff_blog.staff_id)
          sign_in @staff
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @staff.id, id: @staff_blog.id}
            }.to change(@staff.blogs, :count).by(-1)
            expect(response).to redirect_to staff_blogs_path
            expect(response).to have_http_status "302"
            expect(response).to_not redirect_to "/"
          end
        end
      end
    end

    context "異常系" do
      context "スタッフは管理者のブログにdeleteでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @admin = Staff.find(@admin_blog.staff_id)
          staff = FactoryBot.create(:staff)
          sign_in staff
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @admin.id, id: @admin_blog.id}
            }.to_not change(@admin.blogs, :count)
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "スタッフは他のスタッフのブログにdeleteでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          @staff = Staff.find(@staff_blog.staff_id)
          login_staff = FactoryBot.create(:staff)
          sign_in login_staff
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @staff.id, id: @staff_blog.id}
            }.to_not change(@staff.blogs, :count)
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セラピスト養成コースの受講生は管理者のブログにdeleteでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @admin = Staff.find(@admin_blog.staff_id)
          student = FactoryBot.create(:student)
          sign_in student
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @admin.id, id: @admin_blog.id}
            }.to_not change(@admin.blogs, :count)
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セラピスト養成コースの受講生はスタッフのブログにdeleteでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          @staff = Staff.find(@staff_blog.staff_id)
          student = FactoryBot.create(:student)
          sign_in student
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @staff.id, id: @staff_blog.id}
            }.to_not change(@staff.blogs, :count)
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セルフケアコースの受講生は管理者のブログにdeleteでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @admin = Staff.find(@admin_blog.staff_id)
          student = FactoryBot.create(:student, :self_care)
          sign_in student
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @admin.id, id: @admin_blog.id}
            }.to_not change(@admin.blogs, :count)
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "セルフケアコースの受講生はスタッフのブログにdeleteでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          @staff = Staff.find(@staff_blog.staff_id)
          student = FactoryBot.create(:student, :self_care)
          sign_in student
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @staff.id, id: @staff_blog.id}
            }.to_not change(@staff.blogs, :count)
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "ゲストは管理者のブログにdeleteでアクセス" do
        before do
          @admin_blog = FactoryBot.create(:blog, :admin)
          @admin = Staff.find(@admin_blog.staff_id)
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @admin.id, id: @admin_blog.id}
            }.to_not change(@admin.blogs, :count)
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end

      context "ゲストはスタッフのブログにdeleteでアクセス" do
        before do
          @staff_blog = FactoryBot.create(:blog)
          @staff = Staff.find(@staff_blog.staff_id)
        end
        context "削除されること、staff_blogs画面にリダイレクトされること、302レスポンスを返すこと、ルート画面にリダイレクトされないこと" do
          it "admin deletes blog and redirect to blogs page and returns a 200 response and does not redirect to root page" do
            expect {
              delete :destroy, params: {staff_id: @staff.id, id: @staff_blog.id}
            }.to_not change(@staff.blogs, :count)
            expect(response).not_to be_successful
            expect(response).to have_http_status "302"
            expect(response).to redirect_to "/"
          end
        end
      end
    end
  end
end
