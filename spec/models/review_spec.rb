require 'spec_helper'

describe Review do
	#test that review is linked to product_id
	#test that review is created
	#test that user can't make reviews on product selling
	let(:review){Review.new(title: "Nice", author: "Audrey", content: "This is nice", rating: 5)}

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

	it 'must have an integer rating' do
		review.rating = 'a'
		expect(review).to be_invalid
	end

	it 'must have a rating between 1 and 5' do
		review.rating = 6
		expect(review).to be_invalid
	end
end
