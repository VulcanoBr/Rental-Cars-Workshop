# spec/models/fine_spec.rb
require 'rails_helper'

RSpec.describe Fine, type: :model do
  describe 'validations' do
    it 'should require issued_on, demerit_points, fine_value, and address' do
      fine = build(:fine, issued_on: nil, demerit_points: nil, fine_value: nil, address: nil)
      expect(fine).not_to be_valid
      expect(fine.errors[:issued_on]).to include("não pode ficar em branco")
      expect(fine.errors[:demerit_points]).to include("não pode ficar em branco")
      expect(fine.errors[:fine_value]).to include("não pode ficar em branco")
      expect(fine.errors[:address]).to include("não pode ficar em branco")
    end
  end
end
