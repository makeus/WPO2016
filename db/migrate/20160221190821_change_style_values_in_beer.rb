class ChangeStyleValuesInBeer < ActiveRecord::Migration
  def up
    Beer.find_each do |beer|
      style = Style.where(name: beer.old_style).first
      if !style
        style = Style.create name: beer.old_style
      end
      beer.style = style
      beer.save!
    end
  end

  def down
    Style.clear
  end
end
