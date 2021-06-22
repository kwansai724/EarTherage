require 'rails_helper'

RSpec.describe "Students", type: :system do
  it "does something useful" do
    admin = FactoryBot.create(:staff, :admin)
    sign_in admin
    visit admin_screen_path
    expect(page).to have_content "管理者画面"
  end
end
