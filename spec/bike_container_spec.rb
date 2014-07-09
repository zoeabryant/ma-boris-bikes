require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	let(:billy) { Bike.new }
	let(:holder) { ContainerHolder.new }

	def fill_station(station)
		10.times { station.dock(billy) }
	end

	it 'should accept a bike' do
		expect(holder.bike_count).to eq(0)
		holder.dock(billy)
		expect(holder.bike_count).to eq(1)
	end

	it 'should release a bike' do
		holder.dock(billy)
		holder.release(billy)
		expect(holder.bike_count).to eq(0)
	end

	it 'should know when it is full' do
		expect(holder).not_to be_full
		fill_station(holder)
		expect(holder).to be_full
	end

	it 'should not accept a bike if at capacity' do
		fill_station(holder)
		expect(lambda {holder.dock(billy)}).to raise_error(RuntimeError)
	end

	it 'should provide the list of avaliable bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)

		expect(holder.available_bikes).to eq([working_bike])
	end

end