module LoginSupport
  def sign_in_as_admin
    admin = FactoryBot.create(:staff, :admin)
    sign_in admin
    visit admin_screen_path
    expect(page).to have_content "管理者画面"
    click_link "受講生管理"
    expect(page).to have_content "受講生一覧"
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
