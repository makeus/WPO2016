class Brewery < ActiveRecord::Base
    include RatingAverage
    has_many :beers, dependent: :destroy
    has_many :ratings, through: :beers

    validates :name, length: { minimum: 1 }
    validates :year, numericality: { 
        greater_than_or_equal_to: 1042, 
        less_than_or_equal_to: 2016,
        only_integer: true 
    }


    scope :active, -> { where active:true }
    scope :retired, -> { where active:[nil,false] }

    def print_report
        puts self.name
        puts "established at year #{year}"
        puts "number of beers #{beers.count}"
    end

    def restart
        self.year = 2016
        puts "changed year ot #{year}"
    end

     def self.top(n)
       Brewery.all.sort_by{ |b| -(b.average_rating||0) }.first(n)
    end

end
