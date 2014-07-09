require 'docking_station'

describe DockingStation do
	let (:billy) { Bike.new }
	let (:moorgate) { DockingStation.new }

	it 'should accept a bike' do
		expect(moorgate.bike_count).to eq(0)
		moorgate.dock(billy)
		expect(moorgate.bike_count).to eq(1)
	end

	it 'should release a bike' do
		moorgate.dock(billy)
		moorgate.release(billy)
		expect(moorgate.bike_count).to eq(0)
	end

	it 'should know when it is full' do
		expect(moorgate).not_to be_full
		20.times { moorgate.dock(billy) }
		expect(moorgate).to be_full
	end
end