require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: 'Bart', 
                     email: 'bart@simpsons.com',
                     password: 'passw0rd!',
                     password_confirmation: 'passw0rd!')
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "requires a name to be set" do
    @user.name = nil
    assert_not @user.valid?
  end
  
  test "requires an email to be set" do
    @user.email = nil
    assert_not @user.valid?
  end
  
  test "requires the username to be less than 10 chars" do
    @user.name = '1234567890A'
    assert_not @user.valid?
  end
end
