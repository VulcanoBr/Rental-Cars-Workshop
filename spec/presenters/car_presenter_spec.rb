require 'rails_helper'

RSpec.describe CarPresenter do
  include Rails.application.routes.url_helpers

  describe '#maintenance_link' do 
    context 'admin' do
      it 'should render start maintenance link if car available' do
        subs = create(:subsidiary)
        user = create(:user, :admin, subsidiary: subs)
        car = create(:car, subsidiary: subs, status: :available)

        result = CarPresenter.new(car, user).maintenance_link

        expect(result).to include(new_car_maintenance_path(car.id))
      end

      it 'should return new_return_maintenance_path if car om maintencend' do
        subs = create(:subsidiary)
        user = create(:user, :admin, subsidiary: subs)
        car = create(:car, subsidiary: subs, status: :on_maintenance)

        result = CarPresenter.new(car, user).maintenance_link

        expect(result).to include new_return_maintenance_path(car.current_maintenance)
      end
    end

    context 'employee' do
      it 'should not render start maintenance link' do
        subs = create(:subsidiary)
        user = create(:user, subsidiary: subs)
        car = create(:car, subsidiary: subs, status: :available)

        result = CarPresenter.new(car, user).maintenance_link

        expect(result).to_not include new_car_maintenance_path(car.id)
        expect(result).to eq ''
      end
    end
  end
end
