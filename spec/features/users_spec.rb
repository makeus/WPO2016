require 'rails_helper'

include Helpers

describe "User" do
    let!(:user) { FactoryGirl.create :user }

    describe "who has signed up" do
        it "can signin with right credentials" do
            sign_in(username:"Pekka", password:"Foobar1")
            expect(page).to have_content 'Welcome back!'
            expect(page).to have_content 'Pekka'
        end
        it "is redirected back to signin form if wrong credentials given" do
            sign_in(username:"Pekka", password:"wrong")
            expect(current_path).to eq(signin_path)
            expect(page).to have_content 'Username and/or password mismatch'
        end
    end

    it "when signed up with good credentials, is added to the system" do
        visit signup_path
        fill_in('user_username', with:'Brian')
        fill_in('user_password', with:'Secret55')
        fill_in('user_password_confirmation', with:'Secret55')
        expect{click_button('Create User')}.to change{User.count}.by(1)
    end

    describe "regarding user ratings" do

        let!(:user2) { FactoryGirl.create :user, username: "ToinenJäbä" }

        it "without users no ratings should be shown on user page" do
            sign_in(username:"Pekka", password:"wrong")
            visit user_path(user)
            expect(page).not_to have_content "Ratings"
        end

        it "user shouldnt see ratings made by other users on his page" do
            brewery = FactoryGirl.create :brewery
            beer = FactoryGirl.create :beer, brewery:brewery
            FactoryGirl.create :rating, beer:beer, user:user2

            sign_in(username:"Pekka", password:"wrong")
            visit user_path(user)
            expect(page).not_to have_content "Ratings"
        end

        it "user should see his own ratings on his page" do
            brewery = FactoryGirl.create :brewery
            beer = FactoryGirl.create :beer, brewery:brewery
            FactoryGirl.create :rating, score:5, beer:beer, user:user
            FactoryGirl.create :rating, score:10, beer:beer, user:user

            sign_in(username:"Pekka", password:"wrong")
            visit user_path(user)
            expect(page).to have_content "Has made 2 ratings"
        end
    end
end