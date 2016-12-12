require "rails_helper"

RSpec.feature "用户可以登录" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit "/"
    
    click_link "登录"
  end

  scenario "如果提供正确的数据" do
    fill_in "邮箱", with: user.email
    fill_in "密码", with: "password"
    click_button "登录"

    expect(page).to have_content "登录成功"
    expect(page).to have_content "Signed in as #{user.email}"
  end
end
