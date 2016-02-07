class User < ActiveRecord::Base
    include RatingAverage

    validates :username, uniqueness: true, length: { 
        minimum: 3,
        maximum: 15
    }

    has_many :ratings
    has_many :beers, through: :ratings
    has_many :breweries, through: :membership
    has_many :membership, dependent: :destroy
    has_many :beer_clubs, through: :membership
end
