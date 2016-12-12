require "rails_helper"

RSpec.feature "用户可以退出" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit "/"
    
    click_link "登录"
    fill_in "邮箱", with: user.email
    fill_in "密码", with: "password"
    click_button "登录"
  end

  scenario "成功" do
    visit "/"
    click_link "退出"

    expect(page).to have_content "退出成功"
    expect(page).not_to have_content "Signed in as #{user.email}"
    expect(page).not_to have_link "退出"
  end
end
