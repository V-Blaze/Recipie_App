require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.feature 'Recipes#index view', type: :feature do
  before(:each) do
    @current_user = User.first
    @current_user.confirm if @current_user.confirmed_at.nil?
    @food = Food.find_by(user_id: @current_user.id)

    visit "#{base_url}/foods"
    fill_in 'Email', with: @current_user.email
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  scenario 'Displaying recipes name' do
    # Wait until the recipe name appears on the page
    expect(page).to have_content(@food.name, wait: 5)

    # Now make the assertion
    expect(body).to have_content(@food.name)
  end

  scenario 'Displaying food delete button' do
    # wait
    expect(page).to have_css('.item_detail td a', wait: 5)
    # Make Assertion
    expect(page).to have_css('.item_detail td a')
  end

  scenario 'delete food by clicking on delete button' do
    food = @current_user.foods[1]
    delete = page.all('.item_detail td a')[1]
    delete.click
    expect(page).to have_no_content(food.name)
  end
end
