require 'spec_helper'

describe Category do

  describe 'validations' do
    let(:category1){Category.new(name:"Animals")}
    let(:category2){Category.new(name:"Toys")}

    it "must have a name" do
      category1.name = nil
      expect(category1).to be_invalid
    end

    it "must have a unique name" do
      category1.save
      category2.name = "Animals"
      expect(category2).to be_invalid
    end
  end
end
