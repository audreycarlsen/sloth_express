require 'spec_helper'

describe "validations" do
  let(:user) {User.new(username: “firstuser”,
                      email: "firstuser@gmail.com")}
  let(:user2) {User.new(username: “seconduser”,
                      email: "seconduser@gmail.com")}

  it "must have a username" do
    user.username = nil
    expect(user).to_not be_valid
  end

  it "must have a unique username" do
    user2.username = "firstuser"
    expect(user2).to_not be_valid
  end

  it "must have an email" do
    user.email = nil
    expect(user).to_not be_valid
  end
end
