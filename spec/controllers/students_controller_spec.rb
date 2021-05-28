require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe "#index" do
    before do
      @student = FactoryBot.create(:student)
    end

    # 正常にレスポンスを返すこと
    it "responds successfully" do
      sign_in @student
      get :index
      expect(response).to be_successful
    end

    # 200レスポンスを返すこと
    it "returns a 200 response" do
      sign_in @student
      get :index
      expect(response).to have_http_status "200"
    end
  end
end
