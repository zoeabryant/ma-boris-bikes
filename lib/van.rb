require_relative 'bike_container'
require_relative 'bike'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def collect_broken_bikes
		bikes.reject {|bike| !bike.broken? }
	end

	def return_working_bikes
		bikes.reject {|bike| bike.broken? }
	end
end
