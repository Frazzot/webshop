require_relative 'spec_helper'
require_relative 'helper_class'

feature 'Shopping' do
    before :each do        
        visit '/'
        expect(page).to have_content 'Welcome to Game shop!'
        within '#loginForm' do
            fill_in 'username', with: Helper.rspec_user
            fill_in 'password', with: Helper.rspec_pass 
        end
        click_button 'Login'
    end

    scenario 'Add to cart' do
        visit '/account/category/action' 
        expect(page).to have_content 'Action'
        within '#game2' do
            click_button('Add to Cart')
        end
    end

    scenario 'Clear cart' do
        visit '/account/cart'
        expect(page).to have_content 'Cart'
        within '.listMenu' do
            click_button('Clear Cart')
        end
    end
end
