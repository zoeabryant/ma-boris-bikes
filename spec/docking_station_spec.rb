require 'docking_station'

describe DockingStation do
	let (:billy) { Bike.new }
	let (:moorgate) { DockingStation.new }

	def fill_station(station)
		10.times { station.dock(billy) }
	end

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
		fill_station(moorgate)
		expect(moorgate).to be_full
	end

	it 'should not accept a bike if at capacity' do
		fill_station(moorgate)
		expect(lambda {moorgate.dock(billy)}).to raise_error(RuntimeError)
	end

	it 'should provide the list of avaliable bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		moorgate.dock(working_bike)
		moorgate.dock(broken_bike)

		expect(moorgate.available_bikes).to eq([working_bike])
	end
end