require 'rails_helper'

describe "Beers page page" do
    let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }

    describe "on new beer page" do
        it "should be able to create a new beer with proper name" do
            visit new_beer_path
            fill_in('beer[name]', with:'testiolut')
            select('Lager', from:'beer[style]')
            select('Koff', from:'beer[brewery_id]')
            expect{click_button "Create Beer"}
            .to change{Beer.count}.from(0).to(1)
        end

        it "should not be able to create a new beer without name" do
            visit new_beer_path
            select('Lager', from:'beer[style]')
            select('Koff', from:'beer[brewery_id]')
            click_button('Create Beer')
            
            expect(page).to have_content "Name is too short"
            expect(Beer.count).to eq(0)
        end
    end
end