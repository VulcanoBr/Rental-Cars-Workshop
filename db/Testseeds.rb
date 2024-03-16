require 'faker'
require 'json'

Faker::Config.locale = 'pt-BR'

def Maintenance
  40.times do
    Maintenance.create!( 
      car_id: Car.all.sample.id,
      provider_id: Provider.all.sample.id,
      invoice: Faker::Invoice.reference,
      service_cost: Faker::Commerce.price(range: 850.0..6520.0),
      maintenance_date: Faker::Date.between(from: '2020-05-23', to: Date.today)
    )
  end
end


#Address.destroy_all
#SubsidiaryCarModel.destroy_all
#Rental.destroy_all
Maintenance.destroy_all
#Fine.destroy_all
#Car.destroy_all
#Subsidiary.destroy_all
#User.destroy_all
#Manufacture.destroy_all
#CarModel.destroy_all
#Customer.destroy_all
#Provider.destroy_all

#Subsidiary()
#Users()
#Manufacture()
#CarModel()
#Customers()
#Provider()
#Fines()
Maintenance()
#Rentals()