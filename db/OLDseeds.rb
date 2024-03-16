
require 'faker'
require 'factory_bot'

Faker::Config.default_locale = 'pt-BR'

#Define a fábrica de Subsidiary

  factory :subsidiary do
    name { Faker::Company.name }
    # Gera endereço automaticamente
    after(:create) do |subsidiary|
      FactoryBot.create(:address, subsidiary: subsidiary)
    end
  end


#Define a Address de Subsidiary

  factory :address do
      street { Faker::Address.street_address }
      number { Faker::Address.building_number }
      complement { Faker::Address.secondary_address }
      neighborhood { Faker::Address.community }
      city { Faker::Address.city }
      state { Faker::Address.state }
      zipcode { Faker::Address.zip_code }
      subsidiary { Subsidiary.all.sample.id }
  end


if Subsidiary.any?
  Subsidiary.delete_all
end

# Gera 10 filiais
10.times do
  FactoryBot.create(:subsidiary)
end