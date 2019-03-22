require_relative 'spec_helper'
require_relative 'helper_class'

feature 'Entering the webpage' do
    scenario 'creating a new user' do
        visit '/'
        expect(page).to have_content 'Welcome to Game shop!'
        within '#registerForm' do
            fill_in 'username', with: Helper.rspec_user
            fill_in 'mail',     with: Helper.rspec_mail
            fill_in 'password', with: Helper.rspec_pass 
            fill_in 'phone',    with: Helper.rspec_phone 
        end
        click_button 'Create'
    end

    scenario 'login and logout' do
        visit '/'
        expect(page).to have_content 'Welcome to Game shop!'
        within '#loginForm' do
            fill_in 'username', with: Helper.rspec_user
            fill_in 'password', with: Helper.rspec_pass 
        end
        click_button 'Login'
    
        visit '/'
        expect(page).to have_content 'Welcome back'
        within '#logOut' do
            click_button 'Logout'
        end
    end
end
