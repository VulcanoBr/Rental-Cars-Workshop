require 'rails_helper'

feature 'User confirm withdrawal rental scheduled' do
  
  
  
  it 'successfully' do
   subsidiary = create(:subsidiary)
   user = create(:user, subsidiary: subsidiary)
   manufacture = create(:manufacture)
   car_model = create(:car_model, manufacture: manufacture) 
   subsidiary_car_model = create(:subsidiary_car_model, price: 234.56, subsidiary_id: subsidiary.id, car_model_id: car_model.id)
   palio = create(:car_model, name: 'Palio', manufacture: manufacture)
   car = create(:car, car_model: palio, license_plate: 'XLG-1234',
                       status: :scheduled)
   customer = create(:personal_customer) 
   #allow_any_instance_of(Rental).to receive(:customer_has_active_rental).and_return(nil)
   rental = create(:scheduled_rental, car_id: car.id, user_id: user.id, 
              customer_id: customer.id, daily_price: 234.56, status: :scheduled) 
 
    login_as user
    visit root_path
    click_on 'Listar'
    click_on 'Carro(s) Agendado(s)'
    
    #visit rental_path(rentals)
    expect(page).to have_content('Carro(s) Agendado(s)')
    click_on 'Palio - XLG-1234'
    
    expect(page).to have_link('Confirmar Retirada')
  
    click_link('Confirmar Retirada')

    expect(rental.reload.active?).to be true

    expect(page).to have_current_path(rental_path(rental))
    expect(page).to have_content('Data de Retirada:')
    expect(page).to have_content('Status: em Andamento')
    expect(page).to have_link('Confirmar Devolução')
    expect(current_path).to eq rental_path(rental.id)
  end
end
