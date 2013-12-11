require 'spec_helper'

describe Product do

  describe 'validations' do
    let(:product1){Product.new(name:"Panda", price:4.40,user_id:1)}
    let(:product2){Product.new(name:"Sloth", price:44.40, user_id:2)}

    it "must have a name" do
      product1.name = nil
      expect(product1).to be_invalid
    end

    it "must have a unique name" do
      product2.name = "Panda"
      expect(product2).to be_invalid
    end

    it "must have a price" do
      product1.price = nil
      expect(product1).to be_invalid
    end

    it "must have a numerical price" do
      expect(product1).to be_valid
    end

    it "cannot have a price that is a letter" do
      product1.price = 'a'
      expect(product1).to be_invalid
    end

    it "cannot have a price that is a blank string" do
      product1.price = ' '
      expect(product1).to be_invalid
    end

    it "must have a price that is greater than 0" do
      expect(product1).to be_valid
    end

    it "cannot have a price that is less than 0" do
      product1.price = -1
      expect(product1).to be_invalid
    end

    it "must belong to a user" do
      product1.user_id = nil
      expect(product1).to be_invalid
    end
  end
end




# describe Product do

#   describe 'validations' do
#     it 'must have a name' do
#       expect(Product.new(name: nil)).to_be invalid
#     end
#     # What does validate_uniqueness_of actually test?
#     it 'must not accept duplicate names' do
#       product1 = Product.create(name: "Panda")
#       expect(Product.create(name: "Panda")).to validate_uniqueness_of(:name)
#     end
#     it 'must have a price' do
#       expect(Product.new(price: nil)).to_be invalid
#     end
#     # What does validate_numericality_of actually test?
#     it 'must not accept a string price' do
#       expect(Product.create(price: "a")).to validate_numericality_of(:price)
#     end
#     it 'must accept a number price' do
#     end
#   end
# end
