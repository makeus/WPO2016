class Rating < ActiveRecord::Base
	belongs_to :beer

	def to_s
		if(self.beer)
			"#{self.beer.name} #{score}"
		else
			"#{score}"
		end
	end
end
