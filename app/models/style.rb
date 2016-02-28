class Style < ActiveRecord::Base
  has_many :beers

  def average_rating
     return 0 if beers.empty?
     sum = beers.to_a.reduce(0){
         |sum, b| sum + (b.average_rating || 0) 
     }
     sum / beers.count
  end

  def self.top(n)
    Style.all.sort_by{ |s| -(s.average_rating)}.first(n)
  end
end
