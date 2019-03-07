require_relative 'spec_helper'

feature 'Entering the webpage' do
    scenario 'creating a new user' do
        visit '/'
        expect(page).to have_content 'Welcome to Game shop!'
        within '#registerForm' do
            fill_in 'username', with: 'rspecUser'
            fill_in 'mail',     with: 'rspec@Mail.com'
            fill_in 'password', with: 'rspecPass'
            fill_in 'phone',    with: '0000'
        end
        click_button 'Create'
    end
end
