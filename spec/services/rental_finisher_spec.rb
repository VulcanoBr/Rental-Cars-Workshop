require 'rails_helper'

RSpec.describe RentalFinisher do
  describe '#finish' do
    it 'should finish the rental and notify customer' do
      subsidiary = create(:subsidiary)
      user = create(:user, subsidiary: subsidiary)
      car = create(:car, car_km: '100')
      customer = create(:personal_customer, email: 'lucas@gmail.com')
      rental = create(:rental, car: car, customer: customer, user: user)
      
      now = Time.zone.now
      mailer = double('Mailer')
      allow(RentalMailer).to receive(:send_return_receipt).with(rental.id)
      .and_return(mailer)
      allow(mailer).to receive(:deliver_now)
      allow(Time.zone).to receive(:now).and_return(now)
      
      described_class.new(rental, 200).finish

      expect(car.car_km).to eq 200
      expect(car.available?).to be true
      expect(rental.finished?).to be true
      expect(rental.finished_at).to eq now
      expect(mailer).to have_received(:deliver_now)
    
    end
  end
end