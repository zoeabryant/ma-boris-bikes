require 'garage'

describe Garage do
	let(:billy) { Bike.new }
	let(:garage) { Garage.new(:capacity => 135) }

	it 'should allow setting default capacity on initialising' do
		expect(garage.capacity).to eq(135)
	end

	it 'should accept and fix a bike' do
		billy.break!
		garage.accept_and_fix_bike(billy)
		expect(billy).not_to be_broken
	end

end