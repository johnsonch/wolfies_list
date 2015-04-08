require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "flash message dissapears after login failure" do
    post login_path, session: { email: '', password: ''}
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
