class User < ActiveRecord::Base
    include RatingAverage

    has_secure_password

    validates :username, uniqueness: true, length: { 
        minimum: 3,
        maximum: 15
    }

    validate :password_validation

    has_many :ratings, dependent: :destroy
    has_many :beers, through: :ratings
    has_many :breweries, through: :membership
    has_many :membership, dependent: :destroy
    has_many :beer_clubs, through: :membership

    def password_validation 
        if !password
            errors.add(:password, 'password is required')
            return
        end
        if password.length < 4
            errors.add(:password, 'password needs to be atleas 4')
        end

        if !(/.*[A-Z].*/).match(password)
            errors.add(:password, 'password needs to have atleast one capital letter')
        end

        if !(/.*[0-9].*/).match(password)
            errors.add(:password, 'password needs to have atleast one number')
        end
    end

    def favourite_beer
        return nil if highest_rated.nil?
        highest_rated.beer
    end

    def favourite_style
        return nil if highest_rated.nil?
        highest_rated.beer.style
    end

    def favourite_brewery
        return nil if highest_rated.nil?
        highest_rated.beer.brewery
    end

    def self.most_rated(n)
       User.all.sort_by{ |u| -(u.ratings.count||0) }.first(n)
    end

    private
        def highest_rated
            return nil if ratings.empty?
            ratings.sort_by(&:score).last
        end
end
