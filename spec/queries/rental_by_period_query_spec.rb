require 'rails_helper'

RSpec.describe RentalByPeriodQuery do 
  describe 'call' do
    it 'should return cars in a range' do
      subsidiary = create(:subsidiary)
      car = create(:car, subsidiary: subsidiary)
      customer = create(:personal_customer, email: 'lucas@gmail.com')
      other_subsidiary = create(:subsidiary)
      other_car = create(:car, subsidiary: other_subsidiary)
      
      start = 3.days.ago
      finish = 1.days.ago
      
      create_list(:finished_rental, 10, car: car, customer: customer, finished_at: 2.days.ago)
      create_list(:finished_rental, 5, car: other_car, customer: customer, finished_at: 2.days.ago)
      
      result =  described_class.new(start..finish).call
      export(result[car.id]).to eq 10
      export(result[other_car.id]).to eq 5
    end
  end
end