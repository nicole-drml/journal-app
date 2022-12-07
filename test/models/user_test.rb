require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "should not save User without a name" do
    user = User.new
    user.name = ''
    user.email = 'ndrml@google.com'
    user.password_digest = BCrypt::Password.create('henlo!!Okay')
    assert_not_nil user.save, "Saved the user without a name"
  end

  test "should not save User without an email" do
    user = User.new
    user.name = 'Kory Rio'
    user.email = ''
    user.password_digest = BCrypt::Password.create('henlo!!Okay')
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save User without a password" do
    user = User.new
    user.name = 'Kory Rio'
    user.email = 'ndrml@google.com'
    user.password_digest = ''
    assert_not_nil user.save, "Saved the user without a password"
  end

  test "should not save User with mismatched password" do
    user = User.new
    user.name = 'Kory Rio'
    user.email = 'ndrml@google.com'
    user.password_digest = BCrypt::Password.create('Password12345!')
    user.password_confirmation = BCrypt::Password.create('NOTPassword12345!')
    assert_not_nil user.save, "Passwords do not match"
  end

  test "should not save User if email already exists" do
    user = User.new
    user.name = "Hero Ant"
    user.email = 'antsie@google.com'
    user.password = BCrypt::Password.create('Password12345!')
    assert user.save, "Saved with unique email" 

    user2 = User.new
    user2.name = "Villain Ant"
    user2.email = 'antsie@google.com'
    user2.password_digest = BCrypt::Password.create('Password12345!')
    assert_not user2.save, "Email already exists"
  end

  test "should not save User if email is in invalid format" do
    user = User.new
    user.email = 'ndrml@.com'
    assert_no_match( URI::MailTo::EMAIL_REGEXP, user.email, "Saved an email with no domain" )

    user2 = User.new
    user2.email = '@k.com'
    assert_no_match( URI::MailTo::EMAIL_REGEXP, user2.email, "Saved an email without a username" )
    
    user3 = User.new
    user3.email = 'hello you'
    assert_no_match( URI::MailTo::EMAIL_REGEXP, user3.email, "Saved an email with space/s" )

    user4 = User.new
    user4.email = 'hello@@you.com'
    assert_no_match( URI::MailTo::EMAIL_REGEXP, user4.email, "Saved an email with invalid format" )

    user5 = User.new
    user5.email = 'hello@hi.you.com'
    assert_no_match( URI::MailTo::EMAIL_REGEXP, user4.email, "Saved an email with invalid format" )

  end

  test "should save User if all conditions are met" do
    user1 = User.new
    user1.name = "Villain Ant"
    user1.email = 'antsie@google.com'
    assert_match( URI::MailTo::EMAIL_REGEXP, user1.email, "Saved an en email with local domain name, no TLD" )
    user1.password_digest = BCrypt::Password.create('Password12345!')
    assert user1.save, "Successfully registered"

    user = User.new
    user.name = "Village Ant"
    user.email = 'hello@local'
    assert_match( URI::MailTo::EMAIL_REGEXP, user.email, "Saved an en email with local domain name, no TLD" )
    user.password_digest = BCrypt::Password.create('Password12345!')
    assert user.save, "Successfully registered"
  end
end
