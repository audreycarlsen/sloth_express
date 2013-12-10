require 'spec_helper'

describe User do

  describe "validations" do
    let!(:user) {User.new(username: "firstuser",
                        email: "firstuser@gmail.com",
                        password: "123",
                        password_confirmation: "123")}
    let(:user2) {User.new(username: "seconduser",
                        email: "seconduser@gmail.com",
                        password: "456",
                        password_confirmation: "456")}

      it "must have a username" do
        user.username = nil
        expect(user).to_not be_valid
      end

      it "must have a unique username" do
        user.save
        user2.username = "firstuser"
        expect(user2).to_not be_valid
      end

      it "must have an email" do
        user.email = nil
        expect(user).to_not be_valid
      end

      it "must have a unique email" do
        user.save
        user2.email = "firstuser@gmail.com"
        expect(user2).to_not be_valid
      end

      it "must have an email with dot" do
        user.email = "firstuser@gmailcom"
        expect(user).to_not be_valid
      end

      it "must have an email with at symbol" do
        user.email = "firstusergmail.com"
        expect(user).to_not be_valid
      end

      it "must accept valid email" do
        expect(user).to be_valid
      end

      it "must have password confirmation be the same as password" do
        user.password = "123"
        user.password_confirmation = "456"
        expect(user).to_not be_valid
      end

  end
end
