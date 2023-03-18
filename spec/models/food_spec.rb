require 'rails_helper'

RSpec.describe Food, type: :model do
  current_user = User.first
  subject { Food.new(name: 'Turkey', measurement_unit: 'grams', price: '20.0', quantity: 4, user: current_user) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'measurement unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price should be equal or great than 0' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'Subject should be valid' do
    expect(subject).to be_valid
  end
end
