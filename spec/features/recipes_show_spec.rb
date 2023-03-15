require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.feature 'Users#index view', type: :feature, js: true do
    before(:each) do
        @current_user = User.first
        @current_user.confirm if @current_user.confirmed_at == nil
        @recipe = Recipe.created_by_current_user(@current_user).first
        puts @recipe.name
        visit "#{base_url}/recipes/#{@recipe.id}"
    end

    scenario 'Displaying recipes name' do
        # Wait until the recipe name appears on the page
        expect(page).to have_content(@recipe.name, wait: 5)

        # Now make the assertion
        expect(body).to have_content(@recipe.name)
    end

    scenario 'Displaying recipes cooking time' do
        # Wait until the recipe name cooking_time on the page
        expect(page).to have_content(@recipe.cooking_time, wait: 5)

        # Now make the assertion
        expect(body).to have_content(@recipe.cooking_time)
    end

    scenario 'Displaying recipes preparation time' do
        # Wait until the recipe name preparation_time on the page
        expect(page).to have_content(@recipe.preparation_time, wait: 5)

        # Now make the assertion
        expect(body).to have_content(@recipe.preparation_time)
    end

    scenario 'Displaying recipes Description' do
        # Wait until the recipe Description appears on the page
        expect(page).to have_content(@recipe.description, wait: 5)

        # Now make the assertion
        expect(body).to have_content(@recipe.description)
    end
end