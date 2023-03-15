require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.feature 'Users#index view', type: :feature, js: true do
    before(:each) do
        @current_user = User.first
        @current_user.confirm if @current_user.confirmed_at == nil
        @recipe = Recipe.created_by_current_user(@current_user).first
        
        visit "#{base_url}/recipes"
        fill_in 'Email', with:@current_user.email
        fill_in 'Password', with:'123456'
        click_button 'Log in'
    end

    scenario 'Displaying recipes name' do
        # Wait until the recipe name appears on the page
        expect(page).to have_content(@recipe.name, wait: 5)

        # Now make the assertion
        expect(body).to have_content(@recipe.name)
    end

    scenario 'Displaying recipe remove button' do
        # wait
        expect(page).to have_css('form.button_to', wait: 5)
        # Make Assertion
        expect(page).to have_css('form.button_to')
    end
end