require 'docking_station'

describe DockingStation do
	let (:moorgate) { DockingStation.new(:capacity => 123) }

	it 'should allow setting default capacity on initialising' do
		expect(moorgate.capacity).to eq(123)
	end
end