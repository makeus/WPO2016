class Brewery < ActiveRecord::Base
	has_many :beers, dependent: :destroy

	def print_report
		puts self.name
		puts "established at year #{year}"
		puts "number of beers #{beers.count}"
	end

	def restart
		self.year = 2016
		puts "changed year ot #{year}"
	end
end
