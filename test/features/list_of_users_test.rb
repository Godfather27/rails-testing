require "test_helper"

class ListOfUsersTest < Capybara::Rails::TestCase

  test "user#index page contains heading" do
    visit users_path
    assert_content page, "Users"
    refute_button page, "load info"
  end

  test "user#index page contains button load info" do
    Capybara.current_driver = Capybara.javascript_driver
    visit users_path
    save_screenshot('tmp/list_of_users_screenshot.png', :full => true)
    assert_content page, "Users"
    assert_button page, "load info"
  end

  test "user#new page user can be created" do
    visit new_user_path
    fill_in 'user_first_name', :with => 'Fronz'
    fill_in 'user_middle_initial', :with => 'Günther'
    fill_in 'user_last_name', :with => 'Herbert'
    click_button('Create User')
    assert_content page, 'Fronz'
  end

  test "user#new page user can't be created" do
    visit new_user_path
    fill_in 'user_first_name', :with => 'Fronz'
    fill_in 'user_last_name', :with => 'Herbert'
    click_button('Create User')
    refute_content page, 'Fronz'
  end

  test "user#show star+1 button exists" do
    visit user_path(users(:one).id)
    assert_button('add_star')
    assert users(:one).no_stars == 0
    click_button('add_star')
    assert_content page, 'Users'
    assert users(:one).no_stars == 1
  end

end
