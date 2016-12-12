require "rails_helper"

RSpec.feature "可以注册新用户" do
  before do
    FactoryGirl.create(:user, email: "xiaoming@example.com")
    visit "/"
    
    click_link "注册"
    fill_in "Name", with: "dupeng"
  end

  scenario "如果提供正确的注册数据" do
    fill_in "Email", with: "dupeng83@outlook.com"
    fill_in "user[password]", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"

    expect(page).to have_content "注册成功"

    user1 = User.find_by(email: "dupeng83@outlook.com")
    expect(page.current_url).to eq user_url(user1)
  end

  scenario "如果email重复" do
    fill_in "Email", with: "xiaoming@example.com"
    fill_in "user[password]", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"

    expect(page).to have_content "注册失败"
    expect(page).to have_content "has already been taken"
  end

  scenario "如果密码不一致" do
    fill_in "Email", with: "dupeng83@outlook.com"
    fill_in "user[password]", with: "password"
    fill_in "Password confirmation", with: "password1"
    click_button "Create User"

    expect(page).to have_content "注册失败"
    expect(page).to have_content "doesn't match Password"
  end
end
