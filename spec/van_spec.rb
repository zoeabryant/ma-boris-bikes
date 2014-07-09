require 'van'

describe Van do
	let(:topsy) { Bike.new }
	let(:turvy) { Bike.new.break! }
	let(:van) { Van.new(:capacity => 25) }

	def give_me_a_mixed_bag_of_bikes
		# turvy.break!
		van.dock(topsy)
		van.dock(turvy)
	end

	it 'should allow setting default capacity on initialising' do
		expect(van.capacity).to eq(25)
	end

	it 'should collect broken bikes from docking_station' do
		give_me_a_mixed_bag_of_bikes
		van.collect_broken_bikes
		expect(van.collect_broken_bikes).to eq([turvy])
	end

	it 'should return working bikes to docking_station' do
		give_me_a_mixed_bag_of_bikes
		expect(van.return_working_bikes).to eq([topsy])
	end

end