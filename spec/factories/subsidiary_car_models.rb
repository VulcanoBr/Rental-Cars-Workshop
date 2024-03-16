FactoryBot.define do
  factory :subsidiary_car_model do
    price { 10 }

    association :subsidiary  # Certifique-se de que a associação com a subsidiary esteja correta
    association :car_model    # Use `association` para criar um car_model válido

    # Se você quiser manter o valor nulo para car_model em alguns casos,
    # você pode fazer algo como isto:
    transient do
   #   null_car_model { false }
    end

   # after(:build) do |instance, evaluator|
   #   instance.car_model = nil if evaluator.null_car_model
   # end
  end
end
