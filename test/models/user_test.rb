require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "no_stars" do
  	user = User.new
  	assert user.no_stars == 0
  end

  test "add_star" do
  	user = User.new
  	assert user.no_stars == 0
  	user.add_star
  	assert user.no_stars == 1
  end
end
