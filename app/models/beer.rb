class Beer < ActiveRecord::Base
    include RatingAverage
    belongs_to :brewery
    belongs_to :style
    has_many :ratings, dependent: :destroy
    has_many :raters, -> { uniq }, through: :ratings, source: :user
    
    validates :name, length: { minimum: 1 }
    validates :style, presence: true

    def to_s
        "#{brewery.name}: #{name}"
    end

    def self.top(n)
       Beer.all.sort_by{ |b| -(b.average_rating||0) }.first(n)
    end
end
