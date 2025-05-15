require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(username: "exampleuser", email: "user@example.com", password: "password", password_confirmation: "password")
  end

  it "authenticates with correct password" do
    expect(@user.authenticate("password")).to eq(@user)
  end

  it "does not authenticate with incorrect password" do
    expect(@user.authenticate("wrongpassword")).to be_falsey
  end

  it "stores password securely" do
    expect(@user.password_digest).not_to eq("password")
  end
end
