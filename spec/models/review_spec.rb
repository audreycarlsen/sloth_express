require 'spec_helper'

describe Review do
	#test that review is linked to product_id
	#test that review is created
	#test that user can't make reviews on product selling
	let a = Product.review.create(title: )

	it 'must have a title' do
		review.title = nil
		expect(review).to be_invalid
	end

	it 'must have an author' do
		review.author = nil
		expect(review).to be_invalid
	end

	it 'must have content' do
		review.content = nil
		expect(review).to be_invalid
	end
end
