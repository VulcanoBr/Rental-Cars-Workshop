require 'rails_helper'

RSpec.describe Car, type: :model do
  it "validates presence of car_model, car_km, color, and license_plate" do
    car = build(:car, car_model: nil, car_km: nil, color: nil, license_plate: nil)
    expect(car).not_to be_valid
    expect(car.errors.full_messages).to include(
      "Modelo é obrigatório(a)", "Modelo não pode ficar em branco",
      "Quilometragem não pode ficar em branco",
      "Cor não pode ficar em branco",
      "Placa não pode ficar em branco"
    )
  end

  it 'validates presence of car_model' do
    car = build(:car, car_model: nil)
    expect(car).not_to be_valid
    expect(car.errors[:car_model][0]).to include("é obrigatório(a)")
    expect(car.errors[:car_model][1]).to include("não pode ficar em branco")
  end

  it 'validates presence of car_km' do
    car = build(:car, car_km: nil)
    expect(car).not_to be_valid
    expect(car.errors[:car_km]).to include("não pode ficar em branco")
  end

  it 'validates presence of color' do
    car = build(:car, color: nil)
    expect(car).not_to be_valid
    expect(car.errors[:color]).to include("não pode ficar em branco")
  end

  it 'validates presence of license_plate' do
    car = build(:car, license_plate: nil)
    expect(car).not_to be_valid
    expect(car.errors[:license_plate]).to include("não pode ficar em branco")
  end

  it "validates that car_km cannot be less than the actual km on update" do
    car = create(:car, car_km: 10000)
    car.car_km = 5000
    expect(car).not_to be_valid
    expect(car.errors[:car_km]).to include("Quilometragem não pode ser menor que a atual")
  end

  it "returns the car identification string" do
    car_model = create(:car_model, name: "Model X")
    car = create(:car, car_model: car_model)
    expect(car.car_identification).to eq("Model X - #{car.license_plate} - #{car.car_model.category}")
  end

  it "returns the last maintenance if the car is on maintenance" do
    provider=  create(:provider, name: 'Vulcan Ltfa', cnpj: '40.599.997/0001-62', email: 'vulcan@email.com') 
    car = create(:car, :on_maintenance)
    create(:maintenance, car: car, provider: provider)
    expect(car.current_maintenance).to be_a(Maintenance)
  end
  
  it "returns nil if the car is not on maintenance" do
    car = create(:car)
    expect(car.current_maintenance).to be_nil
  end
  

end
