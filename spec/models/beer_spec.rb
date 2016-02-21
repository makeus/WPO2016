require 'rails_helper'

RSpec.describe Beer, type: :model do

    let!(:style) { FactoryGirl.create :style }

    it "with proper name and style is saved" do
        beer = Beer.new name:"Testiolut", style:style
        expect(beer).to be_valid
        expect(beer.name).to eq("Testiolut")
    end

    describe "it is not saved" do
        it "without name" do
            beer = Beer.new style:style
            expect(beer).not_to be_valid
            expect(Beer.count).to eq(0)
        end
        it "without style" do
            beer = Beer.new name:"Testiolut"
            expect(beer).not_to be_valid
            expect(Beer.count).to eq(0)
        end
    end

end
