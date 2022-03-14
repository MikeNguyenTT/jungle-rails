require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should save successfully' do
    @user = User.new(firtname: "Jane", lastname: "Doe", email: "jane@abc.com", password: "ABCDEFGH", password_confirmation: "ABCDEFGH")
    @user.save!

    expect(@user.firtname).to be_present
    expect(@user.lastname).to be_present
    expect(@user.email).to be_present
    expect(@user.password_digest).to be_present
  end

  it 'should have error if password and password_confirmation not match' do
    @user = User.new(firtname: "Jane", lastname: "Doe", email: "jane@abc.com", password: "ABCDEFGHIJK", password_confirmation: "ABCDEFGH")
    @user.save

    expect(@user.errors.full_messages).to be_present
    expect(@user.errors.full_messages.length).to be >= 0
  end

  it 'should have error if email is not unique' do
    @user1 = User.new(firtname: "Jane", lastname: "Doe", email: "JANE@abc.com", password: "ABCDEFGH", password_confirmation: "ABCDEFGH")
    @user1.save!

    @user2 = User.new(firtname: "Jane", lastname: "Strang", email: "jane@ABC.com", password: "ABCDEFGHIJK", password_confirmation: "ABCDEFGHIJK")
    @user2.save

    expect(@user2.errors.full_messages).to be_present
    expect(@user2.errors.full_messages.length).to be >= 0
  end

  it 'should have error if email is nil' do
    @user = User.new(firtname: "Jane", lastname: "Doe", password: "ABCDEFGH", password_confirmation: "ABCDEFGH")
    @user.save

    expect(@user.errors.full_messages).to be_present
    expect(@user.errors.full_messages.length).to be >= 0
  end

  it 'should have error if first name is nil' do
    @user = User.new(lastname: "Doe", email: "jane@abc.com", password: "ABCDEFGH", password_confirmation: "ABCDEFGH")
    @user.save

    expect(@user.errors.full_messages).to be_present
    expect(@user.errors.full_messages.length).to be >= 0
  end

  it 'should have error if last name is nil' do
    @user = User.new(firtname: "Jane", email: "jane@abc.com", password: "ABCDEFGH", password_confirmation: "ABCDEFGH")
    @user.save

    expect(@user.errors.full_messages).to be_present
    expect(@user.errors.full_messages.length).to be >= 0
  end

  it 'should have error if password length is less than 6' do
    @user = User.new(firtname: "Jane", lastname: "Doe", email: "jane@abc.com", password: "ABCDE", password_confirmation: "ABCDE")
    @user.save

    expect(@user.errors.full_messages).to be_present
    expect(@user.errors.full_messages.length).to be >= 0
  end

end

describe '.authenticate_with_credentials' do
  it 'should login if email and password matched' do
    @user = User.new(firtname: "Jane", lastname: "Doe", email: "jane@abc.com", password: "ABCDEFGH", password_confirmation: "ABCDEFGH")
    @user.save!

    @authenticatedUser = User.authenticate_with_credentials("jane@abc.com", "ABCDEFGH");
    expect(@authenticatedUser).to eq(@user) 
  end

  it 'should fail to login if password not matched' do
    @user = User.new(firtname: "Jane", lastname: "Doe", email: "jane@abc.com", password: "ABCDEFGH", password_confirmation: "ABCDEFGH")
    @user.save!

    @authenticatedUser = User.authenticate_with_credentials("jane@abc.com", "ABCDEFGHIJK");
    expect(@authenticatedUser).to be_nil
  end

  it 'should login if email have spaces in front and at the back' do
    @user = User.new(firtname: "Jane", lastname: "Doe", email: "jane@abc.com", password: "ABCDEFGHIJK", password_confirmation: "ABCDEFGHIJK")
    @user.save

    @authenticatedUser = User.authenticate_with_credentials("   jane@abc.com     ", "ABCDEFGHIJK");
    expect(@authenticatedUser).to eq(@user) 
  end

  it 'should login if email have wrong cases' do
    @user = User.new(firtname: "Jane", lastname: "Doe", email: "jane@abc.com", password: "ABCDEFGHIJK", password_confirmation: "ABCDEFGHIJK")
    @user.save

    @authenticatedUser = User.authenticate_with_credentials("   Jane@Abc.com     ", "ABCDEFGHIJK");
    expect(@authenticatedUser).to eq(@user) 
  end
end