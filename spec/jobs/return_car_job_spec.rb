require 'rails_helper'

RSpec.describe CarReturnJob do 
  describe '.auto_enqueue' do
    it 'should queue successfully' do
      car = create(:car)
      rental = create(:rental, car: car, started_at: Time.zone.now)

      described_class.auto_enqueue(rental)

      expect(Delayed::Worker.new.work_off).to [1,0]

    end
  end
end