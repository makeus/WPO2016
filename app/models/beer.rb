class Beer < ActiveRecord::Base
	belongs_to :brewery
  	has_many :ratings

  	def average_rating
  		total = self.ratings.reduce 0 do |sum, n|
  			sum + n.score
		end

  		if self.ratings.count > 0
  			total.to_f / self.ratings.count
  		end
  	end
end
