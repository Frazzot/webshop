require_relative 'spec_helper'

feature 'Entering the webpage' do
    scenario 'creating a new user' do
        visit '/'
        expect(page).to have_content 'Welcome to Game shop!'
        within '#registerForm' do
            fill_in 'username', with: @rspec_user
            fill_in 'mail',     with: @rspec_mail
            fill_in 'password', with: @rspec_pass
            fill_in 'phone',    with: @rspec_phone
        end
        click_button 'Create'
    end
end
