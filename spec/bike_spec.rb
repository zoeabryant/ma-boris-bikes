require 'bike'

describe Bike do

	let(:billy) { Bike.new }

	it 'should not be broken when we create it' do
		expect(billy).not_to be_broken
	end

	it 'should be able to break' do
		billy.break!
		expect(billy).to be_broken
	end

	it "should be fixable" do
		billy.break!
		billy.fix!
		expect(billy).not_to be_broken
	end

end