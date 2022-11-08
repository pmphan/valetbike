require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "John", last_name: "Doe", email: "jdoe@gmail.com",
                     password: "johndoe123", password_confirmation: "johndoe123")
  end

  test "valid" do
    assert @user.valid?
  end

  test "missing first name" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "missing last name" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "missing email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "missing password" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "no duplicate" do
    dup = @user.dup
    @user.save
    assert_not dup.valid?
  end

  test "invalid email" do
    cases = %w[@gmail.com usergmail.com]
    cases.each do |email|
      @user.email = email
      assert_not @user.valid?, "Email invalid test fails for: #{email}"
    end
  end

  test "password mismatch" do
    @user.password_confirmation = "123456"
    assert_not @user.valid?
  end

  test "password too short" do
    @user.password = "john"
    @user.password_confirmation = "john"
    assert_not @user.valid?
  end

end
