require 'rails_helper'
require 'spec_helper'

RSpec.describe Recipe, type: :model do
  current_user = User.first

  subject do
    Recipe.new(name: 'Pizza', description: 'All the best description', cooking_time: 30, preparation_time: 30,
               public: true, user: current_user)
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'cooking time should be an integer' do
    expect(subject.cooking_time).to be_a_float
  end

  it 'Preparation_time must be a positive integer' do
    expect(subject.preparation_time).to be_positive.and be_a_float
  end

  it 'Public must be a boolean value [true or false]' do
    expect(subject.public).to be_a_boolean
  end

  it 'should return only Recipes with the public attibute set to true' do
    expect(Recipe.public_recipes_ordered_by_newest.count).to eq(2)
  end

  it 'should return only Recipes created by the current user' do
    @recipes = Recipe.created_by_current_user(current_user)
    current_user_id = @recipes.first.user.id

    expect(current_user_id).to eq(current_user.id)
  end
end
